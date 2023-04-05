#coding: utf8
*** Settings ***
Resource            ${EXECDIR}${/}testscripts${/}importresource.resource
Test Setup  Test_Started
Test Teardown  Test_Ended

*** Test Cases ***
Test GET endpoint which returns a list consist of natid, tax relief amount and name
    [Documentation]    To test GET endpoint which returns a list consist of natid, tax relief amount and name
    [Tags]   004_AC1
    Create Session Collect Response
    Validate Natid, Tax Relief Amount And Name In Response

Test natid field must be masked from the 5th character onwards with dollar sign
    [Documentation]    To test natid field must be masked from the 5th character onwards with dollar sign ‘$’
    [Tags]   004_AC2
    Create Session Collect Response
    Validate Natid Must Be Masked From The 5th Character Onwards With Dollar Sign

*** Keywords ***
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

Validate Natid, Tax Relief Amount And Name In Response
    [Documentation]     Validate Natid, Tax Relief Amount And Name In Response
    ...
    ...     Examples:
    ...     Validate Natid, Tax Relief Amount And Name In Response
    ...
    ...     Preconditions:
    ...     - Session should be created
    FOR    ${person_data}    IN    @{response_content}
        Should Be True      "natid" in """${person_data}"""
        Should Be True      "relief" in """${person_data}"""
        Should Be True      "name" in """${person_data}"""
    END

Validate Natid Must Be Masked From The 5th Character Onwards With Dollar Sign
    [Documentation]     Validate Natid Must Be Masked From The 5th Character Onwards With Dollar Sign
    ...
    ...     Examples:
    ...     Validate Natid Must Be Masked From The 5th Character Onwards With Dollar Sign
    ...
    ...     Preconditions:
    ...     - Natid should be provided
    FOR    ${person_data}    IN    @{response_content}
        set local variable    ${natid}     ${person_data.get("natid")}
        ${length} =	Get Length      ${natid}
        RUN KEYWORD IF    ${length}>=5       Validate Dollar Sign      ${natid}
    END

Validate Dollar Sign
    [Documentation]     Validate Dollar Sign
    ...
    ...     Examples:
    ...     Validate Dollar Sign
    ...
    ...     Preconditions:
    ...     - Natid should be provided
    [Arguments]    ${natid}
    ${status}=       is_masked      ${natid}
    Should Be True       ${status}

Test_Started
    log to console  'Execution Started for Get TaxReliefCalculation'
Test_Ended
    log to console  'Execution Ended for Get TaxReliefCalculation'