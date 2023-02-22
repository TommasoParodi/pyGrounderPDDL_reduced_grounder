# pyGrounder
pyGrounder is a library that provides classes and methods for modeling problems defined in **Planning Domain Definition Language (PDDL+)** 
and in particular it allows to ground the domain on a defined problem.

The grounding process is performed by replacing the variables in the domain with the instances of objects present in a given associated problem.

[Domain](files/domain.pddl) + [Problem](files/problem.pddl) ---pyGrounder--> [Grounded Domain](results/domain_grounded.pddl)

## Requirements
* Python version: 3.7 or higher
* [Antlr4](https://www.antlr.org/) 
* [Antlr4 Python3 runtime target](https://www.antlr.org/download.html)

## Installation
Download the [python wheel file](pyGrounder-0.0.1-py3-none-any.whl) containing the library and run the following command:
``` bash
py -m pip install pyGrounder-0.0.1-py3-none-any.whl 
```

## Overview
The [example.py](example.py) contains an example of use where:
* ```Domain(domain_path)``` Creates an instance of the [Domain object](#domain) from the file [domain.pddl](files/domain.pddl)
* ```Problem(problem_path)``` Creates an instance of the [Problem object](#problem) from the file [problem.pddl](files/problem.pddl)
* ```objDomain.ground(objProblem)``` Returns the grounded Domain object 
* ```.writeJson(result_folder,"filename")``` Writes the object in json format in the [result_folder](results)
* ```objDomainGrounded.writePddl(result_folder,"filename")``` Writes the [pddl file](results/domain_grounded.pddl) of the Domain object

## Documentation
### Domain
This class represents the pddl file of the domain.
#### Quick look
![Immagine-modified](https://user-images.githubusercontent.com/101431140/219009467-1fd6c90c-9894-4790-a3d0-906a25e2a17b.png)



#### Attributes
* ```name : str``` The string representing the name of the domain
* ```requirements : list[str]``` The list representing the requirements of the domain
* ```types : list[str] ``` The list representing the types of the domain
* ```predicates : list[Predicate]``` The list representing the [predicates](#predicate) of the domain 
* ```functions : list[Function]``` The list representing the [functions](#function) of the domain
* ```actions : list[Action]``` The list representing the [actions](#action) of the domain
* ```events : list[Event]``` The list representing the [events](#event) of the domain
* ```processes : list[Process]``` The list representing the [processes](#process) of the domain
* ```constants :list[Variable]``` The list representing the constants of the domain

#### Methods
* ```.writeJson(file_path:str,filename:str)``` <br>
  It writes the Json representation of the Domain, naming it as filename, in the folder result at the file_path. [Example](results/domain.json)
* ```.toJson()```<br>
  It returns the dictionary containing the json representation of the domain
* ```.printAll()```<br>
  It prints in console each attributes of the domain and their values
* ```.ground(problem: Problem)```<br>
  It makes the grounding of the domain on the problem given as input. The method returns a Domain object. [Example of grounded domain](results/domain_grounded.pddl)
* ```.writePddl(file_path:str,filename:str)```<br>
  It writes the PDDL file of the Domain, naming it as filename, in the folder result at the file_path
  
------
### Problem
This class represents the pddl file of the problem.

#### Quick look
![Immagine-modified (1)](https://user-images.githubusercontent.com/101431140/219013905-880d888b-9dcd-4d40-b84e-d4f5558b7346.png)


#### Attributes
* ```name : str``` The string representing the name of the problem
* ```domain : str``` The string representing the name of the domain
* ```objects : list[dict] ``` The list representing the objects of the problem
* ```init : list[dict]``` The list of predicates that represent the initial state of the problem 
* ```goal : list[dict]``` The list of the predicates that represent the goal of the problem

#### Methods
* ```.writeJson(file_path:str,filename:str)``` <br>
  It writes the Json representation of the Problem, naming it as filename, in the folder result at the file_path. [Example](results/problem.json)
* ```.toJson()```<br>
  It returns the dictionary containing the json representation of the Problem
* ```.printAll()```<br>
  It prints in console each attributes of the Problem and their values

------
### Variable
The variable object represents a variable in ```<name> - <type>``` format. <br>
*For example:* "?r - robot"

#### Attributes
* ```name : str``` The name of the variable. <br>
*For example:* "?r"
* ```type : str``` The type of the variable. <br>
*For example:* "robot"

#### Constructor
The Variable's constructor takes in input the string in "name - type" format and it splits the string by removing the dash in order to store the name and the type. <br>
*For example:* Variable("?r - robot")

#### Methods
* ```.toString()```<br>
  It returns the whole variable in string format.<br>
  *For example:* "?r - robot"
 
------
### Literal
 The Literal object represents a proposition in ```<name> <argument1>..<argumentN>``` format. <br>
 *For example:* "atRobot ?r - robot ?l - room"
 
#### Attributes
* ```name : str``` The name of the Literal.<br>
*For example* "atRobot"
* ```arguments : list[Variable]```  The list containing the [arguments](#variable) of the Literal. <br>
*For example:* [?r - robot, ?l - room]

#### Constructor
The Predicate's constructor takes in input an antlr4 tree containing the nodes with the name of the [Literal](#literal) and its arguments<br>
*For example:* Literal(node)

------
### Predicate
The Predicate object represents a proposition in ```<name> <argument1>..<argumentN>``` format. It extends the [Literal](#literal) object.<br>
*For example:* "atRobot ?r - robot ?l - room"

#### Attributes
* ```name : str``` The name of the Predicate.<br>
*For example* "atRobot"
* ```arguments : list[Variable]```  The list containing the [arguments](#variable) of the Predicate. <br>
*For example:* [?r - robot, ?l - room]

#### Constructor
The Predicate's constructor takes in input an antlr4 tree containing the nodes with the name of the [Literal](#literal) and its arguments<br>
*For example:* Predicate(node)

------
### Function
The Function object represents a proposition in ```<name> <argument1>..<argumentN>``` format. It extends the [Literal](#literal) object.<br>
*For example:* "distance ?a - room ?b - room"

#### Attributes
* ```name : str``` The name of the Function.<br>
*For example* "atRobot"
* ```arguments : list[Variable]```  The list containing the [arguments](#variable) of the Function. <br>
*For example:* [?a - room ?b - room]

#### Constructor
The Predicate's constructor takes in input an antlr4 tree containing the nodes with the name of the [Literal](#literal) and its arguments<br>
*For example:* Function(node)

------
### Parameter
This class represents one parameter for the action/event/process. It inherits everything from the [Variable class](#variable)

------
### Precondition
The Precondition class represents one precondition for the action/process/event. It only contains one predicate, that can be a [SimplePredicate](#simplepredicate), [NegatedPredicate](#negatedpredicate) or [ComposedPredicate](#composedpredicate)

#### Attributes
* ```predicate : SimplePredicate | NegatedPredicate | ComposedPredicate```

#### Constructor
The Precondition's constructor can take as input:
* or an antlr4 tree containing the node with the precondition
* or one predicate between [SimplePredicate](#simplepredicate), [NegatedPredicate](#negatedpredicate), [ComposedPredicate](#composedpredicate)

#### Methods
* ```.getString()```
  It returns the string of the Precondition
  
------
### Effect
The Effect class represents one effect for the action/process/event. It only contains one predicate, that can be a [SimplePredicate](#simplepredicate), [NegatedPredicate](#negatedpredicate) or [ComposedPredicate](#composedpredicate)

#### Attributes
* ```predicate : SimplePredicate | NegatedPredicate | ComposedPredicate```

#### Constructor
The Effect's constructor can take as input:
* or an antlr4 tree containing the node with the effect
* or one predicate between  [SimplePredicate](#simplepredicate), [NegatedPredicate](#negatedpredicate), [ComposedPredicate](#composedpredicate)

#### Methods
* ```.getString()```
  It returns the string of the Effect
  
------
### SimplePredicate
This class represents a SimplePredicate in this form: ```<name> <argument1>..<argumentN>```.<br>
*For Example:* "atRobot ?r ?b"

#### Attributes
* ```string : str ``` The string of the whole predicate into brackets. <br>
 *For example:* "(atRobot ?r ?b)
* ```name : str ```  The name of the predicate. <br>
  *For example:* "atRobot"
* ``` arguments:List[str]```  The list containing the string of each argument. <br>
  *For example:* [?r, ?b]
* ```isComplex:False```  Metadata for some operations, it means it's not a composed predicate
* ```isNegated:False``` Metadata for some operations, it means it's not a negated predicate

#### Constructor
The constructor can take as input:
* or a string containing the predicate <br>
  *For example:* SimplePredicate("atRobot ?r ?b")
* or the parameters for the name and the arguments <br>
  *For example:* SimplePredicate(name = "atRobot", arguments = ["?r", ?b"])
  
#### Methods
* ```.getString()```
  It returns the string of the predicate into brackets. <br>
  *For example:* "(atRobot ?r ?b)"
  
------
### NegatedPredicate
  This class represents a Negated Predicate in this form:  ```not <name> <argument1>..<argumentN>```.<br>
*For Example:* "not(atRobot ?r ?b)"

#### Attributes
* ```string : str ``` The string of the whole predicate into brackets. <br>
 *For example:*  "(not (atRobot ?r ?b))"
* ```name : str ```  The name of the predicate. <br>
  *For example:* "atRobot"
* ``` arguments:List[str]```  The list containing the string of each argument. <br>
  *For example:* [?r, ?b]
* ```isComplex:False```  Metadata for some operations, it means it's not a composed predicate
* ```isNegated:True``` Metadata for some operations, it means it's a negated predicate

#### Constructor
The constructor can take as input:
* or a string containing the predicate <br>
  *For example:* NegatedPredicate(" not(atRobot ?r ?b)")
* or the parameters for the name and the arguments <br>
  *For example:* NegatedPredicate(name = "atRobot", arguments = ["?r", ?b"])
  
#### Methods
* ```.getString()```
  It returns the string of the predicate into brackets. <br>
  *For example:* "not((atRobot ?r ?b))"
  
------
### ComposedPredicate
This class represents a Composed Predicate in this form:  ```operation <argument1> <argument2>```. <br>
*For Example:* " >= (distanceRun ?r ?a ?b) (distance ?a ?b)"

#### Attributes
* ```string : str ``` The string of the whole predicate into brackets. <br>
 *For example:*  "(>= (distanceRun ?r ?a ?b) (distance ?a ?b))"
* ```name : str ``` The name of the operation. <br>
  *For example:* ">="
* ```arguments:List[SimplePredicate|ConstantPredicate|ComposedPredicate]```  The list containing the predicate of each argument. <br>
  *For example:* [(distanceRun ?r ?a ?b),(distance ?a ?b)]
* ```isComplex:True```   Metadata for some operations, it means it's a composed predicate
* ```isNegated:False``` Metadata for some operations, it means it's not a negated predicate

#### Constructor
The constructor can take as input:
* or a string containing the predicate <br>
  *For example:* NegatedPredicate(" not(atRobot ?r ?b)")
* or the parameters for the name and the arguments <br>
  *For example:* NegatedPredicate(name = "atRobot", arguments = ["?r", ?b"])
  
#### Methods
* ```.toString()```
  It returns the string of the predicate into brackets. <br>
  *For example:* "(>= (distanceRun ?r ?a ?b) (distance ?a ?b))"
  
------
### Operation
The class Operation is the generalization of actions,processes and events. It is composed by name, parameters, preconditions and effect.

#### Attributes
* ```name : str ``` The name of the operation. <br>
 *For example:* "StartMoving"
* ```parameters : list[Parameters]``` The list containing the objects Parameter
* ```preconditions : list[Precondition]``` The list containing the objects Precondition.
* ```effect : list[Effect]```  The list containing the ojects Effect

#### Constructor
The constructor can take as input:
* or an antlr4 tree containing the operation <br>
  *For example:* Operation(node)
* or the parameters for the name, parameters, preconditions and effect <br>
 *For example:* Operation(name= "name_string",parameters=[], preconditions=[precondition1 : Precondition, precondition2 : Precondition], effects = [effect1 : Effect, effect2 : Effect)]
 
------
### Action
The class Action represents one action of the pddl file. It is composed by name, parameters, preconditions and effect. It inherits everything by the [Operation class](#operation)

------
### Process
The class Process represents one process of the pddl file. It is composed by name, parameters, preconditions and effect.It inherits everything by the [Operation class](#operation)

------
### Event
The class Event represents one event of the pddl file. It is composed by name, parameters, preconditions and effect.It inherits everything by the [Operation class](#operation)
