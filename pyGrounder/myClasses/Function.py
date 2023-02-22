from pyGrounder.myClasses.Literal import Literal

class Function(Literal):
    '''
    The Function object represents a proposition in "<name> <argument1>..<argumentN> " format. For example: "distance ?a - room ?b - room"
    
    Parameters
    ----------
    node : antlr4 tree
        The tree containing the nodes with the name of the Literal and its arguments
        
    Attributes
    ----------
    name : str
        The name of the Function. For example "distance"
    arguments : list[Variable]
        The list containing the arguments (variables) of the Function. For example [?a - room ?b - room]
    '''
    __name = ""
    __arguments = []

    def __init__(self, node):
        super().__init__(node)      
        pass