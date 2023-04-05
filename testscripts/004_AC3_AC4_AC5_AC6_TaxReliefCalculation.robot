#coding: utf8
*** Settings ***
Resource            ${EXECDIR}${/}testscripts${/}importresource.resource
Library     DataDriver    ${EXECDIR}${/}testData${/}TaxReliefCalculation${/}data_for_tax_calculation.csv  encoding=utf-8-sig
Test Setup  Test_Started
Test Teardown  Test_Ended
Test Template   Computation_of_the_tax_relief_is_using_the_formula

*** Test Cases ***
Computation_of_the_tax_relief_is_using_the_formula_${TC}
    [Tags]      004_AC3       004_AC4     004_AC5     004_AC6

*** Keywords ***
Computation_of_the_tax_relief_is_using_the_formula_
    [Documentation]     Computation of the tax relief is using the formula
    ...
    ...     Examples:
    ...     Computation of the tax relief is using the formula
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    [Arguments]        ${TC}        ${natid}        ${name}     ${gender}       ${salary}       ${birthday}     ${age}      ${tax}
    Create Session    mysession     ${base_url}
    ${apiBody}=   Create Dictionary  natid=${natid}     name=${name}      gender=${gender}      salary=${salary}      birthday=${birthday}      tax=${tax}
    ${response}=    POST On Session    mysession      /calculator/insert        json=${apiBody}     expected_status=any
    sleep    3s
    Create Session Collect Response
    ${dict_length}    Get Length    ${response_content}
    FOR    ${i}    IN RANGE    ${dict_length}
        IF    """${name}""" in """${response_content}[${i}]"""
            ${tax_relif_from_calculation}=       taxReliefCalculation        ${gender}       ${salary}       ${age}      ${tax}
            ${calculated_tax_relif}      truncate_and_round      ${tax_relif_from_calculation}
            ${tax_relif_from_api}    Get From Dictionary    ${response_content}[${i}]    relief
            ${tax_relif_float}    Convert To Number    ${tax_relif_from_api}
            ${api_tax_relif}      truncate_and_round      ${tax_relif_float}
            should be equal as strings    ${api_tax_relif}      ${calculated_tax_relif}
        END
    END

Create Session Collect Response
    [Documentation]     Create Session Collect Response
    ...
    ...     Examples:
    ...     Create Session Collect Response
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    Create Session    mysession     ${base_url}
    ${response}=    GET on session    mysession      /calculator/taxRelief        expected_status=any
    ${content}=    Evaluate     json.loads("""${response.content}""")    json
    Set Suite Variable      ${response_content}     ${content}

Test_Started
    log to console  'Execution Started for AC3, AC4, AC5 And AC6 TaxReliefCalculation'
Test_Ended
    log to console  'Execution Ended for AC3, AC4, AC5 And AC6 TaxReliefCalculation'