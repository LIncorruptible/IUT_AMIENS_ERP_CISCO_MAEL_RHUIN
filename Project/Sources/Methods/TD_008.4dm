//%attributes = {}
var $nbrArticles; $curs_article : Integer

$nbrArticles:=Random:C100%5

For ($curs_article; 1; $nbreArticles)
	var $nomArticle : Text
	var $prixHT; $tauxTVA : Real
	
	$nomArticle:="Article_Orphelin_"+String:C10($curs_article)
	
	$prixHT:=Random:C100%50
	$tauxTVA:=1+(Random:C100%20)/100
	
	Begin SQL
		
		INSERT INTO ARTICLE
		(ID_BOUTIQUE, Libelle, Prix_HT, Taux_TVA)
		VALUES
		(NULL, :$nomArticle, :$prixHT, :$tauxTVA);
		
	End SQL
	
End for 

ALERT:C41("Done")