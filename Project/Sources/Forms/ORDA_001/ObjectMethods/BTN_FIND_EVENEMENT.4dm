If (Form:C1466.searched_evenement="")
	Form:C1466.evenements:=ds:C1482.EVENEMENT.all().orderBy("Libelle asc")
Else 
	//Form.evenements:=ds.EVENEMENT.query("Libelle = :1 or Date_Debut = :1 or Date_Fin = :1"; Form.searched_evenement).orderBy("Libelle asc")
	
	Form:C1466.evenements:=ds:C1482.EVENEMENT.query("Libelle like :1 or Date_Debut like :2 or Date_Fin like :2"; Form:C1466.searched_evenement; Date:C102(Form:C1466.searched_evenement)).orderBy("Libelle asc")
End if 