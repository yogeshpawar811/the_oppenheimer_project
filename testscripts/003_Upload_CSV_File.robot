#coding: utf8
*** Settings ***
Resource            ${EXECDIR}${/}testscripts${/}importresource.resource
Test Setup  Test_Started
Test Teardown  Test_Ended

*** Test Cases ***
Test First row of the csv file
    [Documentation]    To Test First row of the csv file
    [Tags]   003_AC1
    User Create CSV File With Valid Data
    User Able To Verify First Row Of The CSV File With Correct Headers

Test Subsequent rows of csv are the relevant details
    [Documentation]    To Test Subsequent rows of csv are the relevant details
    [Tags]   003_AC2
    User Create CSV File With Valid Data
    User Able To Verify Subsequent Rows Of CSV Are The Relevant Details

Test Upload File with valid CSV data
    [Documentation]    To Test Upload File with valid CSV data
    [Tags]   003_AC3-Positive
    Open Browser To Oppenheimer Project
    User Create And Upload CSV File With Valid Data
    User Able To Upload CSV File Successfully

Test Upload File with invalid CSV data
    [Documentation]    To Test Upload File with invalid CSV data
    [Tags]   003_AC3-Negative
    Open Browser To Oppenheimer Project
    User Create And Upload CSV File With Invalid Data
    User Not Able To Upload CSV File Successfully

*** Keywords ***
Open Browser To Oppenheimer Project
    [Documentation]     Open Browser To Oppenheimer Project
    ...
    ...     Examples:
    ...     Open Browser To Oppenheimer Project
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    New Browser    ${BROWSER}    headless=false
    New Page    ${base_url}

User Create And Upload CSV File With Valid Data
    [Documentation]     User Create And Upload CSV File With Valid Data
    ...
    ...     Examples:
    ...     User Create And Upload CSV File With Valid Data
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    Create Valid Csv Test Data     ${valid_csv_file_path}
    ${before_upload_text} =    Get Text       ${upoaded_csv_file_data_div}
    Set Suite Variable      ${before_upload_text}
    Upload File By Selector      ${Upload_Button}    ${valid_csv_file_path}
    Reload

User Create And Upload CSV File With Invalid Data
    [Documentation]     User Create And Upload CSV File With Invalid Data
    ...
    ...     Examples:
    ...     User Create And Upload CSV File With Invalid Data
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    Create Invalid Csv Test Data     ${invalid_csv_file_path}
    ${before_upload_text} =    Get Text       ${upoaded_csv_file_data_div}
    Set Suite Variable      ${before_upload_text}
    Upload File By Selector      ${Upload_Button}    ${invalid_csv_file_path}
    Reload

User Able To Upload CSV File Successfully
    [Documentation]     User Able To Upload CSV File Successfully
    ...
    ...     Examples:
    ...     User Able To Upload CSV File Successfully
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    Element Should Be Visible       ${upoaded_csv_file_data_div}
    ${after_upload_text} =    Get Text       ${upoaded_csv_file_data_div}
    Should Not Be Equal As Strings      ${before_upload_text}       ${after_upload_text}

User Not Able To Upload CSV File Successfully
    [Documentation]     User Not Able To Upload CSV File Successfully
    ...
    ...     Examples:
    ...     User Not Able To Upload CSV File Successfully
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    ${after_upload_text} =    Get Text       ${upoaded_csv_file_data_div}
    Should Be Equal As Strings      ${before_upload_text}       ${after_upload_text}

Element Should Be Visible
    [Documentation]     Element Should Be Visible
    ...
    ...     Examples:
    ...     Element Should Be Visible
    ...
    ...     Preconditions:
    ...     - Element should be available in DOM
    [Arguments]    ${xpath}
    Reload
    Wait For Elements State    ${xpath}    attached    timeout=20s

Element Should Not Be Visible
    [Documentation]     Element Should Not Be Visible
    ...
    ...     Examples:
    ...     Element Should Not Be Visible
    ...
    ...     Preconditions:
    ...     - Element should not be available in DOM
    [Arguments]    ${xpath}
    Reload
    Wait For Elements State    ${xpath}    detached    timeout=10s

User Create CSV File With Valid Data
    [Documentation]     User Create CSV File With Valid Data
    ...
    ...     Examples:
    ...     User Create CSV File With Valid Data
    ...
    ...     Preconditions:
    ...     - Should have some valid data
    Create Valid Csv Test Data     ${valid_csv_file_path}

User Able To Verify First Row Of The CSV File With Correct Headers
    [Documentation]     User Able To Verify First Row Of The CSV File With Correct Headers
    ...
    ...     Examples:
    ...     User Able To Verify First Row Of The CSV File With Correct Headers
    ...
    ...     Preconditions:
    ...     - Should have Correct Headers
    ${content}=   Get File      ${valid_csv_file_path}
    Should Start With       ${content}     ${valid_headers}

User Able To Verify Subsequent Rows Of CSV Are The Relevant Details
    [Documentation]     User Able To Verify Subsequent Rows Of CSV Are The Relevant Details
    ...
    ...     Examples:
    ...     User Able To Verify Subsequent Rows Of CSV Are The Relevant Details
    ...
    ...     Preconditions:
    ...     - Should have Relevant Details
    ${status}=      check_file_data     ${valid_csv_file_path}
    Should Be Equal As Strings      ${status}       True

Test_Started
    log to console  'Execution Started for Upload CSV File'
Test_Ended
    log to console  'Execution Ended for Upload CSV File'