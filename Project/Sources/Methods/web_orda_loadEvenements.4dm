//%attributes = {"publishedWeb":true}
C_TEXT:C284($0; $1)

//var selectionEvenements : Object
//selectionEvenements:=ds.EVENEMENT.all().orderBy("Nom")

var web_context : Object

If (web_context=Null:C1517)
	web_context:=New object:C1471
End if 

web_context.selectionEvenements:=ds:C1482.EVENEMENT.all().orderBy("Libelle")