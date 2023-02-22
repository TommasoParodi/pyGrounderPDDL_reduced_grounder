from pyGrounder.myClasses.SimplePredicate import SimplePredicate
from pyGrounder.myClasses.ConstantPredicate import ConstantPredicate
from pyGrounder.myClasses.NegatedPredicate import NegatedPredicate
from pyGrounder.myClasses.myUtilities import process_string2

def process_string(string):
            string = string.replace("?", " ?")
            string = string.replace("("," (")
            string = string.replace("*", "* ")
            return string

class ComposedPredicate():
    '''
    This class represents a Composed Predicate in this form: operation <argument1> <argument2>. For Example: >= (distanceRun ?r ?a ?b) (distance ?a ?b)
    
    Parameters
    ----------
    node : antlr4 tree
        The node containing the string of the predicate. For example: ">= (distanceRun ?r ?a ?b) (distance ?a ?b)"
    
    OR
    
    name : str
        The name of the operation of the predicate. For example: >=
    arguments:List[SimplePredicate|ConstantPredicate|ComposedPredicate]
        The list containing the predicate of each argument. For example [(distanceRun ?r ?a ?b),(distance ?a ?b)
    
    Attributes
    ----------
    string:str
        The string of the whole predicate into brackets.  For example: "(>= (distanceRun ?r ?a ?b) (distance ?a ?b))"
    name : str
        The name of the operation. For example: >=
    arguments:List[SimplePredicate|ConstantPredicate|ComposedPredicate]
        The list containing the predicate of each argument. For example [(distanceRun ?r ?a ?b),(distance ?a ?b)
    isComplex:True
        Metadata for some operations, it means it's a composed predicate
    isNegated:False
        Metadata for some operations, it means it's not a negated predicate
    '''
    __string = ""
    __name = ""
    __arguments = []
    __isComplex = True
    __isNegated = False

    def __init__(self,node = None,string = None, name = None, arguments = None, PreOrEff = None, isNegated = False):
        
        def getOperands(node,PreOrEff = None):
            if node.getChildCount() == 0:
                return ConstantPredicate(node)
            elif "(" not in node.getText():
                return SimplePredicate(process_string2(node.getText()))
            elif "not" in node.getText(): 
                if (">" not in node.getText()) and  (">=" not in node.getText()) and  ("<" not in node.getText()) and  ("<=" not in node.getText()):
                    return NegatedPredicate(node.getChild(3), (process_string2(node.getText())), PreOrEff = "effect")
                else : return ComposedPredicate(node.getChild(2),(process_string2(node.getText())),PreOrEff= "effect", isNegated=True)
                        #print(node.getChild(2).getText())
            else: return ComposedPredicate(node,(process_string2(node.getText())),PreOrEff= PreOrEff)


        if node != None:

            if node.getText()[1] == "-" or  node.getText()[1] == "/"  or  node.getText()[1] == "+":
                self.__isNegated = isNegated
                self.__arguments = []
                self.__string = "("+string+")"

                self.__name = node.getChild(1).getText()
                #aggiungo qui-------------------------------------------------------
                #print(node.getText())
                #print(node.getChildCount())
                for child in range (2, node.getChildCount()):
                    if node.getChild(child).getText() != "(" and node.getChild(child).getText() != ")":
                        self.__arguments.append(getOperands(node.getChild(child),PreOrEff))

                pass
                #togli questi commenti per tornare indietro-----------------------------
                #self.__arguments.append(getOperands(node.getChild(3),PreOrEff))
                #self.__arguments.append(getOperands(node.getChild(6),PreOrEff))
            else: 
                self.__isNegated = isNegated
                if PreOrEff == "precondition":
                    node = node.getChild(0)
                self.__arguments = []
                self.__string = "("+string+")"

                self.__name = node.getChild(1).getText()
                for child in range (2, node.getChildCount()-1):
                    if node.getChild(child).getText() != "(" and node.getChild(child).getText() != ")":
                        self.__arguments.append(getOperands(node.getChild(child),PreOrEff))

        else:
            self.__name = name
            self.__arguments = arguments
            string = name
            self.__isNegated = isNegated
            for argument in self.__arguments:
                string = string + argument.toString()
            if self.__isNegated:
                self.__string = "(not( "+ string + "))"
            else:
                self.__string = "("+string+")"


    @property
    def string(self):
        return self.__string

    @property
    def isComplex(self):
        return self.__isComplex

    @property
    def isNegated(self):
        return self.__isNegated
    
    @property
    def arguments(self):
        return self.__arguments
    
    @property
    def name(self):
        return self.__name

    def toString(self):
        return self.__string

    def printStringPredicate(self):
        print(self.__string)
