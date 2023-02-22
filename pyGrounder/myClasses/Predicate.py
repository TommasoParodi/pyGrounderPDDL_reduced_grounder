from pyGrounder.myClasses.Literal import Literal

class Predicate(Literal):
    '''
    The Predicate object represents a proposition in "<name> <argument1>..<argumentN> " format. For example: "atRobot ?r - robot ?l - room"
    
    Parameters
    ----------
    node : antlr4 tree
        The tree containing the nodes with the name of the Literal and its arguments
        
    Attributes
    ----------
    name : str
        The name of the Predicate. For example "atRobot"
    arguments : list[Variable]
        The list containing the arguments (variables) of the Predicate. For example [?r - robot, ?l - room]
    '''
    __name = ""
    __arguments = []

    def __init__(self, node):
        super().__init__(node)      
        pass

