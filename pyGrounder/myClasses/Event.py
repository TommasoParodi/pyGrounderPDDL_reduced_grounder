from pyGrounder.myClasses.Operation import Operation

class Event(Operation):
    '''
    The class Event represents one event of the pddl file. It is composed by name, parameters, preconditions and effect.
    
    Parameters
    ----------
    node : antlr4 tree
        The tree containing the nodes with the event.
    
    OR
    
    name : str
        The name of the action. For example endMoving
    preconditions : list
        The list containing the objects Preconditions
    effects : list
        The list containing the ojects Effects
    '''
    def __init__(self,node = None, name = None, parameters = None, preconditions = None, effects = None):
        super().__init__(node, name, parameters, preconditions, effects)