from pyGrounder.myClasses.Domain import Domain
from pyGrounder.myClasses.Problem import Problem

#Path of the pddl files
problem_path = r"C:/Users/Desktop/test/files/problem.pddl"
domain_path = r"C:/Users/Desktop/test/files/domain.pddl"
#Path of the result folder
result_folder = r"C:/Users/Desktop/test/results"

#Creation of objects of type Domain and Problem
objDomain = Domain(domain_path)
objProblem = Problem(problem_path)
#Grounding of the Domain on a give Problem
objDomainGrounded = objDomain.ground(objProblem)

#Storing the Domains and Problem in json format in the result folder
objDomain.writeJson(result_folder,"domain")
objProblem.writeJson(result_folder,"problem")
objDomainGrounded.writeJson(result_folder,"domain_grounded")

#Writing in the result folder the Domain
objDomainGrounded.writePddl(result_folder,"domain_grounded")
