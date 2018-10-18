<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
</li>
<#assign appModelMenu = Static["org.apache.ofbiz.widget.model.MenuFactory"].getMenuFromLocation(applicationMenuLocation,applicationMenuName)>
<#if person?has_content>
  <#assign userName = (person.firstName!) + " " + (person.middleName!) + " " + person.lastName!>
<#elseif partyGroup?has_content>
  <#assign userName = partyGroup.groupName!>
<#elseif userLogin??>
  <#assign userName = userLogin.userLoginId>
<#else>
  <#assign userName = "">
</#if>
<#if defaultOrganizationPartyGroupName?has_content>
  <#assign orgName = " - " + defaultOrganizationPartyGroupName!>
<#else>
  <#assign orgName = "">
</#if>

			<#if appModelMenu.getModelMenuItemByName(headerItem)??>
			  <#if headerItem!="main">
			    <li><span>
			      ${appModelMenu.getModelMenuItemByName(headerItem).getTitle(context)}
			    </span></li>
			  </#if>
			</#if>
				
			<#if parameters.portalPageId?has_content && !appModelMenu.getModelMenuItemByName(headerItem)?? && userLogin??>
			    <#assign findMap = Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("portalPageId", parameters.portalPageId)>
			    <#assign portalPage = delegator.findOne("PortalPage", findMap, true)!>
			    <#if portalPage?has_content>
			      <li><span>
			        ${portalPage.get("portalPageName", locale)!}
			      </span></li>
			    </#if>
			</#if>
    </ul>
</div>
<div id="page_content">
<div id="page_content_inner">

<#if userLogin??>
<script type="text/javascript">
  var mainmenu = new DropDownMenu(jQuery('#main-navigation'));
  var appmenu = new DropDownMenu(jQuery('#app-navigation'));
</script>
</#if>
