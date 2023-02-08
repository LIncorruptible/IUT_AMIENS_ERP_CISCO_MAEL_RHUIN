//%attributes = {}
ALL RECORDS:C47([EVENEMENT:1])
ORDER BY:C49([EVENEMENT:1]; [EVENEMENT:1]ID:1; >)

If (Locked:C147([EVENEMENT:1]))
	ALERT:C41("QQ1 modifie déjà l'enregistrement.")
Else 
	ui_evenements_display
End if 