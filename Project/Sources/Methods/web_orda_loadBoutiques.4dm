//%attributes = {}
C_TEXT:C284($0; $1)
C_LONGINT:C283($ID_EVENEMENT)

$ID_EVENEMENT:=1  // insérez ici l'ID de l'événement pour lequel vous voulez charger les boutiques

ALL RECORDS:C47([BOUTIQUE:2])
QUERY:C277([BOUTIQUE:2]; [BOUTIQUE:2]ID_EVENEMENT:3=$ID_EVENEMENT)
ORDER BY:C49([BOUTIQUE:2]; [BOUTIQUE:2]Nom:2; >)