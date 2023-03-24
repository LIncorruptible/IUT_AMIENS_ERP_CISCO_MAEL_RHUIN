//%attributes = {"publishedWeb":true}
C_TEXT:C284($0; $1)

var $result : Object
$result:=New object:C1471

$parameters:=tools_getArguments

$result.error_code:=-1
$result.error_message:="C'est pas fini ..."

Case of 
	: ($parameters.w_email=Null:C1517)
	: ($parameters.w_prenom=Null:C1517)
	: ($parameters.w_nom=Null:C1517)
	: ($parameters.w_password=Null:C1517)
	: ($parameters.w_email="")
	: ($parameters.w_prenom="")
	: ($parameters.w_nom="")
	: ($parameters.w_password="")
	Else 
		$result.error_code:=0
		$result.error_message:="OK"
End case 

If ($result.error_code=0)
	var $s_utilisateurs : cs:C1710.UTILISATEURSelection
	$s_utilisateurs:=ds:C1482.UTILISATEUR.query("Email === :1"; $parameters.w_email)
	
	If ($s_utilisateurs.length=0)
		var $e_utilisateur : cs:C1710.UTILISATEUREntity
		$e_utilisateur:=ds:C1482.UTILISATEUR.new()
		$e_utilisateur.Email:=$parameters.w_email
		$e_utilisateur.Prenom:=$parameters.w_prenom
		$e_utilisateur.Nom:=$parameters.w_nom
		$e_utilisateur.Password_hash:=Generate digest:C1147($parameters.w_password; SHA256 digest:K66:4)
		
		$e_utilisateur.save()
	Else 
		$result.error_code:=-3
		$result.error_message:="L'utilisateur existe déjà !"
	End if 
End if 

var $resultText : Text
$resultText:=JSON Stringify:C1217($result)

WEB SEND TEXT:C677($resultText; "application/json")