//%attributes = {"publishedWeb":true}
C_TEXT:C284($0; $1)

var web_context : Object
var $result : Object
var $resultText : Text

$result:=New object:C1471
$result.error_code:=0
$result.error_message:=""

If (web_context=Null:C1517)
	web_context:=New object:C1471
End if 

web_context.utilisateur:=Null:C1517

$resultText:=JSON Stringify:C1217($result)

WEB SEND TEXT:C677($resultText; "application/json")