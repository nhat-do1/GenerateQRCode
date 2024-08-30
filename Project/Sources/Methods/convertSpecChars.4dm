//%attributes = {}
C_TEXT:C284($1; $text; $0)
C_COLLECTION:C1488($text_coll)

$text:=$1

$text_coll:=Split string:C1554($text; "")

For ($i; 0; $text_coll.length-1)
	Case of 
		: ($text_coll[$i]="=")
			$text_coll[$i]:="*~e~*"
		: ($text_coll[$i]="&")
			$text_coll[$i]:="*~a~*"
		: ($text_coll[$i]="%")
			$text_coll[$i]:="*~p~*"
		: ($text_coll[$i]="'")
			$text_coll[$i]:="*~q~*"
		: ($text_coll[$i]="\"")
			$text_coll[$i]:="*~d~*"
			
	End case 
	
End for 

$0:=$text_coll.join("")