grammar pddl;



/************* LEXER ****************************/

LP : '(';
RP : ')';
QUOTE : '"';
COMMA : ',';
DEFINE : 'define';
PROBLEM : 'problem';
DOMAIN : 'domain';
REQUIREMENTS : ':requirements';
TYPES : ':types';
PREDICATES : ':predicates';
FUNCTIONS : ':functions';
ACTION : ':action';
PARAMETERS : ':parameters';
PRECONDITION : ':precondition';
EFFECT : ':effect';
PROCESS : ':process';
EVENT : ':event';
INCREASE : 'increase';
DECREASE : 'decrease';

NAME:    LETTER ANY_CHAR* ;
fragment LETTER : 'a'..'z' | 'A'..'Z';
fragment ANY_CHAR : LETTER | '0'..'9' | '-' | '_';
VARIABLE : '?' NAME ;
fragment DIGIT: '0'..'9';
NUMBER : ('-')? DIGIT+ ('.' DIGIT+)? | '#t' ;
WS : [ \t\r\n]+ -> skip ;

REQUIRE_KEY
    : ':typing'
    | ':duration-inequalities'
    | ':time'
    | ':fluents'
    | ':adl'
    | ':durative-actions'
    ;

OPERATION
	: '>'
	| '>='
	| '<'
	| '<='
	| '='
	| '+'
	| '-'
	| '*'
	| '/'
	| 'and'
	| 'or'
	;

	/************* Start of grammar *******************/

pddlDoc : domain | problem;

/************* DOMAINS ****************************/

domain
    : '(' 'define' domainName 
	requireDef?
    typesDef?
	predicatesDef?
    functionsDef?
	structureDef*
	RP
    ;

domainName
    : LP DOMAIN NAME RP
    ;

requireDef
	: LP REQUIREMENTS REQUIRE_KEY+ RP
	;

typesDef
	: LP TYPES (NAME('-' NAME)?)+ RP
	;

predicatesDef
	: LP PREDICATES predicate+ RP
	;

predicate
	: LP NAME typedVariable* RP
	;


/* name stringa - stringa */
atomicFormulaSkeleton
	: LP NAME typedVariable+ RP
	;

typedVariable
	: VARIABLE '-' NAME
	;

functionsDef
	: LP FUNCTIONS function+ RP
	;

function
	: LP NAME typedVariable* RP
	;

predicatedVariables
	: NAME VARIABLE*  
	;

structureDef
	: actionDef
	| processDef
	| eventDef
	;


/************* ACTIONS ****************************/

actionDef
	: LP ACTION NAME
	    PARAMETERS LP typedVariable* RP
        precondition?
		effect?
		RP
;

precondition
	: PRECONDITION LP 'and' precondition_formula* RP
	;

precondition_formula
    : LP predicatedVariables RP
    | operation
    ;

effect
	: EFFECT LP 'and' effect_formula+ RP
	;

effect_formula
    : LP predicatedVariables RP
	| LP 'not' LP predicatedVariables RP RP
	| LP 'assign' LP predicatedVariables RP NUMBER RP
	| LP 'increase' LP predicatedVariables RP NUMBER RP
	| LP 'decrease' LP predicatedVariables RP NUMBER RP
	| LP 'assign' LP predicatedVariables RP operation RP
	| LP 'increase' LP predicatedVariables RP operation RP
	| LP 'decrease' LP predicatedVariables RP operation RP
	| LP 'assign' LP predicatedVariables RP LP predicatedVariables RP RP
	;

operation
	: LP (OPERATION|'-'|'='|'<'|'=<'|'<='|'>='|'>'|'+'|'*'|'/'|'or'|'and') LP predicatedVariables RP NUMBER RP
	| LP (OPERATION|'-'|'='|'<'|'=<'|'<='|'>='|'>'|'+'|'*'|'/'|'or'|'and') NUMBER LP predicatedVariables RP RP
	| LP (OPERATION|'-'|'='|'<'|'=<'|'<='|'>='|'>'|'+'|'*'|'/'|'or'|'and') NUMBER NUMBER RP
	| LP (OPERATION|'-'|'='|'<'|'=<'|'<='|'>='|'>'|'+'|'*'|'/'|'or'|'and') LP predicatedVariables RP LP predicatedVariables RP RP
	| LP (OPERATION|'-'|'='|'<'|'=<'|'<='|'>='|'>'|'+'|'*'|'/'|'or'|'and') LP predicatedVariables RP operation RP
	| LP (OPERATION|'-'|'='|'<'|'=<'|'<='|'>='|'>'|'+'|'*'|'/'|'or'|'and')  operation LP predicatedVariables RP RP
	| LP (OPERATION|'-'|'='|'<'|'=<'|'<='|'>='|'>'|'+'|'*'|'/'|'or'|'and') NUMBER operation RP
	| LP (OPERATION|'-'|'='|'<'|'=<'|'<='|'>='|'>'|'+'|'*'|'/'|'or'|'and') operation operation RP
	| LP (OPERATION|'-'|'='|'<'|'=<'|'<='|'>='|'>'|'+'|'*'|'/'|'or'|'and') operation NUMBER RP
	| LP 'not' operation RP
	| LP 'not' LP predicatedVariables RP RP
	;

/************* PROCESSES ****************************/

processDef
	: LP PROCESS NAME
		PARAMETERS LP typedVariable* RP
		precondition?
		effect?
		RP
	;





/************* EVENTS ****************************/

eventDef
	: LP EVENT NAME
	    PARAMETERS LP typedVariable* RP
        precondition?
		effect?
		RP
;

/************* PROBLEMS ****************************/

problem
	: '(' 'define' problemDecl
	problemDomain
	objectDecl?
	init
	goal
	metric?
	RP
	;

problemDecl
	: LP PROBLEM NAME RP
	;

problemDomain
	: LP ':domain' NAME RP
	;

objectDecl
	: LP ':objects' sameTypeNamesList+ RP
	;

sameTypeNamesList
	:NAME+ '-' NAME
	;

init
	: LP ':init' initEl* RP
	;

initEl
	: nameLiteral
	| equalLiteral
	;

nameLiteral
	: atomicNameFormula
	| LP 'not' atomicNameFormula RP
	;

atomicNameFormula
	:LP NAME+ RP
	;

equalLiteral
	:LP '=' atomicNameFormula NUMBER RP
	;

goal
	: LP ':goal' LP 'and' goalDesc+ RP RP
	;

goalDesc
	: atomicNameFormula
	| LP 'not' atomicNameFormula RP
	| LP ('>'|'<'|'='|'<='|'>=') LP NAME+ RP NUMBER RP
	;

metric
	: LP ':metric' ('maximize'|'minimize') atomicNameFormula RP
	;