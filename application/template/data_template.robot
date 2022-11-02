*** Settings ***
Resource    %{WORKSPACE_PRESENSATION_ROBOT}/metiers/variables_library_global.resource

Suite Setup         Initialisation des Tests Cases
Test Template       Debut du test case
Test Teardown       Fermeture Navigateur


*** Keywords ***
Initialisation des Tests Cases
    SeleniumLibrary.Set Selenium Timeout    ${GLOBAL_TIMEOUT}
    jdd.Creer dictionnaire global variables

Debut du test case
    [Arguments]     ${choix_dico}
    jdd.Creer les variables du test    ${choix_dico}
    test_auto.Parcours configurateur de produit


Fermeture Navigateur
    BuiltIn.Run Keyword If Test Passed      SeleniumLibrary.Close All Browsers

*** Test Cases ***
