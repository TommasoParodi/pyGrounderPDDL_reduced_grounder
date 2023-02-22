from pyGrounder.myClasses.Parameter import Parameter
from pyGrounder.myClasses.Precondition import Precondition
from pyGrounder.myClasses.Effect import Effect

class Operation:
    '''
    The class Operation is the generalization of actions,processes and events. It is composed by name, parameters, preconditions and effect.
    
    Parameters
    ----------
    node : antlr4 tree
        The tree containing the nodes with the action, process or event.
    
    OR
    
    name : str
        The name of the operation. For example StartMoving
    preconditions : list
        The list containing the objects Preconditions
    effects : list
        The list containing the ojects Effects
    '''
    __name= ""
    __parameters = [Parameter]
    __preconditions = []
    __effects = []
       
    def __init__(self,node = None, name = None, parameters = None, preconditions = None, effects = None):

        def getParameters(node):
            '''
            It returns the list of Parameters built from the antlr4 tree containing the parameters of the operation
            
            Parameters
            ----------
            node : antlr4 tree
            
            Return
            ------
            List[Parameter]
            '''
            result = []
            for child in range (5, node.getChildCount()-1):
                if node.getChild(child).getText() == ')':
                    return result
                else: result.append(Parameter(node.getChild(child).getText()))

        def getPreconditions (node):
            '''
            It returns the list of Preconditions built from the antlr4 tree containing the preconditions of the operation
            
            Parameters
            ----------
            node : antlr4 tree
            
            Return
            ------
            List[Precondition]
            '''
            result = []

            for child in range(node.getChildCount()-1):
                if  ":precondition" in node.getChild(child).getText():
                    node = node.getChild(child)
                    break
            for child in range (3, node.getChildCount()-1):
                precondition = Precondition(node.getChild(child))
                result.append(precondition)
            return result

        def getEffects(node):
            '''
            It returns the list of Effects built from the antlr4 tree containing the effects of the operation
            
            Parameters
            ----------
            node : antlr4 tree
            
            Return
            ------
            List[Effect]
            '''
            result = []
            for child in range(node.getChildCount()-1):
                if  ":effect" in node.getChild(child).getText():
                    node = node.getChild(child)
                    break
            for child in range (3, node.getChildCount()-1):
                effect = Effect(node.getChild(child))
                result.append(effect)
            return result

        if node != None:
            node = node.getChild(0)
            self.__name = node.getChild(2).getText()
            self.__parameters = getParameters(node) 
            self.__preconditions = getPreconditions(node)
            self.__effects = getEffects(node)
        else:
            self.__name = name
            self.__parameters = []
            self.__preconditions = preconditions
            self.__effects = effects



    @property
    def name(self):
        return self.__name

    @name.setter
    def name(self, name):
        self.__name = name

    @property
    def parameters(self):
        return self.__parameters

    @parameters.setter
    def parameters(self, parameters):
        self.__name = parameters

    @property
    def preconditions(self):
        return self.__preconditions

    @preconditions.setter
    def preconditions(self, preconditions):
        self.__preconditions = preconditions

    @property
    def effects(self):
        return self.__effects
    
    def printParameters(self):
        print("PARAMETERS: ")
        if self.__parameters:
            for parameter in self.__parameters:
                print(parameter.toString())
        else: print("()")
        #print("\n")

    def printPreconditions(self):
        print("PRECONDITIONS: ")
        for precondition in self.__preconditions:
            precondition.getString()
            #print("\n")
    
    def printEffects(self):
        print("EFFECTS: ")
        for effect in self.__effects:
            effect.getString()
            #print("\n")

    def write(self,f, ActionEventProcess:str):
        f.write(" "*4 + "(:"+ActionEventProcess + " "+ self.__name + "\n")
        if self.__parameters:            
            f.write(" "*8 + ":parameters (")
            for parameter in self.__parameters:
                f.write(" "+parameter.toString())
            f.write(" )" + "\n")
        else:
            f.write(" "*8 + ":parameters ()" + "\n")
        f.write(" "*8 + ":precondition (and" + "\n")
        for precondition in self.__preconditions:
            f.write(" "*10 + precondition.predicate.toString() + "\n")
        f.write(" "*8 +")"+ "\n")
        f.write(" "*8 + ":effect (and" + "\n")
        for effect in self.__effects:
            f.write(" "*10 + effect.predicate.toString() + "\n")
        f.write(" "*8 +")"+ "\n")
        f.write(" "*4+")\n")
    