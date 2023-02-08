//%attributes = {}

var $result : Text
var $curs_boutique; $curs_article; $idBoutique : Integer
var $nbrePostes : Integer
var $nomArticle : Text

// Pour commencer, on récupère les IDs de l'ensemble des Boutiques
ARRAY LONGINT:C221($aIDs; 0)

Begin SQL
	
	SELECT ID FROM BOUTIQUE
	INTO :$aIDs;
	
End SQL

// Maintenant on boucle sur les boutiques pour créer des articles
For ($curs_boutique; 1; Size of array:C274($aIDs))
	
	// On définit le nombre d'articles à créer au hasard
	
	$monRandom:=Random:C100%5  // 0, 1, 2, 3 ou 4
	
	$nbreArticles:=$monRandom
	
	For ($curs_article; 1; $nbreArticles)
		
		// On définit le nom de l'article
		Case of 
			: ($curs_article=1)
				$nomArticle:="Article_"+String:C10($curs_article+Random:C100%10)
			: ($curs_article=2)
				$nomArticle:="Article_"+String:C10($curs_article+Random:C100%10)
			: ($curs_article=3)
				$nomArticle:="Article_"+String:C10($curs_article+Random:C100%10)
			Else 
				$nomArticle:="Article_"+String:C10($curs_article+Random:C100%10)
		End case 
		
		$idBoutique:=$aIDs{$curs_boutique}
		
		var $prixHT : Real
		var $tauxTVA : Real
		
		$prixHT:=Random:C100%50
		$tauxTVA:=1+(Random:C100%20)/100
		
		Begin SQL
			
			INSERT INTO ARTICLE
			(ID_BOUTIQUE, Libelle, Prix_HT, Taux_TVA)
			VALUES
			(:$idBoutique, :$nomArticle, :$prixHT, :$tauxTVA);
			
		End SQL
		
		
	End for 
	
End for 

ALERT:C41("Done")