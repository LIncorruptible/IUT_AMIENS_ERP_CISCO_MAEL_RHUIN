//%attributes = {}
C_OBJECT:C1216($0; $1)
C_OBJECT:C1216($es_boutiques)

$es_boutiques:=ds:C1482.BOUTIQUE.all().orderBy("Nom asc")

WEB SEND TEXT:C677(JSON Stringify:C1217($es_boutiques.toCollection()); "application/json")