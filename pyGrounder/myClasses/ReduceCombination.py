import itertools


class ReduceCombination:

    # attributes
    combinations = None
    problem = None
    domain = None

    # constructor
    @classmethod
    def __init__(cls, combinations, problem, domain):
        cls.combinations = combinations
        cls.problem = problem
        cls.domain = domain

    # main method
    @classmethod
    def reduceGrounderCombination(cls, operation):

        # find the necessary effects that require initialization
        def necessary(effects):
            def loop(myParameters, nE):
                while len(myParameters) != 0:
                    if myParameters[0]['Name'] in ['Constant', 'Time']:
                        pass
                    elif not myParameters[0]['isOperation?']:
                        nE.append(myParameters[0])
                    else:
                        myParameters += myParameters[0]['Parameters']
                    myParameters.remove(myParameters[0])

            necessaryEffects = []
            # for every effects check if is operation
            for e in effects:
                expressionParameters = []
                rr = e.predicateAsDict()['Parameters']
                if "effectString" in e.predicateAsDict() and str(e.predicateAsDict()['Name']).strip() in ['assign']:
                    # if assign operation, save only the right side
                    expressionParameters.append(rr[1])
                    loop(expressionParameters, necessaryEffects)

                elif "effectString" in e.predicateAsDict() and str(e.predicateAsDict()['Name']).strip() in ['increase',
                                                                                                            'decrease']:
                    # if increase/decrease operation, save both right and left sides
                    expressionParameters += rr
                    loop(expressionParameters, necessaryEffects)
            return necessaryEffects

        # todo return if the fluent is numeric by checking if it's functions or not
        def numericCondition(p):
            pName = p['Name']
            for w in cls.domain['functions']:
                if pName == w.name:
                    return True
            return False

        # todo return if the fluent is literal by checking if it's functions or not
        def literal(p):
            pName = p['Name']
            for w in cls.domain['predicates']:
                if pName == w.name:
                    return True
            return False

        # return if the fluent is literal by checking if it's operation or not
        def expression(p):
            if p['isOperation?']:
                return True
            else:
                return False

        # reduce the number of combination in the numeric fluent
        def reduceNum(p):
            # check if the fluent is static
            staticNum = isStatic(p)
            if staticNum[0]:
                # create a dictionary with all numeric initialization in problem
                dizInit = []
                for i in cls.problem.init:
                    if i['isAssignment?']:
                        for element in i['operands']:
                            for key, value in element.items():
                                if key == "operandName" and value == p:
                                    diz = {"Name": element['operandName'],
                                           "Object": list(dict(list(i['operands'])[0])['operandObjects'])[0],
                                           "Value": dict(list(i['operands'])[1])['operandValue']}
                                    dizInit.append(diz)

                # create a list with all the combinations that I'll remove from the final result
                removeCombinations = []
                for c in cls.combinations:
                    # take all the variables of the combinations
                    combinationVariables = []
                    gg = str(c).split(',')
                    for g in gg:
                        hh = g.replace("'", "").replace("(", "").replace(")", "").split("-")
                        combinationVariables.append(hh[0].strip())

                    # if all the element in p is in combinationVariable return False
                    # and add combination c to remove list
                    all_pInit_present = True
                    for p in dizInit:
                        if all(elem in combinationVariables for elem in p):
                            all_pInit_present = False
                            break
                    if not all_pInit_present:
                        removeCombinations.append(c)

                # lastly remove impossible combinations
                if len(list(set(cls.combinations) - set(removeCombinations))) != 0:
                    cls.combinations = list(set(cls.combinations) - set(removeCombinations))

        # split the expression in 2 different block and execute them as numeric fluent or expression again
        def reduceExpression(p):
            if p['isOperation?']:
                parametersList = p['Parameters']
                while len(parametersList) != 0:
                    param = parametersList[0]
                    if param['isOperation?']:
                        reduceExpression(param)
                    else:
                        reduceNum(param)
                    parametersList.remove(param)
            else:
                reduceNum(p)

        # reduce combinations in literal fluent
        def reduceSat(p):
            # todo
            def findRepeatElements(myList):
                repeatElements = []
                for element in myList:
                    if myList.count(element) > 1 and element not in repeatElements:
                        repeatElements.append(element)
                return repeatElements

            # if the fluent is static I'll save init and object in my problem
            staticSat = isStatic(p)
            if staticSat[0]:
                pInit = []
                initialObjects = []
                objectType = []
                initList = []
                for i in cls.problem.init:
                    if p['Name'] == i.get('predName'):
                        pInit.append(i['predObjects'])
                for o in cls.problem.objects:
                    initialObjects.append(o)

                # associate each initial object with its type
                for r in pInit[0]:
                    for o in initialObjects:
                        if o['objectIstances'].__contains__(r):
                            objectType.append(o['objectType'])

                # save witch object is repeated in the parameters
                repeat = findRepeatElements(objectType)

                # according to number of parameters, find the number of combinations
                combinationsNumber = 1
                for t in objectType:
                    initialIstances = []
                    for o in initialObjects:
                        if o['objectType'] == t:
                            initialIstances = o['objectIstances']
                            initList.append(o['objectIstances'])
                    combinationsNumber *= len(list(initialIstances))

                # generate a new set of combinations and reduce it with the initial conditions
                # I'll get a set of impossible combinations
                newCombinations = list(itertools.product(*initList))
                newCombinations = list(set(tuple(c) for c in newCombinations) - set(tuple(p) for p in pInit))

                # save witch combinations I have to remove in the final result
                removeCombinations = []
                for c in cls.combinations:
                    combinationVariables = []
                    gg = str(c).split(',')
                    for g in gg:
                        hh = g.replace("'", "").replace("(", "").replace(")", "").split("-")
                        combinationVariables.append(hh[0].strip())

                    # for each impossible combination, I'll check if it's all present in the current combinations
                    for sublist in newCombinations:
                        present = True
                        variablesCopy = combinationVariables.copy()

                        # if there aren't repeated types parameters, I'll simply check the exact correspondence 1:1
                        # if I find a different parameter, break execution and check for the next
                        # otherwise I'll add combination c in the remove list
                        if len(repeat) == 0:
                            for element in sublist:
                                if element in variablesCopy:
                                    variablesCopy.remove(element)
                                else:
                                    present = False
                                    break
                            if present:
                                removeCombinations.append(c)
                                break

                        # if there are repeated types parameters, I'll create a list containing a queue of parameters
                        # I always control the first parameter in the queue and if it's different
                        #       break execution and check for the next
                        # otherwise I'll remove the first element and check for the new first
                        # if the while is empty, I'll add combination c in the remove list
                        else:
                            repeatCopy = repeat.copy()
                            while len(repeatCopy) != 0:
                                sublistCopy = list(sublist).copy()
                                initSaved = []
                                draftList = []
                                for ii in cls.problem.objects:
                                    if ii['objectType'] == repeatCopy[0]:
                                        initSaved = ii['objectIstances']
                                for ii in variablesCopy:
                                    if ii in initSaved:
                                        draftList.append(ii)

                                while len(sublistCopy) != 0:
                                    if sublistCopy[0] == draftList[0]:
                                        draftList.pop(0)
                                        sublistCopy.pop(0)
                                    else:
                                        break
                                if len(sublistCopy) == 0:
                                    removeCombinations.append(c)
                                    break
                                repeatCopy.pop()

                # lastly remove impossible combinations
                while len(removeCombinations) != 0:
                    c = removeCombinations[0]
                    cls.combinations.remove(c)
                    removeCombinations.remove(c)

        # reverse all the expression with <-<= in >->=
        def reverseExpression(p):
            if p['Name'] == '<':
                p['Name'] = '>'
                p['Parameters'] = list(p['Parameters']).reverse()
            if p['Name'] == '<=':
                p['Name'] = '>='
                p['Parameters'] = list(p['Parameters']).reverse()

        # understand if the fluent is static, so it's never change during all the program execution
        def isStatic(v):

            # return list of effects which are overwritten
            def affected(t):
                ne = []
                effect = t.effects
                for e in effect:

                    # take only the left side in the expression
                    if "effectString" in e.predicateAsDict() and str(e.predicateAsDict()['Name']).strip() in ['assign', 'increase', 'decrease']:
                        expressionParameters = []
                        rr = e.predicateAsDict()['Parameters']
                        expressionParameters.append(rr[0])
                        while len(expressionParameters) != 0:
                            if expressionParameters[0]['Name'] in ['Constant', 'Time']:
                                pass
                            elif not expressionParameters[0]['isOperation?']:
                                ne.append(expressionParameters[0]['Name'])
                            else:
                                expressionParameters += expressionParameters[0]['Parameters']
                            expressionParameters.pop()

                    # take the name for the classical effect
                    elif "effect" in e.predicateAsDict():
                        ne.append(e.predicateAsDict()['Name'])
                return ne

            # take all the preconditions
            def abstract(t):
                myList = []
                for p in t.preconditions:
                    if p.predicateAsDict()['isOperation?']:
                        fluentParameters = p.predicateAsDict()['Parameters']
                        myList.append(fluentParameters[0]['Name'])
                        myList.append(fluentParameters[1]['Name'])
                    else:
                        myList.append(p.predicateAsDict()['Name'])
                return myList

            # check for each action/event/process
            # 1° RETURN: static or not,
            # 2° RETURN: if it's in problem.init or not
            AEP = cls.domain['actions'] + cls.domain['events'] + cls.domain['processes']
            name = None
            for t in AEP:
                af = affected(t)
                ab = abstract(t)
                if v['isOperation?']:
                    name = dict(list(v['Parameters'])[0])['Name']
                else:
                    name = v['Name']

                # if our fluent is both in abstract and affected, is not static
                if name in ab and name in af:
                    return False, True
            # if no operations return False for our fluent, check if it's defined in problem initialization
            initList = []
            for i in cls.problem.init:
                if i['isAssignment?']:
                    lista = i['operands']
                    initList.append(lista[0]['operandName'])
                else:
                    initList.append(i['predName'])

            # if it's not defined, return it's not in problem initialization
            if name not in initList:
                return False, False

            # fluent is static
            return True, True

######################################################################################################################
######################################################################################################################

        # save in other variables the preconditions and effects
        preconditions = operation.preconditions
        effects = operation.effects
        # return operation if in our problem is not defined any objects
        if not cls.problem.objects:
            return operation
        # for each fluent in preconditions and necessary effects
        for fluent in preconditions + necessary(effects):
            saveP = fluent
            # convert my fluent in dictionary
            if type(fluent) != dict:
                fluent = fluent.predicateAsDict()
            static = isStatic(fluent)

            # if it's static but not defined in the problem.init
            # return None and not add this operation in the final combinations
            # also check that this fluent is in preconditions
            if not static[0] and not static[1]:
                if type(saveP) == 'pyGrounder.myClasses.Precondition.Precondition' and not fluent['isNegated?']:
                    operation = None
                return operation

            # otherwise if it's not negated, I'll proceed in the classical way
            else:
                if not fluent['isNegated?']:
                    if numericCondition(fluent):
                        reverseExpression(fluent)
                        reduceExpression(fluent)
                    elif literal(fluent):
                        reduceSat(fluent)
                    elif expression(fluent):
                        reduceExpression(fluent)
                # finally, if the precondition is negated
                # return None and not add this operation in the final combinations
                elif type(saveP) == 'pyGrounder.myClasses.Precondition.Precondition' and fluent['isNegated?']:
                    operation = None
                    return operation

        return operation
