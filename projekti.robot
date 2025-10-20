*** Settings ***
Library    SeleniumLibrary

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
    Page Should Contain    ${nimi}