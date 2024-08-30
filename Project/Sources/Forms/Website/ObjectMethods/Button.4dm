If (Form:C1466.trace)
	TRACE:C157
End if 

$window:=Open form window:C675("QRCode")
DIALOG:C40("QRCode"; Form:C1466.data)
CLOSE WINDOW:C154($window)