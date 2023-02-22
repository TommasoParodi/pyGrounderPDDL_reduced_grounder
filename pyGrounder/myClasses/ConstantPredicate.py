class ConstantPredicate():
    '''
    It represents a constant or the #t symbol in a predicate.
    
    Parameters
    ----------
    node : antlr4 tree
        The node which contains the constant or the #t symbol
    
    OR
    
    value : str
        The string containing the constant or the #t symbol
    '''
    __name = ""
    __value = 0
    __arguments = []
    __isComplex = False
    __isNegated = False

    def __init__(self, node = None, value = None):
        if node != None:
            if node.getText() == "#t":
                self.__name = "Time"
            else : self.__name = "Constant"
            self.__value = node.getText()
        elif value =="#t":
            self.__name = "Time"
            self.__value = "#t"
        else:
            self.__name = "Constant"
            self.__value = value

    def printPredicato(self):
        print("valore :"+ self.__value)
        print("\n")

    @property
    def name(self):
        return self.__name

    @property
    def value(self):
        return self.__value

    @property
    def isComplex(self):
        return self.__isComplex

    @property
    def isNegated(self):
        return self.__isNegated

    @property
    def arguments(self):
        return self.__arguments

    def printStringPredicate(self):
        print(self.__value)

    def toString(self):
        return " "+str(self.__value)