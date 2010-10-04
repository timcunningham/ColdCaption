<cfset myCap = createObject("component", "mycaptionAPI")>
<cfset send = myCap.sendfile(username="APIUsername", password="APIPassword", 
						filePath="Full Path to audiofile", audioFormat="wav,mp3,etc.", 
						reference="Optional", savetoPath="optional - saves debug to a json file")> 
						

<cfdump var="#send#">

<cfoutput>Send MessageID to the get response method: #send.message_ID#</cfoutput>

<cfset myCap = createObject("component", "mycaptionAPI")>
<cfset response = mycap.getResponse(messageID="364663", username="cunningham@idminc.com", password="silverdog")>
<cfdump var="#response#">
