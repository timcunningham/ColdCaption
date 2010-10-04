﻿<cfcomponent>
<cffunction name="sendfile">
	<cfargument name="userName" type="string" required="true">
	<cfargument name="password" type="string" required="true">
	<cfargument name="filePath" type="string" required="true">
	<cfargument name="audioFormat" type="string" required="true" default="wav">
	<cfargument name="savetoPath" type="string" required="false">
	<cfargument name="reference" type="string" required="false">
	<cfset var fileBase64 = "">
	<cfset var strXML = "">
	<cfset var xmlDoc = "">
	<cfset var messageID = 1>
	<cfset var returnStruct = "">
	
	<cfif ISDefined("arguments.reference") IS False>
		<cfset arguments.reference = "">
	</cfif>
	
	<cffile action="readBinary" file="#arguments.filePath#" variable="fileBase64">
	<cfset fileBase64 = toBase64(fileBase64)>
	<cfoutput>
	<cfsavecontent variable="strXML">
	<?xml version="1.0" encoding="UTF-8"?>
		<mycaption_input>
			<message_type>STANDARD</message_type>
			<txn_reference>#arguments.reference#</txn_reference>
			<voice>#fileBase64#</voice>
			<audio_format>#audioFormat#</audio_format>
		</mycaption_input>
	</cfsavecontent>
	</cfoutput>
	
	<cfhttp url="https://api.mycaption.com/api/upload_voice" method="post"  username="#userName#" password="#password#">
		<cfhttpparam type="formfield" name="xml_file" value="#trim(strXML)#">	
	</cfhttp>
	<cfset xmlDoc = xmlParse(cfhttp.FileContent)>

	<cfif findNocase("message_id", xmlDoc)>
		<cfset messageID = xmlDOC.upload_voice_response.message_id.XmlText>
	</cfif>

	<cfset returnStruct = duplicate(cfhttp)>
	<cfset returnStruct.message_id = messageID>
	<cfif messageID GT 1 AND ISDefined("arguments.savetoPath")>
		<cffile action="write" file="#arguments.savetoPath#/#messageID#.json" output="#serializeJSON(returnStruct)#">
	</cfif>	
	<cfreturn returnStruct>
</cffunction>


<cffunction name="getResponse">
	<cfargument name="messageID" type="numeric" required="true">
	<cfargument name="userName" type="string" required="true">
	<cfargument name="password" type="string" required="true">
	<cfset var messageText = "">
	

		<cfhttp url="https://api.mycaption.com/api/download_text_data" method="post"  username="#arguments.username#" password="#arguments.password#">
			<cfhttpparam type="formfield" name="message_id" value="#arguments.messageID#">	
			<cfhttpparam type="formfield" name="api_version" value="2">	
		</cfhttp>
		
		<cfset xmlDoc = xmlParse(cfhttp.FileContent)>
		<cfif findNocase("converted_text", xmlDoc)>
			<cfset messageText = xmlDOC.download_text_data_response.converted_text.XmlText>
		<cfelse>
			<cfset messageText = "">
		</cfif>
		
		<cfif findNoCase("txn_reference", xmlDoc)>
			<cfset reference = xmlDOC.download_text_data_response.txn_reference.XmlText>
		<cfelse>
			<cfset reference = "">
		</cfif>
		
		<cfif findNoCase("<message>", xmlDoc)>
			<cfoutput> >> #xmlDOC.download_text_data_response.message.XmlText#</cfoutput>
		</cfif>
		<cfset var returnStruct = structNew()>
		<cfset returnStruct = duplicate(cfhttp)>
		<cfset returnStruct.messageText = messageText>
		<cfset returnStruct.reference = reference>	
	<cfreturn returnStruct>
</cffunction>


</cfcomponent>