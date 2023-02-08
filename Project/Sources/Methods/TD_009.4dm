//%attributes = {}

var $nomBoutique : Text
$nomBoutique:="Boutique_TD_009"

Begin SQL
	
	INSERT INTO BOUTIQUE
	(NOM)
	VALUES
	(:$nomBoutique);
	
End SQL

ALERT:C41("Done")