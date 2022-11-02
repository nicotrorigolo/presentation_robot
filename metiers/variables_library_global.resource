*** Settings ***
Library         Collections
Library         ExcelLibrary
Library         OperatingSystem
Library         String
# Library         DebugLibrary
Library         SeleniumLibrary    
Library         BuiltIn
Library         Process
Library         DateTime
Resource        %{WORKSPACE_PRESENSATION_ROBOT}/metiers/jdd.resource
#Les resources des pages :
Resource        %{WORKSPACE_PRESENSATION_ROBOT}/application/commun.resource
Resource        %{WORKSPACE_PRESENSATION_ROBOT}/application/site_saunier_duval/pageAccueil.resource
Resource        %{WORKSPACE_PRESENSATION_ROBOT}/application/site_saunier_duval/pageConfiguration_produit.resource


#Parcours :
Resource        %{WORKSPACE_PRESENSATION_ROBOT}/application/parcours/test_auto.resource

*** Variables ***
${EXCEL_FILE_CHEMIN}            %{WORKSPACE_PRESENSATION_ROBOT}/JDD.xlsx
${COLONNE_INUTILE}              2
${ROBOT_DEPLOY_CHEMIN}          %{WORKSPACE_PRESENSATION_ROBOT}/application/template/data_template.robot
${EXCEL_FEUILLE}                feuille_jdd
${GLOBAL_TIMEOUT}               30 seconds
${DOWNLOAD_DIR}                 %{WORKSPACE_PRESENSATION_ROBOT}
${NAVIGATEUR}                   chrome
