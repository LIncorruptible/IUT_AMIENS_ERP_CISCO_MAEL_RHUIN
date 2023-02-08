//%attributes = {}
If (Form event code:C388=On Load:K2:1)
	Form:C1466.evenements:=ds:C1482.EVENEMENT.all().orderBy("Libelle asc")
End if 