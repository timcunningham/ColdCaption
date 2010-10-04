<!-- Coldfusion Utility Class for the myCaption API 
Contributed by: Timothy Cunningham 
Date:		10/4/2010
email:		timcunningham71@gmail.com
homepage:	CFMumbojumbo.com

-->

Steps to get a simple MyCaption example working.

1.Get a Developer's API username and password from myCaption.com

2. Copy myCaptionAPI.cfc to your ColdFusion web root (code at gitHub http://github.com/timcunningham/Coldcaption/blob/master//myCaptionAPI.cfc)

3. Create a wav file of one person talking.

4.Send the WAV file to the MyCaptionAPI using the sendExample.cfm  code: ( http://github.com/timcunningham/Coldcaption/blob/master//sendExample.cfc )

5.This will give you a Message_ID. Wait a minute or two and get the response by using the message_ID in the receiveExample.cfm code: ( http://github.com/timcunningham/Coldcaption/blob/master//receiveExample.cfc )

Your transcribed messag will be in the MESSAGETEXT section of the returned structure.

