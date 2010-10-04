<!-- Coldfusion Utility Class for the myCaption API 
Contributed by: Timothy Cunningham 
Date:		10/4/2010
email:		timcunningham71@gmail.com
homepage:	CFMumbojumbo.com

Coldcaption, is a ColdFusion utility class to talk to the myCaption API.  It is a speech to text service. You send it a file and it will convert it to text for you (like google voice does).

Purpose: I hate listening to voicemails.  I am a page scanner, I want to see the whole message and pick out the meaning before I read the whole thing. You can't do that with voicemail, you have to wait for them to get to the point.

What this code demos: send a wav file to mycaption and receiving back the transcribed message.

-->

Steps to get a simple MyCaption example working.

1.Get a Developer's API username and password from myCaption.com

2. Copy myCaptionAPI.cfc to your ColdFusion web root (code at gitHub http://github.com/timcunningham/Coldcaption/blob/master//myCaptionAPI.cfc)

3. Create a wav file of one person talking.

4.Send the WAV file to the MyCaptionAPI using the sendExample.cfm  code: ( http://github.com/timcunningham/Coldcaption/blob/master//sendExample.cfc )

5.This will give you a Message_ID. Wait a minute or two and get the response by using the message_ID in the receiveExample.cfm code: ( http://github.com/timcunningham/Coldcaption/blob/master//receiveExample.cfc )

Your transcribed message will be in the MESSAGETEXT section of the returned structure.

