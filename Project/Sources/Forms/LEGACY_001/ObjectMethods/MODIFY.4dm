READ WRITE:C146([EVENEMENT:1])
LOAD RECORD:C52([EVENEMENT:1])

If (Locked:C147([EVENEMENT:1]))
	ALERT:C41("QQ1 modifie déjà l'enreg.")
Else 
	ui_evenements_display
End if 