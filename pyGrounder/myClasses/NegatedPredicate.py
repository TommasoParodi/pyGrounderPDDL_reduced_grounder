class NegatedPredicate():

    '''
    This class represents a Negated Predicate in this form: not <name> <argument1>..<argumentN>. For Example: not(atRobot ?r ?b)
    
    Parameters
    ----------
    node : antlr4 tree
        The node containing the string of the predicate. For example: "not (atRobot ?r ?b)"
    
    OR
    
    name : str
        The name of the predicate. For example: atRobot
    arguments:List[str]
        The list containing the string of each argument. For example [?r, ?b]
    
    Attributes
    ----------
    string:str
        The string of the whole predicate into brackets.  For example: "(not (atRobot ?r ?b))"
    name : str
        The name of the predicate. For example: atRobot
    arguments:List[str]
        The list containing the string of each argument. For example [?r, ?b]
    isComplex:False
        Metadata for some operations, it means it's not a composed predicate
    isNegated:True
        Metadata for some operations, it means it's a negated predicate
    '''
    __string = ""
    __name = ""
    __arguments = []
    __isComplex = False
    __isNegated = True
    

    def __init__(self,node = None,string= None, name = None,arguments = None, PreOrEff = None ):
        if node != None:
            if PreOrEff == "effect":
                self.__arguments = []
                self.__string = "("+string+")"
                name = string.split(" ")
                self.__name = node.getChild(0).getText()
                for child in range(1, node.getChildCount()):
                    if node.getChild(child).getText() != "(" and node.getChild(child).getText() != ")":
                        self.__arguments.append(node.getChild(child).getText())
            elif PreOrEff == "precondition":
                self.__arguments = []
                self.__string = "("+string+")"
                self.__name = node.getChild(3).getChild(0).getText()
                if node.getChild(3).getChildCount() > 1:
                    for child in range (1, node.getChild(3).getChildCount()):
                        self.__arguments.append(node.getChild(3).getChild(child).getText())

            
        else:
            self.__name = name
            self.__arguments = arguments
            string = name
            for argument in self.__arguments:
                string = string + " " + argument
            self.__string = "(not ("+string+"))"

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

    def printPredicato(self):
        print(self.__string)
        print("\n")
        print("name: " + self.__name)
        print("arguments :"+ str(self.__arguments))
        print("\n")
    
    def printStringPredicate(self):
        print(self.__string)

    def toString(self):
        '''
        It returns the string of the predicate into brackets.  For example: "(not(atRobot ?r ?b))
        '''
        return self.__string