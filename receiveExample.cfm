<cfset myCap = createObject("component", "mycaptionAPI")>
<cfset response = mycap.getResponse(messageID="IDFromtheSendExample", username="APIUserName", password="APIPassword")>
<cfdump var="#response#">
