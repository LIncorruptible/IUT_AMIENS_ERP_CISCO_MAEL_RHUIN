//%attributes = {}
// Déclarez les variables
var $result : Text
var $i : Integer
ARRAY TEXT:C222($aArticles; 0)
ARRAY TEXT:C222($aBoutiques; 0)

// Sélectionnez tous les articles et leur boutique
$result+="Liste des articles avec la boutique :"

Begin SQL
	SELECT ARTICLE.LIBELLE, BOUTIQUE.NOM
	FROM ARTICLE
	LEFT JOIN BOUTIQUE
	ON ARTICLE.ID_BOUTIQUE=BOUTIQUE.ID
	INTO : $aArticles, : $aBoutiques; 
End SQL

// Parcourez les articles et les boutiques sélectionnés
For ($i; 1; Size of array:C274($aBoutiques))
	If ($aBoutiques{$i}#Null:C1517)
		$result+="Article : "+$aArticles{$i}+", Boutique : "+$aBoutiques{$i}+"\r"
	Else 
		$result+="Article : "+$aArticles{$i}+", Boutique : Non spécifiée"+"\r"
	End if 
End for 

// Affichez le résultat
ALERT:C41($result)

