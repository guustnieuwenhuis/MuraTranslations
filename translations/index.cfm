﻿<cfinclude template="../plugin/config.cfm" />
<cfset exportTranslation=createObject("component","plugins.#pluginConfig.getDirectory()#.cfcs.exportTranslation")>

<cfif structKeyExists(form,"doaction")>
	<cfif form.doaction eq "export">
		
		<cfif not isDate(form.export_date)>
			<cfset form.export_date = createDate(1900,1,1) />
		</cfif>
		
		<cfset exportKey = exportTranslation.createExport($,form.export_date,form.template) />
		
		<cfif len(exportKey)>
			<cfset form.export_action="download" />
		</cfif>
	<cfelseif form.doaction eq "doimport">
		<cfset importKey = rereplace(createUUID(),"-","","all") />
		<cfset importDirectory = expandPath("/#pluginConfig.getDirectory()#/temp/#importKey#") />

		<cfif not directoryExists(importDirectory)>
			<cfset directoryCreate(importDirectory)>
		</cfif>

		<cffile action="upload" filefield="import_file" destination="#importDirectory#" >

		<cfset exportKey = exportTranslation.importTranslation($,form.template,file.serverDirectory,file.serverFile) />

		<cfset form.export_action="complete" />
	</cfif>
</cfif>


<cfparam name="panel" default="#StructNew()#" />
<cfparam name="panel.page" default="home" />

<cfif structKeyExists(form,"export_action")>
	<cfset panel.page = form.export_action />
</cfif>

<cfsavecontent variable="body">
<cfoutput>
	<h2>#pluginConfig.getName()#</h2>
	<cfswitch expression="#panel.page#">
		<cfcase value="export">
			<cfinclude template="./export.cfm" >
		</cfcase> 
		<cfcase value="download">
			<cfinclude template="./download.cfm" >
		</cfcase> 
		<cfcase value="complete">
			<cfinclude template="./complete.cfm" >
		</cfcase> 
		<cfcase value="import">
			<cfinclude template="./import.cfm" >
		</cfcase> 
		<cfdefaultcase>
			<cfinclude template="./home.cfm" >
		</cfdefaultcase>
	</cfswitch>
</cfoutput></cfsavecontent>
<cfoutput>
#application.pluginManager.renderAdminTemplate(body=body,pageTitle=pluginConfig.getName())#
</cfoutput>
