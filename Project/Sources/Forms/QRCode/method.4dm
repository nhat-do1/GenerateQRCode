Case of 
	: (Form event code:C388=On Load:K2:1)
		C_TEXT:C284($path_t; $input_t; $output_t; $outputPath_t)
		
		$path_t:=Get 4D folder:C485(Current resources folder:K5:16)+"template.html"
		$input_t:=Document to text:C1236($path_t)
		
		Case of 
			: (Form:C1466.type="Contact")
				vData:="BEGIN:VCARD"
				vData:=vData+"\\nVERSION:4.0"
				vData:=vData+"\\nN:"+Form:C1466.lastName+";"+Form:C1466.firstName
				vData:=vData+"\\nEMAIL:"+Form:C1466.email
				vData:=vData+"\\nTEL:"+Form:C1466.phone
				vData:=vData+"\\nADR;TYPE=home:;;"+Form:C1466.street+";"+Form:C1466.city+",;"+Form:C1466.state+";"+Form:C1466.zip
				vData:=vData+"\\nEND:VCARD"
				
			: (Form:C1466.type="URL")
				vData:="http://"
				$url_text:=Form:C1466.url
				// fix for special characters in URL
				$convertedText:=convertSpecChars($url_text)
				vData:=vData+$convertedText
				
			: (Form:C1466.type="Email")
				vData:="mailto:"
				vData:=vData+Form:C1466.email
				
			: (Form:C1466.type="Phone")
				vData:="tel:"
				vData:=vData+Form:C1466.phone
		End case 
		
		
		If (Form:C1466.logo)
			vPic:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"LogoSVGb64.txt")
		Else 
			vPic:=""
		End if 
		
		PROCESS 4D TAGS:C816($input_t; $output_t)
		$outputPath_t:=Get 4D folder:C485(Current resources folder:K5:16)+"output.html"
		TEXT TO DOCUMENT:C1237($outputPath_t; $output_t)
		WA OPEN URL:C1020(*; "Web Area"; $outputPath_t)
		CLEAR VARIABLE:C89(vPic)
End case 
