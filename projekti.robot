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
Milun projekti testi
    Open browser    http://www.hamk.fi    Chrome
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window

    Sleep    3

    #evästeet
    Click Element    xpath:/html/body/div[1]/div/div[4]/div[1]/div/div[2]/button[4]
    Sleep    1
    
    #Avaa koulutuslistaus
    Click Element    xpath:/html/body/main/article/div[1]/div/div/div/div[2]/div/div/a
    Sleep    3

    #Avaa suodatin ja valitse vaihtoehto
    Click Element    xpath:/html/body/main/article/div[2]/div/div[1]/fieldset[8]/button
    Sleep    1
    Click Element    xpath:/html/body/main/article/div[2]/div/div[1]/fieldset[8]/div/div[2]/label
    Sleep    1

    #Avaa kolmas kortti
    Click Element    xpath:/html/body/main/article/div[2]/div/div[2]/div[2]/div[1]/article[3]/a
    Sleep    4

    #Otsikko löytyy sivulta
    ${otsikko}=    Get Text    xpath://main//h1
    Page Should Contain    ${otsikko}


    # Tarkistus ennen bugia
    ${onko_nakyvissa}=    Run Keyword And Return Status    Element Should Be Visible    xpath:/html/body/main/article/div[5]/div[4]/div[2]/div/div[2]/div/div/div/div
    Run Keyword If    not ${onko_nakyvissa}    Log To Console    "Elementti ei ole näkyvissä ennen skrollausta"

    Scroll Element Into View    xpath:/html/body/main/article/div[5]/div[4]/div[2]/div/div[2]/div/div/div/div
    Sleep    2
    Capture Page Screenshot

    Sleep    3

    # Yritä silti klikata, bugi
    Click Element    xpath:/html/body/main/article/div[5]/div[4]/div[2]/div/div[2]/div/div/div/