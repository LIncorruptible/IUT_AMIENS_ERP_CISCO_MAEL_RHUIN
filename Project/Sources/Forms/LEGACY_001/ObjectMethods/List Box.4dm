Case of 
	: (Form event code:C388=On Load:K2:1)
		load_evenements
		
	: (Form event code:C388=On Selection Change:K2:29)
		READ ONLY:C145(*)
		var $col; $ligne : Integer
		LISTBOX GET CELL POSITION:C971(*; "List Box"; $col; $ligne)
		If ($ligne>0)
			GOTO SELECTED RECORD:C245([EVENEMENT:1]; $ligne)
		End if 
		
		ui_evenements_display
		
End case 
