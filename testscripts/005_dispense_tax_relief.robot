#coding: utf8
*** Settings ***
Resource            ${EXECDIR}${/}testscripts${/}importresource.resource
Test Setup  Test_Started
Test Teardown  Test_Ended

*** Test Cases ***
Test the button on the screen must be red-colored
    [Documentation]    To Test the button on the screen must be red-colored
    [Tags]   005_AC1
    Open Browser To Oppenheimer Project
    User Verify The Dispense Now Button Colour

Test the text on the button must be exactly Dispense Now
    [Documentation]    To Test the text on the button must be exactly “Dispense Now”
    [Tags]   005_AC2
    Open Browser To Oppenheimer Project
    User Verify The Dispense Now Button Text

Test the text after clicking on the Dispense Now button
    [Documentation]    To Test After clicking on the button, it should direct me to a page with a
    ...     text that says “Cash dispensed”
    [Tags]   005_AC3
    Open Browser To Oppenheimer Project
    User Verify The text after clicking on the Dispense Now button

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

User Verify The Dispense Now Button Colour
    [Documentation]     User Verify The Dispense Now Button Colour
    ...
    ...     Examples:
    ...     User Verify The Dispense Now Button Colour
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    ${color}       Get Button Colour       ${dispense_now_button}
    should be equal as strings    ${color}        Red


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


User Verify The Dispense Now Button Text
    [Documentation]     User Verify The Dispense Now Button Text
    ...
    ...     Examples:
    ...     User Verify The Dispense Now Button Text
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    ${button_text}      Get Text        ${dispense_now_button}
    should be equal as strings    ${button_text}        Dispense Now

User Verify The text after clicking on the Dispense Now button
    [Documentation]     User Verify The text after clicking on the Dispense Now button
    ...
    ...     Examples:
    ...     User Verify The text after clicking on the Dispense Now button
    ...
    ...     Preconditions:
    ...     - Oppenheimer Project should be in runnable state
    Click       ${dispense_now_button}
    ${page_text}      Get Text        ${dispense_now_page_text}
    should be equal as strings    ${page_text}        Cash dispensed

Get Button Colour
    [Documentation]     Get Button Colour
    ...
    ...     Parameters:
    ...     *locator*: xpath for the locator
    ...
    ...     Examples:
    ...     Get Button Colour        ${locator}
    ...
    ...     Preconditions:
    ...     - Element should be visible
    ...
    ...     Return:
    ...     - Button Colour
    [Arguments]  ${locator}
    ${rgb_values}    Get Style    ${locator}    background-color
    ${color}    get_color_name_by_rgb    ${rgb_values}
    [Return]  ${color}

Test_Started
    log to console  'Execution Started for Dispense Tax Relief'
Test_Ended
    log to console  'Execution Ended for Dispense Tax Relief'