class Variable:
    '''
    The variable object represents a variable in "<name> - <type>" format. For example "?r - robot"
    
    Parameters
    ----------
    string : str
        The string in "name - type" format is split by removing the dash in order to store the name and the type. For example "?r - robot"
    
    Attributes
    ----------
    name : str
        It stores the name of the variable. For example "?r"

    type : str
        It stores the type of the variable. For example "robot"
    '''
    __name = ""
    __type = ""
    
    def __init__(self, string:str):
        self.__name = string.split("-")[0]
        self.__type = string.split("-")[1]

    @property
    def name(self):
        return self.__name

    @name.setter
    def name(self, name):
        self.__name = name
    
    @property
    def type(self):
        return self.__type

    @type.setter
    def type(self, type):
        self.__type = type
    
    def toString(self):
        '''
        It returns the whole variable in string format. For example "?r - robot"
        '''
        return (self.__name + " - " + self.__type)
