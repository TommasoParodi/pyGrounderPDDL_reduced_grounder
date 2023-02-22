from pyGrounder.myClasses.Operation import Operation

class Action(Operation):
    '''
    The class Action represents one action of the pddl file. It is composed by name, parameters, preconditions and effect.
    
    Parameters
    ----------
    node : antlr4 tree
        The tree containing the nodes with the action.
    
    OR
    
    name : str
        The name of the action. For example StartMoving
    preconditions : list
        The list containing the objects Preconditions
    effects : list
        The list containing the ojects Effects
    '''
    def __init__(self,node = None, name = None, parameters = None, preconditions = None, effects = None):
        super().__init__(node, name, parameters, preconditions, effects)