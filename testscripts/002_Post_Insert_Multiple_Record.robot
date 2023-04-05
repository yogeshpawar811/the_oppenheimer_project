#coding: utf8
*** Settings ***
Resource            ${EXECDIR}${/}testscripts${/}importresource.resource
Library     DataDriver    ${EXECDIR}${/}testData${/}post_insert_multiple_record${/}POST_insert_multiple_record.csv  encoding=utf-8-sig
Test Setup  Test_Started
Test Teardown  Test_Ended
Test Template   Verify_Post_insertMultiplePerson

*** Test Cases ***
Verify_Post_insertMultiplePerson_${TC}

*** Keywords ***
Verify_Post_insertMultiplePerson_
    [Documentation]    As the Clerk, I should be able to insert more than one working
    ...     class hero into database via an API
    [Arguments]   ${TC}  ${multiple_records}   ${expected_status_code}     ${expected_message}
    create session    mysession     ${base_url}
    ${apiBody}=     evaluate    json.loads('''${multiple_records}''')    json
    ${response}=    POST On Session    mysession      /calculator/insertMultiple        json=${apiBody}     expected_status=any
    log    ${response.content}
    Should Contain       '${response.content}'     ${expected_message}
    Should Be Equal As Strings     ${response.status_code}  ${expected_status_code}
    Run Keyword If   ${response.status_code}==200  Should Contain  '${response.content}'   OK
    Run Keyword If   ${response.status_code}==201  Should Contain  '${response.content}'   Created
    Run Keyword If   ${response.status_code}==202  Should Contain  '${response.content}'   Alright
    Run Keyword If   ${response.status_code}==401  Should Contain  '${response.content}'   Unauthorized
    Run Keyword If   ${response.status_code}==403  Should Contain  '${response.content}'   Forbidden
    Run Keyword If   ${response.status_code}==404  Should Contain  '${response.content}'   Not Found

Test_Started
    log to console  'Execution Started for Post Insert Multiple Person'
Test_Ended
    log to console  'Execution Ended for Post Insert Multiple Person'