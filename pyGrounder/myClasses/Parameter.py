from pyGrounder.myClasses.Variable import Variable

class Parameter(Variable):
    '''
    This class represents one parameter for the action/event/process. It inherits everything from the Variable class'''
    def __init__(self, node):
        super().__init__(node)
    pass