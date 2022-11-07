*** Settings ***
Resource    %{WORKSPACE_PRESENSATION_ROBOT}/metiers/variables_library_global.resource



*** Keywords ***
Verifier validation produit
    SeleniumLibrary.Wait Until Page Contains Element    locator=//h3[contains(text(), "Votre demande est enregistrée")]
    ...                                                 error=La page ne s'affiche pas correctement
    # Sleep    2
