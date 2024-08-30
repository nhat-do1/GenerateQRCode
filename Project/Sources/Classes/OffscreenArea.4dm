Class constructor
	C_OBJECT:C1216($1)
	C_TEXT:C284($2)
	
	This:C1470.url:=$1
	This:C1470.area:=$2
	
Function onEvent
	Case of 
		: (FORM Event:C1606.code=On End URL Loading:K2:47)
			C_TEXT:C284($base64_t)
			
			WA EXECUTE JAVASCRIPT FUNCTION:C1043(*; This:C1470.area; "getQRPicture"; $base64_t)
			This:C1470.result:=$base64_t
	End case 