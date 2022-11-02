*** Settings ***
Resource    %{WORKSPACE_PRESENSATION_ROBOT}/metiers/variables_library_global.resource



*** Keywords ***
Parcours configurateur de produit
    commun.Connexion au site
    pageAccueil.Acceder au configurateur de produit
    pageConfiguration_produit.Configuration produit






Connexion au site de Google
    Open Browser    ${url}    ${browser} 
    Maximize Browser Window    # Mettre la fenetre de chrome en plein ecran



