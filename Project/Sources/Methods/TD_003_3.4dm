//%attributes = {}
var $curs_evenement; $nbreBoutiques : Integer
var $curs_boutique : Integer

ARRAY LONGINT:C221($aIDs; 0)

Begin SQL
	
	SELECT ID FROM EVENEMENT
	INTO :$aIDs;
	
End SQL

// Maintenant on boucle
For ($curs_evenement; 1; Size of array:C274($aIDs))
	
	$nbreBoutiques:=Random:C100%5  // 0.... 4
	For ($curs_boutique; 1; $nbreBoutiques)
		
		// On définit le nom de la boutique
		Case of 
			: ($curs_boutique=1)
				$nomBoutique:="BTQ A"
			: ($curs_boutique=2)
				$nomBoutique:="BTQ B"
			: ($curs_boutique=3)
				$nomBoutique:="BTQ C"
			Else 
				$nomBoutique:="BTQ D"
		End case 
		
		$idEvenement:=$aIDs{$curs_evenement}
		
		Begin SQL
			
			INSERT INTO BOUTIQUE
			(Nom, ID_Evenement)
			VALUES
			(:$nomBoutique, :$idEvenement);
			
		End SQL
		
	End for 
	
End for 
ALERT:C41("BOUTIQUES AJOUTEES")