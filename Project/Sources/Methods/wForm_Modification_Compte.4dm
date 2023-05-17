//%attributes = {"publishedWeb":true}
C_TEXT:C284($0; $1)

var $result : Object
$result:=New object:C1471
$parametres:=tool_getArguments

$result.error_code:=-1
$result.error_message:="C'est pas fini..."

Case of 
	: ($parametres.w_email=Null:C1517)
	: ($parametres.w_prenom=Null:C1517)
	: ($parametres.w_nom=Null:C1517)
	: ($parametres.w_email="")
	: ($parametres.w_prenom="")
	: ($parametres.w_nom="")
	Else 
		$result.error_code:=0
		$result.error_message:="OK"
End case 
If ($result.error_code=0)
	If (web_context.UTILISATEUR#Null:C1517)
		$e_utilisateur.Nom=$parametres.w_nom
		$e_utilisateur.Prenom=$parametres.w_prenom
		$e_utilisateur.Email=$parametres.w.EMail
		If ($parametres.w_password#Null:C1517)
			If ($parametres.w_password#"")
				$e_utilisateur.Password_hash:=Generate digest:C1147($parametres.w_password; SHA256 digest:K66:4)
			End if 
		End if 
		$e_utilisateur.save()
	End if 
End if 

var $resultText : Text
$resultText:=JSON Stringify:C1217($result)

WEB SEND TEXT:C677($resultText; "application/json")