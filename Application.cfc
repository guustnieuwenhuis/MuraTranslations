<!---
   Copyright 2011 Blue River Interactive

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
--->
<cfcomponent output="false">
	
	<cfinclude template="../../config/applicationSettings.cfm">
	<cftry>
	<cfinclude template="../../config/mappings.cfm">
	<cfinclude template="../mappings.cfm">
	<cfcatch></cfcatch>
	</cftry>
	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfargument name="thePage" type="string" required="true">


		<cfinclude template="../../config/settings.cfm">

		<cfreturn true>
	</cffunction>
	
	<!--- <cffunction name="onSessionEnd" returnType="void">
	   <cfargument name="SessionScope" required=True/>
	   <cfargument name="ApplicationScope" required=False/>
	  		<cfabort>
	</cffunction> --->

</cfcomponent>