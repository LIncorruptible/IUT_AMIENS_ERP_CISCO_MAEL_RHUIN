//%attributes = {}
var $result : Text
var $i : Integer

ARRAY INTEGER:C220($aID; 0)
ARRAY TEXT:C222($aNom; 0)

Begin SQL
	
	SELECT ID, NOM FROM BOUTIQUE
	INTO :$aID, :$aNom;
	
End SQL

For ($i; 1; Size of array:C274($aID))
	$result+=String:C10($aID{$i})+" - "+$aNom{$i}+"\r"
End for 

ALERT:C41($result)