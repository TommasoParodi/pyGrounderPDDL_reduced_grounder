from pyGrounder.myClasses.Variable import Variable

class Literal:
    '''
    The Literal object represents a proposition in "<name> <argument1>..<argumentN> " format. For example: "atRobot ?r - robot ?l - room"
    
    Parameters
    ----------
    node : antlr4 tree
        The tree containing the nodes with the name of the Literal and its arguments
        
    Attributes
    ----------
    name : str
        The name of the Literal. For example "atRobot"
    arguments : list[Variable]
        The list containing the arguments (variables) of the Literal. For example [?r - robot, ?l - room]
    '''
    __name = ""
    __arguments = []

    def __init__(self, node):
        self.__name = node.getChild(1).getText()
        self.__arguments = []
        for i in range (2, node.getChildCount()-1):
            self.__arguments.append(Variable(node.getChild(i).getText()))        
        pass

    @property
    def name(self):
        return self.__name

    @name.setter
    def name(self, name):
        self.__name = name

    @property
    def arguments(self):
        return self.__arguments

    @arguments.setter
    def arguments(self, arguments):
        self.__arguments = arguments

    @property
    def argumentsAsList(self):
        result = []
        for argument in self.__arguments:
            result.append({"parameterName": argument.name, "parameterType": argument.type})
        return result

    def toString(self):
        '''
        It returns the string in <name> <argument1>..<argumentN> format. For example "atRobot ?r - robot ?l - room"
        '''
        result = ""
        for argument in self.__arguments:
            result = result + " " + argument.toString()
        return (self.__name + result)

    def write(self, f):
        '''
        It writes the Literal on file with the pddl identation, this method is called by the Domain class write function
        
        Parameters
        ----------
        f : TextIOWrapper
            The file where the function is going to write on '''
        f.write(" "*8+"("+self.__name)
        for parameter in self.__arguments:
             f.write(" "+parameter.name+" - "+parameter.type)
        f.write(")\n")