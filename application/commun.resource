*** Settings ***
Resource    %{WORKSPACE_PRESENSATION_ROBOT}/metiers/variables_library_global.resource



*** Keywords ***
Connexion au site
    Open Browser    ${url}    ${browser} 
    Maximize Browser Window    # Mettre la fenetre de chrome en plein ecran
    commun.Choisir utilisation des cookies

Cliquer sur element
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...                                                 error=Element non present sur la page
    commun.Scroller vers element                        locator=${locator}
    SeleniumLibrary.Wait Until Element Is Visible       locator=${locator}
    ...                                                 error=Element non visible sur la page
    SeleniumLibrary.Wait Until Element Is Enabled       locator=${locator}
    ...                                                 error=Element non chargé completement
    SeleniumLibrary.Click Element    locator=${locator}

Saisir sur element
    [Arguments]    ${locator}    ${text}
    SeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...                                                 error=Element non present sur la page
    commun.Scroller vers element                        locator=${locator}
    SeleniumLibrary.Wait Until Element Is Visible       locator=${locator}
    ...                                                 error=Element non visible sur la page
    SeleniumLibrary.Wait Until Element Is Enabled       locator=${locator}
    ...                                                 error=Element non chargé completement
    SeleniumLibrary.Input Text                          locator=${locator}
    ...                                                 text=${text}










Scroller vers element
    [Arguments]    ${locator}
    SeleniumLibrary.Scroll Element Into View    locator=${locator}


Choisir utilisation des cookies
    commun.Cliquer sur element    locator=//*[@id="cookiewarning"]//a[contains(text(), "${choisir_cookies}")]

