*** Settings ***
Resource    %{WORKSPACE_PRESENSATION_ROBOT}/metiers/variables_library_global.resource

*** Keywords ***
Creer dictionnaire global variables
    ${TEMP_DICT_GLOBAL}    BuiltIn.Create Dictionary
    ExcelLibrary.Open Excel Document    ${EXCEL_FILE_CHEMIN}   NONE
    ${numero_cas_de_test_en_cours}=  set variable  0
    #@{list_sheet}=  BuiltIn.Create List	    Marvel	Partenaire	Back vente

    #FOR    ${excel_feuille_liste}    IN    @{list_sheet}
        ${colonne_variables}        ExcelLibrary.Read Excel Row   row_num=0    col_offset=0  max_num=0   sheet_name=${EXCEL_FEUILLE}
        ${nb_colonne_variables}     BuiltIn.Get length    ${colonne_variables}
        ${lignes_variables}         ExcelLibrary.Read Excel Column   col_num=1  row_offset=0    max_num=0   sheet_name=${EXCEL_FEUILLE}
        ${nb_lignes_variables}      BuiltIn.Get length    ${lignes_variables}
        FOR     ${numero_de_la_colonne}  IN RANGE    ${COLONNE_INUTILE} + 1    ${nb_colonne_variables} + 1
            jdd.Recuperer JDD   ${numero_de_la_colonne}   ${nb_lignes_variables}  ${EXCEL_FEUILLE}
            Collections.Set To Dictionary   ${TEMP_DICT_GLOBAL}     ${numero_cas_de_test_en_cours}      ${TEMP_DICT}
            ${numero_cas_de_test_en_cours}  Evaluate    ${numero_cas_de_test_en_cours} + 1
        END
    #END
    BuiltIn.Set Suite Variable   ${TEMP_DICT_GLOBAL}
    ExcelLibrary.Close All Excel Documents

    Log     ${TEMP_DICT_GLOBAL}
    [RETURN]      ${TEMP_DICT_GLOBAL}
    

Selectionner un dictionnaire
    [Arguments]     ${liste_cle_dico}   ${numero_cle}

    ${dico}    Collections.Get From Dictionary   ${TEMP_DICT_GLOBAL}     ${liste_cle_dico}[${numero_cle}]
    BuiltIn.Set Suite Variable   ${dico}
    BuiltIn.Log Variables
    [RETURN]      ${dico}

Recuperer JDD
    [Arguments]     ${numero_de_la_colonne}   ${nb_lignes_variables}  ${excel_feuille_liste}
    ${TEMP_DICT}    BuiltIn.Create Dictionary
    #Sheet JDD
    #${SQUAD}=       String.Replace String
    #...             string=${excel_feuille_liste}
    #...             search_for=${SPACE}
    #...             replace_with=_
    #Collections.Set To Dictionary  ${TEMP_DICT}     Squad      ${SQUAD}

    FOR     ${cellule}  IN RANGE    ${nb_lignes_variables}
        ${cellule}    Evaluate    1 + ${cellule}
        ${nom_var}   ExcelLibrary.Read Excel Cell    row_num=${cellule}     col_num=1             sheet_name=${excel_feuille_liste}
        ${val_var}   ExcelLibrary.Read Excel Cell    row_num=${cellule}     col_num=${numero_de_la_colonne}     sheet_name=${excel_feuille_liste}
        Collections.Set To Dictionary  ${TEMP_DICT}     ${nom_var}      ${val_var}
    END
    BuiltIn.Set Suite Variable   ${TEMP_DICT}
    [RETURN]      ${TEMP_DICT}

Creer les variables du test
    [Arguments]     ${choix_dico}

    # Creer dictionnaire global variables
    ${liste_cle_dico}    Collections.Get Dictionary Keys   ${TEMP_DICT_GLOBAL}
    ${nb_liste_cle_dico} =  Get Length  ${liste_cle_dico}
    Log     ${liste_cle_dico}
    Selectionner un dictionnaire    ${liste_cle_dico}   ${choix_dico}
    ${nbVar} =  Get Length  ${dico}
    FOR  ${index}  IN   @{dico}
        ${var}     Set Variable    ${index}
        BuiltIn.Set Test Variable       ${index}        ${dico}[${index}]
        BuiltIn.Set Test Variable       ${${var}}       ${index}
    END

