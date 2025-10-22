*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Testaa "Ajankohtaista"-osion artikkelit, kohta 1

    Open Browser    http://www.hamk.fi/   Chrome
    ...    options=add_experimental_option("detach", True)     #sivu ei sulkeudu heti
    Maximize Browser Window
    Sleep   2

    Click Button    id:CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll

    Sleep   2

    #Scroll Element Into View    //*[@id="site-content"]/article/div[2]/div[1]/h2
    Scroll Element Into View    //*[@id="site-content"]/article/div[2]/div[1]/div[2]/div[3]
    Sleep    2

    #klikataan vuorotellen väliotsikoita
    Click Button    xpath:/html/body/main/article/div[2]/div[1]/div[1]/fieldset/div/div/div[1]/button
    Sleep   2
    Click Button    xpath:/html/body/main/article/div[2]/div[1]/div[1]/fieldset/div/div/div[2]/button
    Sleep    2
    Click Button    xpath:/html/body/main/article/div[2]/div[1]/div[1]/fieldset/div/div/div[3]/button
    Sleep   2
    Click Button    xpath:/html/body/main/article/div[2]/div[1]/div[1]/fieldset/div/div/div[4]/button
    Sleep    2
    Click Button    xpath:/html/body/main/article/div[2]/div[1]/div[1]/fieldset/div/div/div[1]/button
    Sleep    2
    #avataan ensimmäinen artikkeli
    Click Element    xpath:/html/body/main/article/div[2]/div[1]/div[2]/div[1]/article[1]/div[2]/h3/a

    Sleep   2
    #tarkistetaan että sivu täsmää aiheotsikkoon
    Page Should Contain    Opinnoista uutta virtaa


*** Test Cases ***
Hae services ja tarkista että linkki vie oikealle sivulle kohta 2
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
Ota kuvankaappaus ensimmäisen artikkelin kuvaelementistä kohta 3
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
    Page Should Contain    ${nimi}



*** Test Cases ***
Testaa että moodle linkki toimii testi 6

    # avaa selain

    Open Browser    http://hamk.fi    Chrome
    ...    options=add_experimental_option("detach", True)
   
    Maximize Browser Window

    Sleep    5

    Click Button    id:CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll

    # valitse opiskelijan sivut --> opiskelijan työkalut
    Click Button    xpath:/html/body/header/div/div/div/nav/div/ul/li[4]/button

    Sleep    1

    Click Element    xpath:/html/body/header/div/div/div/nav/div/ul/li[4]/ul/li[2]

    # varmista etä moodle linkki toimii ja pääset moodlen sivulle
    Click Element    xpath:/html/body/main/article/div[2]/div[2]/div/div[1]/a

    ${location}=    Get Location
    Log    ${location}

    Location Should Be    https://learn.hamk.fi/


*** Test Cases ***
Testaa että opiskelijan työkalut sivulla kaikki linkit toimivat testi 7

    Open Browser    http://hamk.fi    Chrome
    ...    options=add_experimental_option("detach", True)
   
    Maximize Browser Window

    Sleep    3

    Click Button    id:CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll
    
    Click Button    Opiskelijan sivut

    Click Element    xpath:/html/body/header/div/div/div/nav/div/ul/li[4]/ul/li[4]

    Sleep    2

    Click Link    https://hamk.opinto-opas.fi/home
    Wait Until Element Is Visible    xpath:/html/body/div[1]/div[2]/div/div/h1
    Element Text Should Be    xpath:/html/body/div[1]/div[2]/div/div/h1    Opinto-opas
    Go Back

    Click Link    https://www.hamk.fi/opiskelijalle/opintojen-suunnittelu/moduulikartat/
    Get Location
    Location Should Be    https://www.hamk.fi/opiskelijalle/opintojen-suunnittelu/moduulikartat/
    Go Back

    Click Link    https://lukkarit.hamk.fi/#/schedule
    Sleep    1
    Get Location
    Location Should Be    https://lukkarit.hamk.fi/#/schedule
    Go Back

    Scroll Element Into View    xpath:/html/body/main/article/div[3]/div[1]/h2
    Click Link    https://create.plandisc.com/wheel/showPublic/biM3pwF
    Sleep    1
    Get Location
    Location Should Be    https://create.plandisc.com/wheel/showPublic/biM3pwF
    Go Back

    Sleep    2

    Close Browser

*** Test Cases ***
Tarkistetaan että kampuslinkit toimii ja sivuilla on yhteystiedot testi 8

    Open Browser    http://www.hamk.fi/   Chrome
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep   1
    Click Button    id:CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll
    Sleep   1
    
    Click Button    xpath:/html/body/header/div/div/div/nav/div/ul/li[5]/button
    Sleep    1

    Click Element    xpath:/html/body/header/div/div/div/nav/div/ul/li[5]/ul/li[1]/a/span
    Sleep    1
    
    #Evo
    Sleep    1
    Click Link    xpath:/html/body/main/article/div[6]/div/article[1]/div/h3/a
    Page Should Contain    Evon kampus
    Sleep    1

    Scroll Element Into View    xpath:/html/body/main/article/div[5]/div
    Sleep    1
    Page Should Contain    Yhteystiedot ja saapuminen
    Sleep    1
    Go Back

    #Forssa
    Sleep    1

    Click Link    xpath:/html/body/main/article/div[6]/div/article[2]/div/h3/a
    Page Should Contain    Forssan kampus
    Sleep    1

    Scroll Element Into View    xpath:/html/body/main/article/div[5]/div
    Page Should Contain    Yhteystiedot ja saapuminen
    Sleep    1
    Go Back

    #Hämeenlinna
    Sleep    1

    Click Link    xpath:/html/body/main/article/div[6]/div/article[3]/div/h3/a
    Page Should Contain    Hämeenlinnan korkeakoulukeskus
    Sleep    1

    Scroll Element Into View    xpath:/html/body/main/article/div[5]/div
    Page Should Contain    Yhteystiedot ja saapuminen
    Sleep    1
    Go Back

    #Lepaa
    Sleep    1

    Click Link    xpath:/html/body/main/article/div[6]/div/article[4]/div/h3/a
    Page Should Contain    Lepaan kampus
    Sleep    1

    Scroll Element Into View    xpath:/html/body/main/article/div[5]/div
    Page Should Contain    Yhteystiedot ja saapuminen
    Sleep    1
    Go Back

    #Mustiala
    Sleep    1

    Click Link    xpath:/html/body/main/article/div[6]/div/article[5]/div/h3/a
    Page Should Contain    Mustialan kampus
    Sleep    1

    Scroll Element Into View    xpath:/html/body/main/article/div[5]/div
    Page Should Contain    Yhteystiedot ja saapuminen
    Sleep    1
    Go Back

    #Riihimäki
    Sleep    1

    Click Link    xpath:/html/body/main/article/div[6]/div/article[6]/div/h3/a
    Page Should Contain    Riihimäen kampus
    Sleep    1

    Scroll Element Into View    xpath:/html/body/main/article/div[4]/div
    #xpath:/html/body/main/article/div[5]/div
    Page Should Contain    Yhteystiedot ja saapuminen
    Sleep    1
    Go Back

    #Valkeakoski
    Sleep    1

    Click Link    xpath:/html/body/main/article/div[6]/div/article[7]/div/h3/a
    Page Should Contain    Valkeakosken kampus
    Sleep    1

    Scroll Element Into View    xpath:/html/body/main/article/div[5]/div
    Page Should Contain    Yhteystiedot ja saapuminen
    Sleep    1
    Close Browser
