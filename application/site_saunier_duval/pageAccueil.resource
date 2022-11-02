*** Settings ***
Resource    %{WORKSPACE_PRESENSATION_ROBOT}/metiers/variables_library_global.resource



*** Keywords ***
Acceder au configurateur de produit
    pageAccueil.Cliquer sur produit et documentation
    pageAccueil.Cliquer sur configurateur de produits


Cliquer sur produit et documentation
    commun.Cliquer sur element    locator=//a[contains(text(), "Produits et documentations")] 


Cliquer sur configurateur de produits
    commun.Cliquer sur element    locator=//a[contains(text(), "Configurateur produits")] 



