class SimplePredicate:

    '''
    This class represents a SimplePredicate in this form: <name> <argument1>..<argumentN>. For Example: atRobot ?r ?b
    
    Parameters
    ----------
    string : str
        The string containing the predicate. For example: "atRobot ?r ?b"
    
    OR
    
    name : str
        The name of the predicate. For example: atRobot
    arguments:List[str]
        The list containing the string of each argument. For example [?r, ?b]
    
    Attributes
    ----------
    string:str
        The string of the whole predicate into brackets.  For example: "(atRobot ?r ?b)
    name : str
        The name of the predicate. For example: atRobot
    arguments:List[str]
        The list containing the string of each argument. For example [?r, ?b]
    isComplex:False
        Metadata for some operations, it means it's not a composed predicate
    isNegated:False
        Metadata for some operations, it means it's not a negated predicate
    '''
   
    
    __string = ""
    __name = ""
    __arguments = []
    __isComplex = False
    __isNegated = False

    def __init__(self, string = None, name = None, arguments = None):
        if string != None:
            self.__string = "("+string+")"
            name = string.split(" ")
            self.__name = name[0]
            self.__arguments = name[1:]
        else:
            self.__name = name
            self.__arguments = arguments
            string = name
            for argument in self.__arguments:
                string = string + " " + argument
            self.__string = "("+string+")"

    def printStringPredicate(self):
        print(self.__string)

    @property
    def isComplex(self):
        return self.__isComplex

    @property
    def isNegated(self):
        return self.__isNegated

    @property
    def string(self):
        return self.__string
    
    @property
    def arguments(self):
        return self.__arguments
    
    @property
    def name(self):
        return self.__name

    def toString(self):
        '''
        It returns the string of the predicate into brackets.  For example: "(atRobot ?r ?b)
        '''
        return self.__string