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
<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <link rel="icon" type="image/png" href="/altair/images/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="/altair/images/favicon-32x32.png" sizes="32x32">

    <title>${uiLabelMap.CommonLogin}</title>
    <!-- uikit -->
    <link rel="stylesheet" href="/altair/css/uikit.almost-flat.min.css"/>
		
    <!-- altair admin login page -->
    <link rel="stylesheet" href="/altair/css/login_page.min.css" />
    <link rel="stylesheet" href="/altair/css/javascript.css" />
		<script src="/images/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
		<script src="/images/jquery/jquery-migrate-1.2.1.js" type="text/javascript"></script>
		<script src="/images/jquery/ui/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
		<script src="/images/jquery/plugins/asmselect/jquery.asmselect-1.0.4a-beta.js" type="text/javascript"></script>
		<script src="/images/jquery/plugins/datetimepicker/jquery-ui-timepicker-addon.min-1.4.3.js" type="text/javascript"></script>
		<script src="/images/jquery/plugins/fjTimer/jquerytimer-min.js" type="text/javascript"></script>
		<script src="/images/jquery/plugins/jquery.maskedinput-1.3.1.min.js" type="text/javascript"></script>
		<script src="/images/jquery/plugins/jeditable/jquery.jeditable.js" type="text/javascript"></script>
		<script src="/images/jquery/plugins/validate/jquery.validate.min.js" type="text/javascript"></script>
		<script src="/images/OpenLayers-2.13.1.js" type="text/javascript"></script>
		<script src="/images/OfbizUtil.js" type="text/javascript"></script>
		<script src="/images/fieldlookup.js" type="text/javascript"></script>
		<script src="/images/date/date.format-1.2.3-min.js" type="text/javascript"></script>
		<script src="/images/date/date.timezone-min.js" type="text/javascript"></script>
		<script src="/images/miscAjaxFunctions.js" type="text/javascript"></script>
		<script src="/images/selectMultipleRelatedValues.js" type="text/javascript"></script>
		<script src="/images/util.js" type="text/javascript"></script>
		<script src="/images/date/FromThruDateCheck.js" type="text/javascript"></script>
		<script src="/tomahawk/js/dropdown.js" type="text/javascript"></script>
	  <script src="/images/jquery/plugins/datetimepicker/localization/jquery-ui-timepicker-zh-CN.js" type="text/javascript"></script>
	  <script src="/images/jquery/plugins/validate/localization/messages_zh.js" type="text/javascript"></script>
	  <script src="/images/jquery/ui/i18n/jquery.ui.datepicker-zh-CN.js" type="text/javascript"></script>
	  <script src="/images/jquery/plugins/datejs/date-zh-CN.js" type="text/javascript"></script>
	  <script src="/images/jquery/plugins/jsTree/jquery.jstree.js" type="text/javascript"></script>
	  <script src="/images/jquery/ui/js/jquery.cookie-1.4.0.js" type="text/javascript"></script>
	  <script src="/images/jquery/plugins/Readmore.js-master/readmore.js" type="text/javascript"></script>
	  <script src="/images/jquery/plugins/jquery-jgrowl/1.4.1/jquery.jgrowl.min.js" type="text/javascript"></script>
	  <link rel="stylesheet" href="/images/jquery/plugins/jquery-jgrowl/1.4.1/jquery.jgrowl.min.css" type="text/css">
    <link rel="stylesheet" href="/altair/css/uikit.almost-flat.min.css" type="text/css">
    <link rel="stylesheet" href="/images/jquery/plugins/asmselect/jquery.asmselect-1.0.4a-beta.css" type="text/css">
    <link rel="stylesheet" href="/altair/css/style_switcher.min.css" type="text/css">
    <link rel="stylesheet" href="/altair/css/main.min.css" type="text/css">
    <link rel="stylesheet" href="/altair/css/themes_combined.min.css" type="text/css">
    <link rel="stylesheet" href="/altair/css/javascript.css" type="text/css">
</head>
<body class="login_page">
	<#escape x as x?html>
  <#if requestAttributes.errorMessageList?has_content><#assign errorMessageList=requestAttributes.errorMessageList></#if>
  <#if requestAttributes.eventMessageList?has_content><#assign eventMessageList=requestAttributes.eventMessageList></#if>
  <#if requestAttributes.serviceValidationException??><#assign serviceValidationException = requestAttributes.serviceValidationException></#if>
  <#if requestAttributes.uiLabelMap?has_content><#assign uiLabelMap = requestAttributes.uiLabelMap></#if>

  <#if !errorMessage?has_content>
    <#assign errorMessage = requestAttributes._ERROR_MESSAGE_!>
  </#if>
  <#if !errorMessageList?has_content>
    <#assign errorMessageList = requestAttributes._ERROR_MESSAGE_LIST_!>
  </#if>
  <#if !eventMessage?has_content>
    <#assign eventMessage = requestAttributes._EVENT_MESSAGE_!>
  </#if>
  <#if !eventMessageList?has_content>
    <#assign eventMessageList = requestAttributes._EVENT_MESSAGE_LIST_!>
  </#if>

  <#-- display the error messages -->
  <#if (errorMessage?has_content || errorMessageList?has_content)>
    <div id="content-messages" class="uk-alert uk-alert-danger" style="z-index: 9999;text-align: center;margin: 0 auto;"
        onclick="document.getElementById('content-messages').parentNode.removeChild(this)">
        <a href="#" class="uk-alert-close uk-close"></a>
      <#noescape><p>${uiLabelMap.CommonFollowingErrorsOccurred}:</p></#noescape>
      <#if errorMessage?has_content>
        <p>${StringUtil.wrapString(errorMessage)}</p>
      </#if>
      <#if errorMessageList?has_content>
        <#list errorMessageList as errorMsg>
          <p>${StringUtil.wrapString(errorMsg)}</p>
        </#list>
      </#if>
    </div>
  </#if>
  <#-- display the event messages -->
  <#if (eventMessage?has_content || eventMessageList?has_content)>
  <div id="content-messages" class="uk-alert uk-alert-info" style="z-index: 9999;text-align: center;margin: 0 auto;"
      onclick="document.getElementById('content-messages').parentNode.removeChild(this)">
      <a href="#" class="uk-alert-close uk-close"></a>
    <#noescape><p>${uiLabelMap.CommonFollowingOccurred}:</p></#noescape>
    <#if eventMessage?has_content>
      <p>${StringUtil.wrapString(eventMessage)}</p>
    </#if>
    <#if eventMessageList?has_content>
      <#list eventMessageList as eventMsg>
        <p>${StringUtil.wrapString(eventMsg)}</p>
      </#list>
    </#if>
  </div>
  </#if>
</#escape>
	<div class="login_page_wrapper">
	<#if requestAttributes.uiLabelMap??><#assign uiLabelMap = requestAttributes.uiLabelMap></#if>
	<#assign useMultitenant = Static["org.apache.ofbiz.base.util.UtilProperties"].getPropertyValue("general.properties", "multitenant")>
	
	<#assign username = requestParameters.USERNAME?default((sessionAttributes.autoUserLogin.userLoginId)?default(""))>
	<#if username != "">
	  <#assign focusName = false>
	<#else>
	  <#assign focusName = true>
	</#if>
	<div class="md-card" id="login_card">
		<div class="md-card-content large-padding" id="login_form">
	    <div class="login_heading">
	        <div class="user_avatar"></div>
	    </div>
	    <form method="post" action="<@ofbizUrl>login</@ofbizUrl>" name="loginform">
        <div class="uk-form-row">
            <label for="login_username">${uiLabelMap.CommonUsername}</label>
            <input class="md-input" type="text" id="login_username" name="USERNAME" value="${username}" />
        </div>
        <div class="uk-form-row">
            <label for="login_password">${uiLabelMap.CommonPassword}</label>
            <input class="md-input" type="password" id="login_password" name="PASSWORD" />
        </div>
        <div class="uk-form-row">
	        <#if ("Y" == useMultitenant) >
		        <#if !requestAttributes.userTenantId??>
		        	<label for="userTenantId">${uiLabelMap.CommonUsername}</label>
		        	<input class="md-input" type="text" id="userTenantId" name="userTenantId" value="${parameters.userTenantId!}" size="20"/>
		        <#else>
		            <input type="hidden" name="userTenantId" value="${requestAttributes.userTenantId!}"/>
		        </#if>
		      </#if>
	      </div>
        <div class="uk-margin-medium-top">
            <input type="submit" class="md-btn md-btn-primary md-btn-block md-btn-large" value="${uiLabelMap.CommonLogin}"/>
        </div>
        <div class="uk-margin-top">
            <a href="#" id="password_reset_show">${uiLabelMap.CommonForgotYourPassword}</a>
        </div>
        <input type="hidden" name="JavaScriptEnabled" value="Y"/>
	    </form>
		</div>
		<div class="md-card-content large-padding" id="login_password_reset" style="display: none">
			<button type="button" class="uk-position-top-right uk-close uk-margin-right uk-margin-top back_to_login"></button>
			<h2 class="heading_a uk-margin-large-bottom">${uiLabelMap.CommonForgotYourPassword}</h2>
			<form method="post" action="<@ofbizUrl>forgotPassword_step3${previousParams?if_exists}</@ofbizUrl>" name="getSecurityQuestion">
				<#if securityQuestion?has_content>
					<div class="uk-form-row">
					${securityQuestion.description!}
					<input type="hidden" name="securityQuestion" value="${securityQuestion.enumId!}" />
		      <input type="hidden" name="USERNAME" value="${userLoginId!}" />
		      ${uiLabelMap.SecurityAnswer}
		      <input type="text" name="securityAnswer" class="" value="" />&nbsp;
				    </div>
				    <#else>
				    <div class="uk-form-row">
				        <label for="login_email_reset">${uiLabelMap.CommonUsername}</label>
				        <input class="md-input" type="text" size="20" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"/>
				    </div>
			    </#if>
			    <div class="uk-margin-medium-top">
			        <input type="submit" name="GET_PASSWORD_HINT" class="md-btn md-btn-primary md-btn-block"  value="${uiLabelMap.CommonGetPasswordHint}" />
			        <input type="submit" name="EMAIL_PASSWORD" class="md-btn md-btn-primary md-btn-block" value="${uiLabelMap.CommonEmailPassword}" />
			    </div>
			</form>
		</div>

		<script language="JavaScript" type="text/javascript">
		  document.loginform.JavaScriptEnabled.value = "Y";
		  <#if focusName>
		    document.loginform.USERNAME.focus();
		  <#else>
		    document.loginform.PASSWORD.focus();
		  </#if>
		</script>
 	</div>
 	</div>
    <!-- uikit functions -->
    <script src="/altair/js/uikit_custom.min.js"></script>
    <!-- altair core functions -->
    <script src="/altair/js/altair_admin_common.min.js"></script>

    <!-- altair login page functions -->
    <script src="/altair/js/login.min.js"></script>

    <script>
        // check for theme
        if (typeof(Storage) !== "undefined") {
            var root = document.getElementsByTagName( 'html' )[0],
                theme = localStorage.getItem("altair_theme");
            if(theme == 'app_theme_dark' || root.classList.contains('app_theme_dark')) {
                root.className += ' app_theme_dark';
            }
        }
    </script>

</body>
</html>