//%attributes = {}
var $compteur : Integer

Begin SQL
	
	SELECT COUNT(*) FROM BOUTIQUE
	INTO :$compteur;
	
End SQL

ALERT:C41(String:C10($compteur))