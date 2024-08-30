Demo on how to generate QR codes of various formats (contact info, URL, email, and phone call) using the [QR Code Styling](https://github.com/kozakdenys/qr-code-styling) JavaScript library. 
Included is a method "getQRPicure" that generates a QR code from input text and converts it into a picture for use within the application.

## Method: getQRPicture
INPUT:\
Text

OUTPUT:\
Picture

## Example

```4d
// Using a Picture field form object with expression 'Form.pic'
// and Input field form object with expression 'Form.inputData'
// The object method for a 'Generate QR Code Pict' button:

Form.pic:=getQRPicture(Form.inputData)
```
<img width="420" alt="Screenshot 2024-08-30 at 9 11 01 AM" src="https://github.com/user-attachments/assets/efc27ef2-9b24-4e59-aca6-702dafb4704d">
