//%attributes = {"invisible":true}
C_PICTURE:C286($0; $pic)
C_BLOB:C604($base64_x)
C_TEXT:C284($1; $data_t)
C_TEXT:C284($inputPath_t; $input_t; vData; $output_t; $outputPath_t; $area_t; $res_t)
C_LONGINT:C283($len_l)
C_OBJECT:C1216($file_o; $config_o)

$data_t:=$1

$inputPath_t:=Get 4D folder:C485(Current resources folder:K5:16)+"template.html"
$input_t:=Document to text:C1236($inputPath_t)
vData:=convertSpecChars($data_t)
vPic:=""
PROCESS 4D TAGS:C816($input_t; $output_t)
$outputPath_t:=Get 4D folder:C485(Current resources folder:K5:16)+"output.html"
TEXT TO DOCUMENT:C1237($outputPath_t; $output_t)

$file_o:=File:C1566("/RESOURCES/output.html")
$area_t:="Web Area"
$config_o:=cs:C1710.OffscreenArea.new($file_o; $area_t)
$res_t:=WA Run offscreen area:C1727($config_o)

$len_l:=Length:C16("data:image/png;base64,")

If (Length:C16($res_t)>$len_l)
	$res_t:=Delete string:C232($res_t; 1; $len_l)
	BASE64 DECODE:C896($res_t; $base64_x)
	BLOB TO PICTURE:C682($base64_x; $pic)
End if 

$0:=$pic
