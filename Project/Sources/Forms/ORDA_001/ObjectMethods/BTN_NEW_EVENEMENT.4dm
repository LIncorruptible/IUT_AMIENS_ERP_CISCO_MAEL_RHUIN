Form:C1466.displayed_evenements:=ds:C1482.EVENEMENT.new()

Form:C1466.displayed_evenements.Libelle:="LIBELLE A AJOUTER"
Form:C1466.displayed_evenements.Date_Debut:=Current date:C33
Form:C1466.displayed_evenements.Date_Fin:=Current date:C33

ui_load_evenements

ALERT:C41("Evènement ajouté à la BDD !")