*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Open browser and search services kohta 2
    Open Browser    http://hamk.fi    Chrome
    ...    options=add_experimental_option("detach", True)
   
    Maximize Browser Window
    Sleep    3
    
    Click Button    id:CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll

    Click button    xpath:/html/body/header/div/div/div/div[2]/div[1]/button

    Click Element    id:site-search-input
    Input Text    id:site-search-input    services

    Sleep    4

    ${otsikko}=    Get Text    xpath:/html/body/div[3]/div[2]/div/div/div/div[2]/article[1]/div/h3    
    log    ${otsikko}

    Click Element    xpath:/html/body/div[3]/div[2]/div/div/div/div[2]/article[1]/div/h3

    Sleep    3

    Element Text Should Be    xpath:/html/body/main/article/div[2]/div[2]/p[1]    ${otsikko}

    Close Browser


*** Test Cases ***
Take a screenshot from the first article kohta 3
    # paina artikkelit 
    Open Browser    http://hamk.fi    Chrome
    ...    options=add_experimental_option("detach", True)
   
    Maximize Browser Window

    Sleep    5

    Click Button    id:CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll

    Click Button    xpath:/html/body/main/article/div[2]/div[1]/div[1]/fieldset/div/div/div[1]/button

    Sleep    3

    # valitse ensimmäinen elementti
    Click Element    xpath:/html/body/main/article/div[2]/div[1]/div[2]/div[1]/article[1]

    Sleep    3

    # ota screenshot
    Capture Element Screenshot    xpath:/html/body/main/article/div[3]/figure/img

    Close Browser


*** Test Cases ***
Hamk testaus kohta 4

    Open browser    http://www.hamk.fi    Chrome
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    3
    Click Element    xpath:/html/body/div[1]/div/div[4]/div[1]/div/div[2]/button[4]
    Sleep    1

    Click Element    xpath:/html/body/header/div/div/div/nav/div/ul/li[5]/button
    Click Element    xpath:/html/body/header/div/div/div/nav/div/ul/li[5]/ul/li[5]/a
    Sleep    1
    Click Element    xpath:/html/body/main/article/div[1]/div/div/div[2]/a
    Sleep    3
    Click Element    xpath:/html/body/main/article/div[2]/div/div[1]/div[1]/div[1]/div[2]/input
    Input Text    xpath:/html/body/main/article/div[2]/div/div[1]/div[1]/div[1]/div[2]/input    Esa Huiskonen
    Sleep    3
    Click Element    xpath:/html/body/main/article/div[2]/div/div[3]/div/div[1]/article[1]/div[2]/div[3]/a
    Sleep    3

    ${nimi}=        Get Text    xpath:/html/body/main/article/div[1]/div/h1
    Page Should Contain    text    ${nimi}