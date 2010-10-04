<cfset myCap = createObject("component", "mycaptionAPI")>
<cfset send = myCap.sendfile(username="APIUsername", password="APIPassword", 
						filePath="Full Path to audiofile", audioFormat="wav,mp3,etc.", 
						reference="Optional", savetoPath="optional - saves debug to a json file")> 
						

<cfdump var="#send#">

<cfoutput>Send MessageID to the getresponse method: #send.message_ID#</cfoutput>


