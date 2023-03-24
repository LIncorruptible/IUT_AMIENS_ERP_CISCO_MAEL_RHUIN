//%attributes = {"publishedWeb":true}
C_TEXT:C284($0; $1)

var $result : Object
$result:=New object:C1471

$parameters:=tools_getArguments

$result.error_code:=-1
$result.error_message:="C'est pas fini ..."

Case of 
	: ($parameters.w_email=Null:C1517)
	: ($parameters.w_password=Null:C1517)
	: ($parameters.w_email="")
	: ($parameters.w_password="")
	Else 
		$result.error_code:=0
		$result.error_message:="OK"
End case 

If ($result.error_code=0)
	var $s_utilisateurs : cs:C1710.UTILISATEURSelection
	$s_utilisateurs:=ds:C1482.UTILISATEUR.query("Email === :1"; $parameters.w_email)
	
	If ($s_utilisateurs.length>0)
		var $e_utilisateur : cs:C1710.UTILISATEUREntity
		$e_utilisateur:=$s_utilisateurs.first()
		
		If ($e_utilisateur.Password_hash=Generate digest:C1147($parameters.w_password; SHA256 digest:K66:4))
			
			var web_context : Object
			If (web_context=Null:C1517)
				web_context:=New object:C1471
			End if 
			web_context.utilisateur:=$e_utilisateur
			
		Else 
			$result.error_code:=-2
			$result.error_message:="Mot de passe incorrect !"
		End if 
		
		
	Else 
		$result.error_code:=-3
		$result.error_message:="L'utilisateur n'existe pas !"
	End if 
End if 

var $resultText : Text
$resultText:=JSON Stringify:C1217($result)

WEB SEND TEXT:C677($resultText; "application/json")