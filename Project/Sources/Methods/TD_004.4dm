//%attributes = {}
Begin SQL
	
	DELETE FROM EVENEMENT WHERE EVENEMENT.ID=1;
	
End SQL

ALERT:C41("EVENEMENT SUPPR")