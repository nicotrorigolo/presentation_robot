*** Settings ***
Resource    %{WORKSPACE_PRESENSATION_ROBOT}/metiers/variables_library_global.resource



*** Keywords ***
Configuration produit
    pageConfiguration_produit.Configurer le produit
    pageConfiguration_produit.Renseigner coordonnees
    pageConfiguration_produit.Cocher checkbox obligatoire
    commun.Cliquer sur element    locator=//span[contains(text(), "Valider")]/..


Configurer le produit
    pageConfiguration_produit.Choisir type de chauffage actuel
    #Sleep    0.5
    pageConfiguration_produit.Choisir type de chauffage souhaite
    #Sleep    0.5
    pageConfiguration_produit.Choisir emetteurs de chaleur actuels
    #Sleep    0.5
    pageConfiguration_produit.Choisir type de logement
    #Sleep    0.5
    pageConfiguration_produit.Choisir annee de construction
    #Sleep    0.5
    pageConfiguration_produit.Choisir renovation
    #Sleep    0.5
    pageConfiguration_produit.Choisir Surface habitable


Renseigner coordonnees
    pageConfiguration_produit.Choisir civilite
    #Sleep    0.5
    pageConfiguration_produit.Saisir prenom
    #Sleep    0.5
    pageConfiguration_produit.Saisir nom
    #Sleep    0.5
    pageConfiguration_produit.Saisir mail
    #Sleep    0.5
    pageConfiguration_produit.Saisir numero de telephone
    #Sleep    0.5
    pageConfiguration_produit.Saisir numero de rue
    #Sleep    0.5
    pageConfiguration_produit.Saisir nom de rue
    #Sleep    0.5
    pageConfiguration_produit.Saisir code postal
    #Sleep    0.5
    pageConfiguration_produit.Saisir ville
    #Sleep    0.5
    pageConfiguration_produit.Saisir date de rendez vous souhaite
    #Sleep    0.5

Cocher checkbox obligatoire
    pageConfiguration_produit.Cocher checkbox Politique de Confidentialite
    pageConfiguration_produit.Cocher checkbox Condition general

Choisir civilite
    commun.Cliquer sur element    locator=//span[contains(text(), "${civilite}")]/..

Saisir prenom
    commun.Saisir sur element    locator=//input[@name="firstname"]
    ...                          text=${prenom}

Saisir nom
    commun.Saisir sur element    locator=//input[@name="lastname"]
    ...                          text=${nom}

Saisir mail
    commun.Saisir sur element    locator=//input[@name="email"]
    ...                          text=${mail}

Saisir numero de telephone
    commun.Saisir sur element    locator=//input[@name="phone"]
    ...                          text=${numero_de_telephone}

Saisir numero de rue
    commun.Saisir sur element    locator=//input[@name="streetnumber"]
    ...                          text=${numero_de_rue}

Saisir nom de rue
    commun.Saisir sur element    locator=//input[@name="street"]
    ...                          text=${nom_rue}

Saisir code postal
    commun.Saisir sur element    locator=//input[@name="postalcode"]
    ...                          text=${code_postal}

Saisir ville
    commun.Saisir sur element    locator=//input[@name="city"]
    ...                          text=${ville}

Saisir date de rendez vous souhaite
    commun.Saisir sur element    locator=//input[@name="date"]
    ...                          text=${date_de_rendez_vous_souhaite}

Choisir type de chauffage actuel
    commun.Cliquer sur element    locator=//label[contains(text(), "${type_de_chauffage_actuel}")]/..
    
Choisir type de chauffage souhaite
    commun.Cliquer sur element    locator=//label[contains(text(), "${type_de_chauffage_souhaite}")]/..

Choisir emetteurs de chaleur actuels
    commun.Cliquer sur element    locator=//label[contains(text(), "${emetteur_de_chaleur_actuels}")]/..

Choisir type de logement
    commun.Cliquer sur element    locator=//label[contains(text(), "${type_de_logement}")]/..

Choisir annee de construction
    commun.Cliquer sur element    locator=//label[contains(text(), "${annee_de_construction}")]/..

Choisir renovation
    commun.Cliquer sur element    locator=//label[contains(text(), "${type_renovation}")]/..
    commun.Cliquer sur element    locator=//span[contains(text(), "Suivant")]

Choisir Surface habitable
    commun.Saisir sur element     locator=//input[@id="sui-input-0"]
    ...                           text=${surface_habitable}
    commun.Cliquer sur element    locator=//span[contains(text(), "Suivant")]

Cocher checkbox urgent
    commun.Cliquer sur element    locator=//input[@name="urgent"]/..//div[@class="sui-checkbox-container"]

Cocher checkbox Politique de Confidentialite
    commun.Cliquer sur element    locator=//input[@name="transactionalOptIn"]/..//div[@class="sui-checkbox-container"]

Cocher checkbox Condition general
    commun.Cliquer sur element    locator=//input[@name="termsOfServiceOptIn"]/..//div[@class="sui-checkbox-container"]

Cocher checkbox Recevoir par email des informations commerciales
    commun.Cliquer sur element    locator=//input[@name="optInEmail"]/..//div[@class="sui-checkbox-container"]
    




