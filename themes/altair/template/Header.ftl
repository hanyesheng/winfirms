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
<#assign externalKeyParam = "&amp;externalLoginKey=" + requestAttributes.externalLoginKey!>
<#if (requestAttributes.externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>
<#if (externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>
<#assign ofbizServerName = application.getAttribute("_serverId")?default("default-server")>
<#assign contextPath = request.getContextPath()>
<#assign displayApps = Static["org.apache.ofbiz.webapp.control.LoginWorker"].getAppBarWebInfos(security, userLogin, ofbizServerName, "main")>
<#assign displaySecondaryApps = Static["org.apache.ofbiz.webapp.control.LoginWorker"].getAppBarWebInfos(security, userLogin, ofbizServerName, "secondary")>
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
<#if (requestAttributes.person)??><#assign person = requestAttributes.person></#if>
<#if (requestAttributes.partyGroup)??><#assign partyGroup = requestAttributes.partyGroup></#if>
<#assign docLangAttr = locale.toString()?replace("_", "-")>
<#assign langDir = "ltr">
<#if "ar.iw"?contains(docLangAttr?substring(0, 2))>
    <#assign langDir = "rtl">
</#if>
<#assign personLogoUrl = "/images/winfirms/headdefault.png"!/>
<#list PartyContent?sort_by('fromDate') as PartyContent>
	<#assign personContentId = PartyContent.contentId!/>
	<#if personContentId?has_content>
		<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
	</#if>
</#list>
<html lang="${docLangAttr}" dir="${langDir}" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>
    <title>${layoutSettings.companyName}: <#if (titleProperty)?has_content>${uiLabelMap[titleProperty]}<#else>${title!}</#if></title>
    <link rel="icon" type="image/png" href="/altair/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="/altair/img/favicon-32x32.png" sizes="32x32">
    
    <#if layoutSettings.VT_HDR_JAVASCRIPT?has_content>
        <#list layoutSettings.VT_HDR_JAVASCRIPT as javaScript>
            <script src="<@ofbizContentUrl>${StringUtil.wrapString(javaScript)}</@ofbizContentUrl>" type="text/javascript"></script>
        </#list>
    </#if>
    <#if layoutSettings.javaScripts?has_content>
      <#--layoutSettings.javaScripts is a list of java scripts. -->
      <#-- use a Set to make sure each javascript is declared only once, but iterate the list to maintain the correct order -->
      <#assign javaScriptsSet = Static["org.apache.ofbiz.base.util.UtilMisc"].toSet(layoutSettings.javaScripts)/>
      <#list layoutSettings.javaScripts as javaScript>
        <#if javaScriptsSet.contains(javaScript)>
          <#assign nothing = javaScriptsSet.remove(javaScript)/>
          <script src="<@ofbizContentUrl>${StringUtil.wrapString(javaScript)}</@ofbizContentUrl>" type="text/javascript"></script>
        </#if>
      </#list>
    </#if>

    <#if layoutSettings.styleSheets?has_content>
        <#--layoutSettings.styleSheets is a list of style sheets. So, you can have a user-specified "main" style sheet, AND a component style sheet.-->
        <#list layoutSettings.styleSheets as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
        </#list>
    </#if>
    <#if layoutSettings.VT_STYLESHEET?has_content>
        <#list layoutSettings.VT_STYLESHEET as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
        </#list>
    </#if>
    <#if layoutSettings.rtlStyleSheets?has_content && langDir == "rtl">
        <#--layoutSettings.rtlStyleSheets is a list of rtl style sheets.-->
        <#list layoutSettings.rtlStyleSheets as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
        </#list>
    </#if>
    <#if layoutSettings.VT_RTL_STYLESHEET?has_content && langDir == "rtl">
        <#list layoutSettings.VT_RTL_STYLESHEET as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
        </#list>
    </#if>
    <#if layoutSettings.VT_EXTRA_HEAD?has_content>
        <#list layoutSettings.VT_EXTRA_HEAD as extraHead>
            ${extraHead}
        </#list>
    </#if>
    <#if layoutSettings.WEB_ANALYTICS?has_content>
      <script language="JavaScript" type="text/javascript">
        <#list layoutSettings.WEB_ANALYTICS as webAnalyticsConfig>
          ${StringUtil.wrapString(webAnalyticsConfig.webAnalyticsCode!)}
        </#list>
      </script>
    </#if>
</head>
<body class="disable_transitions sidebar_main_open sidebar_main_swipe">
    <!-- main header -->
    <header id="header_main">
        <div class="header_main_content">
            <nav class="uk-navbar">
                                
                <!-- main sidebar switch -->
                <a href="#" id="sidebar_main_toggle" class="sSwitch sSwitch_left">
                    <span class="sSwitchIcon"></span>
                </a>
                
                <!-- secondary sidebar switch -->
                <a href="#" id="sidebar_secondary_toggle" class="sSwitch sSwitch_right sidebar_secondary_check">
                    <span class="sSwitchIcon"></span>
                </a>
                <#if userLogin?has_content>
                <div id="menu_top_dropdown" class="uk-float-left">
                    <div class="uk-button-dropdown" data-uk-dropdown="{mode:'click'}">
                        <a href="#" class="top_menu_toggle"><i class="material-icons md-24">&#xE8F0;</i></a>
                        <div class="uk-dropdown uk-dropdown-width-2 uk-dropdown-scrollable">
                            <div class="md-card-content">
				          	 		<ul class="uk-nav uk-nav-dropdown uk-panel">
						            <#-- Secondary Applications -->
						            <#list displaySecondaryApps as display>
						              <#assign thisApp = display.getContextRoot()>
						              <#assign selected = false>
						              <#if thisApp == contextPath || contextPath + "/" == thisApp>
						                <#assign selected = true>
						              </#if>
						              <#assign thisApp = StringUtil.wrapString(thisApp)>
						              <#assign thisURL = thisApp>
						              <#if thisApp != "/">
						                <#assign thisURL = thisURL + "/control/main">
						              </#if>
						              <#if layoutSettings.suppressTab?? && display.name == layoutSettings.suppressTab>
						                <!-- do not display this component-->
						              <#else>
						                  <li<#if selected> class="selected"</#if>><a href="${thisURL + externalKeyParam}"<#if uiLabelMap??> title="${uiLabelMap[display.description]}"><span class="menu_icon"><i class="material-icons">${display.name}</i></span>&nbsp;&nbsp;${uiLabelMap[display.title]}<#else> title="${display.description}">${display.title}</#if></a></li>
						              </#if>
						            </#list>
                            	</ul>
                            </div>
                        </div>
                    </div>
                </div>
                </#if>
                <div class="uk-navbar-flip">
                    <ul class="uk-navbar-nav user_actions">
                        <li><a href="#" id="full_screen_toggle" class="user_action_icon uk-visible-large"><i class="material-icons md-24 md-light">&#xE5D0;</i></a></li>
                        
                        <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                            <a href="#" class="user_action_image"><img class="md-user-image" src="${personLogoUrl!}" alt=""/></a>
                            <div class="uk-dropdown uk-dropdown-small">
                                <ul class="uk-nav js-uk-prevent">
                                	<#if userLogin??>
															      <#--if webSiteId?? && requestAttributes._CURRENT_VIEW_?? && helpTopic??-->
															      <#if parameters.componentName?? && requestAttributes._CURRENT_VIEW_?? && helpTopic??>
															        <#include "component://common/template/includes/HelpLink.ftl" />
															        <li><a class="help-link <#if pageAvail?has_content> alert</#if>" href="javascript:lookup_popup1('showHelp?helpTopic=${helpTopic}&amp;portalPageId=${parameters.portalPageId!}','help' ,500,500);" title="${uiLabelMap.CommonHelp}"></a></li>
															      </#if>
															      <li><a href="<@ofbizUrl>logout</@ofbizUrl>">${uiLabelMap.CommonLogout}</a></li>
															      <li><a href="<@ofbizUrl>ListVisualThemes</@ofbizUrl>">${uiLabelMap.CommonVisualThemes}</a></li>
															    <#else>
															      <li><a href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>">${uiLabelMap.CommonLogin}</a></li>
															    </#if>
															    <li <#if companyListSize?default(0) &lt;= 1>class="language"</#if>><a href="<@ofbizUrl>ListLocales</@ofbizUrl>">${uiLabelMap.CommonLanguageTitle}</a></li>
															    <#if userLogin?exists>
															      <#if userLogin.partyId?exists>
															        <li class="user" style="white-space: normal;"><a href="/partymgr/control/viewprofile?partyId=${userLogin.partyId}${externalKeyParam!}">${userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
															        <#assign size = companyListSize?default(0)>
															        <#if size &gt; 1>
															            <#assign currentCompany = delegator.findOne("PartyNameView", {"partyId" : organizationPartyId}, false)>
															            <#if currentCompany?exists>
															                <li class="user" style="white-space: normal;">
															                    <a href="<@ofbizUrl>ListSetCompanies</@ofbizUrl>">${currentCompany.groupName} &nbsp;- </a>
															                </li>
															            </#if>
															        </#if>
															      <#else>
															        <li class="user" style="white-space: normal;">${userName}</li>
															      </#if>
															    </#if>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header><!-- main header end -->

<aside id="sidebar_main">
	<div class="sidebar_main_header">
	    <div class="sidebar_logo">
	        <a href="#" class="sSidebar_hide sidebar_logo_large">
	            <img class="logo_regular" src="/images/winfirms/logo.png" alt="" height="15" width="71"/>
	            <img class="logo_light" src="/images/winfirms/logo.png" alt="" height="15" width="71"/>
	        </a>
	        <a href="#" class="sSidebar_show sidebar_logo_small">
	            <img class="logo_regular" src="/images/winfirms/logo.png" alt="" height="32" width="32"/>
	            <img class="logo_light" src="/images/winfirms/logo.png" alt="" height="32" width="32"/>
	        </a>
	    </div>
	    <div class="sidebar_actions">
	        <span>${nowTimestamp?datetime?string.short}</span>
	    </div>
	</div>
	<div class="menu_section">
	    <ul>
			<#-- Primary Applications -->
		    <#list displayApps as display>
		      <#assign thisApp = display.getContextRoot()>
		      <#assign selected = false>
		      <#if thisApp == contextPath || contextPath + "/" == thisApp>
		        <#assign selected = true>
		      </#if>
		      <#assign thisApp = StringUtil.wrapString(thisApp)>
		      <#assign thisURL = thisApp>
		      <#if thisApp != "/">
		        <#assign thisURL = thisURL + "/control/main">
		      </#if>
		      <#if layoutSettings.suppressTab?? && display.name == layoutSettings.suppressTab>
		        <!-- do not display this component-->
		      <#else>
		        <li <#if selected>class="current_section"</#if> title="<#if uiLabelMap??>${uiLabelMap[display.description]}<#else>${display.description}</#if>">
	            <a href="${thisURL + externalKeyParam}">
	                <span class="menu_icon"><i class="material-icons">${display.name!}</i></span>
	                <span class="menu_title"><#if uiLabelMap??>${uiLabelMap[display.title]}<#else>${display.title}</#if></span>
	            </a>
	        	</li>
		      </#if>
		    </#list>
	    </ul>
	</div>
</aside><!-- main sidebar end -->