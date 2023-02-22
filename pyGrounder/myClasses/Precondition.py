from pyGrounder.myClasses.SimplePredicate import SimplePredicate
from pyGrounder.myClasses.NegatedPredicate import NegatedPredicate
from pyGrounder.myClasses.ConstantPredicate import ConstantPredicate
from pyGrounder.myClasses.ComposedPredicate import ComposedPredicate
from pyGrounder.myClasses.myUtilities import process_string


class Precondition:
    '''
    The Precondition class represents one Precondition for the action/process/event. It only contains one predicate, that can be a SimplePredicate, NegatedPredicate or ComposedPredicate
    
    Parameters
    ----------
    node : antrl4 tree
    
    OR
    
    predicate : SimplePredicate | NegatedPredicate | ComposedPredicate
    
    Attributes
    ----------
    predicate : SimplePredicate | NegatedPredicate | ComposedPredicate '''

    __predicate = None


    def __init__(self, node = None, predicate = None):

        if node != None:
            string = node.getText()
            OPERATORS = [">", ">=", "<", "<=", "=", "assign", "increase", "decrease", "*", "or"]
            SPECIALOPERATORS = [ "or", "and", "-","+","/"]
            predicateString = process_string(string)
            predicate = predicateString.split(" ")
            if predicate[0] == "not":
                #print(node.getChild(0).getText())
                #print(node.getChild(0).getChild(2).getText())
                #print(node.getChild(0).getChild(2).getChild(1).getText())
                try: 
                    text = node.getChild(0).getChild(2).getChild(1).getText()
                except:
                    self.__predicate = NegatedPredicate(node.getChild(0), predicateString, PreOrEff = "precondition")
                else: 
                        self.__predicate = ComposedPredicate(node.getChild(0).getChild(2),predicateString, PreOrEff = "effect", isNegated= True)
            elif predicate[0] in OPERATORS:
                self.__predicate = ComposedPredicate(node, predicateString, PreOrEff = "precondition")
            elif predicate[0] in SPECIALOPERATORS:
                #print(string)
                pass
            else:
                self.__predicate = SimplePredicate(predicateString) 
        else:
            self.__predicate = predicate

    def getString(self):
        '''
        It return the string of the Precondition
        '''
        self.__predicate.printStringPredicate()

    @property
    def predicate(self):
        return self.__predicate

    
    def predicateAsDict(self):
        '''
        It returns the dict containing the details of the Precondition in order to write its Json representation
        '''

        def makeDictOfPredicates(predicate):
            result = {}
            if not isinstance(predicate, ComposedPredicate) and not isinstance(predicate, ConstantPredicate):
                result["preconditionString"] = predicate.string
                result["isNegated?"] = predicate.isNegated
                result["isOperation?"] = predicate.isComplex
                result["Name"] = predicate.name
                result["Parameters"] = predicate.arguments
            elif isinstance(predicate, ComposedPredicate):
                result["preconditionString"] = predicate.string
                result["isNegated?"] = predicate.isNegated
                result["isOperation?"] = predicate.isComplex
                result["Name"] = predicate.name
                result["Parameters"] = []
                for parameter in predicate.arguments:
                    result["Parameters"].append(makeDictOfPredicates(parameter))
            elif isinstance(predicate, ConstantPredicate):
                result["preconditionString"] = predicate.value
                result["Name"] = predicate.name
                result["Parameters"] = predicate.arguments
                result["isNegated?"] = predicate.isNegated
                result["isOperation?"] = predicate.isComplex
            return result

        result = makeDictOfPredicates(self.__predicate)
        
        return result

