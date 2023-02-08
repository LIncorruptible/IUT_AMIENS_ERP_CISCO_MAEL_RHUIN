//%attributes = {}
var $lockedRecord : Boolean
$lockedRecord:=Locked:C147([EVENEMENT:1])

OBJECT SET ENTERABLE:C238([EVENEMENT:1]Libelle:2; Not:C34($lockedRecord))
OBJECT SET ENTERABLE:C238([EVENEMENT:1]Date_Debut:3; Not:C34($lockedRecord))
OBJECT SET ENTERABLE:C238([EVENEMENT:1]Date_Fin:4; Not:C34($lockedRecord))

OBJECT SET ENABLED:C1123(*; "DELETE"; Not:C34($lockedRecord))
OBJECT SET ENABLED:C1123(*; "SAVE"; Not:C34($lockedRecord))