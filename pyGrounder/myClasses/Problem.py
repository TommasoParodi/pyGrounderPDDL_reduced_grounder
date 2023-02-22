import json
from pyGrounder.myClasses.myUtilities import remove_comments
from pyGrounder.myClasses.myUtilities import get_antlr4_parsetree

class Problem:
    '''
    This object represents the pddl Problem.
    
    Parameter
    ---------
    file_path : string
        The path of the problem.pddl file 
        
    Attributes
    ----------
    name : str
        The name of the problem. For example: Problem1
    domain : str
        The name of the domain. For example: robot
    objects : list[dict]
        The list of problem objects. Each element is a dict {"objectType" : <string>, "objectIstances" [<string1>,..<stringN>]}. For example [{objectType: robot, objectIstances: [robot1, robot2]}]
    init : list[dict]
        The list of initialization predicates. Each element is a dict.
    goal : list[dict]
        The list of goal predicates. Each element is a dict.
    '''
    __name = ""
    __domain = ""
    __objects = []
    __init = []
    __goal = []


    def __init__(self,file_path):

        def getProblemName(stringa):
            stringa = stringa.replace("(problem", "")
            stringa = stringa.replace(")", "")
            return stringa.strip()

        def getDomainName(stringa):
            stringa = stringa.replace("(:domain", "")
            stringa = stringa.replace(")", "")
            return stringa.strip()

        def getObjectsList(node):
            result = []
            for child in range(2, node.getChildCount()-1):
                result.append(getObjects(node.getChild(child)))
            return result

        def getObjects(node):
            result = {}
            lista_di_oggetti = []
            result["objectType"] = node.getChild(-1).getText()
            for child in range(node.getChildCount()-2):#-2 perchè il penultimo è "-" e -1 è il tipo
                lista_di_oggetti.append(node.getChild(child).getText())
            result["objectIstances"] = lista_di_oggetti    
            return result

        def getInitList(node):
            result = []
            for child in range(2, node.getChildCount()-1):
                if "=" in node.getChild(child).getText():
                    result.append(getAssignmentPredicate(node.getChild(child)))
                else:
                    result.append(getSimplePredicate(node.getChild(child)))
            return result

        def getSimplePredicate(node):
            result = {}
            if node.getChildCount() == 1:
                result = getSimplePredicate(node.getChild(0))
            else:
                result["string"] = node.getText()
                result["isAssignment?"] = False
                result["predName"] = node.getChild(1).getText()
                result["predObjects"] = []
                for child in range(2, node.getChildCount()-1):
                    result["predObjects"].append(node.getChild(child).getText())
                return result
            return result

        def getAssignmentPredicate(node):
            result = {}
            if node.getChildCount() == 1:
                result = getAssignmentPredicate(node.getChild(0))
            else:
                result["string"] = node.getText()
                result["isAssignment?"] = True
                result["operands"] = []
                result["operands"].append(getOperand(node.getChild(2)))
                result["operands"].append(getConstant(node.getChild(3)))

            return result

        def getOperand(node):
            result = {}
            result["operandName"] = node.getChild(1).getText()
            result["operandObjects"] = []
            for child in range(2, node.getChildCount()-1):
                result["operandObjects"].append(node.getChild(child).getText())
            return result

        def getConstant(node):
            result ={}
            result["operandName"] = "Constant"
            result["operandValue"] = node.getText()
            return result


        def getGoalList(node):
            #print(node.getChild(4).getText())
            #node = node.getChild(2)
            result = []
            for child in range(4, node.getChildCount()-2):
                result.append(getGoalPredicate(node.getChild(child)))
            return result

        '''
        def getGoalPredicate(node):
            result = {}
            if node.getChildCount() == 1:
                result = getSimplePredicate(node.getChild(0))
            else:
                result["string"] = node.getText()
                result["predName"] = node.getChild(1).getText()
                result["predObjects"] = []
                for child in range(2, node.getChildCount()-1):
                    result["predObjects"].append(node.getChild(child).getText())
                return result
            return result
        '''

        def getGoalPredicate(node):
            result = {}
            if node.getChildCount() == 1:
                result = getSimplePredicate(node.getChild(0))
                del result["isAssignment?"]
                result["isOperation?"] = False
                result["isNegated?"] = False
            elif "=" in node.getText() or ">" in node.getText() or "<" in node.getText():
                result["string"] = node.getText()
                result["predName"] = node.getChild(1).getText()
                result["isOperation?"] = True
                result["isNegated?"] = False
                result["predObjects"] = []
                parameterResult = {}
                parameterResult["predName"] = node.getChild(3).getText()
                parameterResult["predObjects"] = []

                for child in range(4, node.getChildCount()-2):
                    if node.getChild(child).getText() == ")":
                        break
                    parameterResult["predObjects"].append(node.getChild(child).getText())
                result["predObjects"].append(parameterResult)
                constant = {}
                constant["predName"] = "Constant"
                constant["value"] = node.getChild(node.getChildCount()-2).getText()
                result["predObjects"].append(constant)
            else : #not case
                result["string"] = node.getText()
                result["isOperation?"] = False
                result["isNegated?"] = True
                result["predName"] = node.getChild(2).getText()
                return result
            return result
 




        file = remove_comments(file_path)
        tree = get_antlr4_parsetree(file).problem()

        for i in range (tree.getChildCount()):
            if 'problem' in tree.getChild(i).getText():
                self.__name = getProblemName(tree.getChild(i).getText())

            if ':domain' in tree.getChild(i).getText():
                self.__domain = getDomainName(tree.getChild(i).getText())
                
            elif ':objects' in tree.getChild(i).getText():
                self.__objects = getObjectsList(tree.getChild(i))

            elif ':init' in tree.getChild(i).getText():
                self.__init = getInitList(tree.getChild(i))

            elif ':goal' in tree.getChild(i).getText():
                self.__goal = getGoalList(tree.getChild(i))
  


    @property
    def name(self):
        return self.__name

    @property
    def domain(self):
        return self.__domain

    @property
    def objects(self):
        return self.__objects

    @property
    def init(self):
        return self.__init

    @property
    def goal(self):
        return self.__goal

    def toJson(self):
        json_data = {}
        json_data['problem'] = self.__name
        json_data['domain'] = self.__domain
        json_data['objects'] = self.__objects
        json_data['init'] = self.__init
        json_data['goal'] = self.__goal
        return json_data


    def writeJson(self,file_path:str,filename:str):
        with open(file_path+"/"+filename+".json", 'w') as json_file:
            json.dump(self.toJson(), json_file, indent= 4)

    def printALL(self):
        print("----------------------------Problem name: ------------------------------------------------")
        print(self.__name+ "\n")
        print("----------------------------Domain name: -------------------------------------------------")
        print(self.__domain+ "\n")
        print("----------------------------Objects: -----------------------------------------------------")
        for object in self.__objects:
            print(object["objectType"] +" - "+ str(object["objectIstances"]))
            #print(object)
        print("----------------------------init: --------------------------------------------------------")
        for init in self.__init:
            print(init["string"])
        print("----------------------------goal: --------------------------------------------------------")
        for goal in self.__goal:
            print(goal["string"])
        



