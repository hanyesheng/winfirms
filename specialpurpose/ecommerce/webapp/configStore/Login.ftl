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
<#assign janrainEnabled = Static["org.apache.ofbiz.entity.util.EntityUtilProperties"].getPropertyValue("ecommerce", "janrain.enabled", delegator)>
<#assign appName = Static["org.apache.ofbiz.entity.util.EntityUtilProperties"].getPropertyValue("ecommerce", "janrain.appName", delegator)>
<#if userLogin?has_content && userLogin.userLoginId != "anonymous">
<!-- PAGE HEADER -->
	<div class="page_header">
		<div class="page_header_parallax" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>${uiLabelMap.CommonLogin}</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li><a href="<@ofbizUrl>main</@ofbizUrl>"><i class="fa fa-home"></i>  ${uiLabelMap.CommonMain}</a></li>
							<li>${uiLabelMap.CommonLogin}</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix space40"></div>
	<div class="text-center space40">
		<h4>${uiLabelMap.CommonWelcome}&nbsp;<#if person??>${person.nickname!}<#else>${partyGroup.groupName!}</#if></h4>
		<div class="space30"></div>
		<a href="<@ofbizUrl>main</@ofbizUrl>" style="display: inline-block;" class="button btn-small btn-center btn-radius space20">${uiLabelMap.CommonMain}</a>
		<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" style="display: inline-block;" class="button btn-small btn-center btn-radius space20">${uiLabelMap.PartyProfile}</a>
	</div>
<#else>
	<#if janrainEnabled == "Y">
	<script type="text/javascript">
	(function() {
	    if (typeof window.janrain !== 'object') window.janrain = {};
	    window.janrain.settings = {};
	    
	    janrain.settings.tokenUrl = '<@ofbizUrl fullPath="true" secure="true">janrainCheckLogin</@ofbizUrl>';
	
	    function isReady() { janrain.ready = true; };
	    if (document.addEventListener) {
	      document.addEventListener("DOMContentLoaded", isReady, false);
	    } else {
	      window.attachEvent('onload', isReady);
	    }
	
	    var e = document.createElement('script');
	    e.type = 'text/javascript';
	    e.id = 'janrainAuthWidget';
	
	    if (document.location.protocol === 'https:') {
	      e.src = 'https://rpxnow.com/js/lib/${appName}/engage.js';
	    } else {
	      e.src = 'http://widget-cdn.rpxnow.com/js/lib/${appName}/engage.js';
	    }
	
	    var s = document.getElementsByTagName('script')[0];
	    s.parentNode.insertBefore(e, s);
	})();
	</script>
	<!-- PAGE HEADER -->
	<div class="page_header">
		<div class="page_header_parallax" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>${uiLabelMap.CommonLogin}</h3>
					</div>
				</div>
			</div>
			</div>
			<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li><a href="<@ofbizUrl>main</@ofbizUrl>"><i class="fa fa-home"></i>  ${uiLabelMap.CommonMain}</a></li>
							<li>${uiLabelMap.CommonLogin}</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<h1>${uiLabelMap.CommonLogin}</h1>
	<div class="screenlet">
	  <div class="screenlet-title-bar"><h3>${uiLabelMap.CommonRegistered}</h3></div>
	  <div class="screenlet-body">
	  <table width="100%" class="Signlogin">
	      <tr>
	          <td>
	          <form method="post" action="<@ofbizUrl>login</@ofbizUrl>" name="loginform" class="horizontal">
	            <fieldset>
	              <div>
	                <label for="userName">${uiLabelMap.LoginPhoneNumber}</label>
	                <input type="text" id="userName" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"/>
	              </div>
	              <#if autoUserLogin?has_content>
	                <p>(${uiLabelMap.CommonNot} ${autoUserLogin.userLoginId}? <a href="<@ofbizUrl>${autoLogoutUrl}</@ofbizUrl>">${uiLabelMap.CommonClickHere}</a>)</p>
	              </#if>
	              <div>
	                <label for="password">${uiLabelMap.CommonPassword}:</label>
	                <input type="password" id="password" name="PASSWORD" value=""/>
	              </div>
	              <div>
	                <input type="submit" class="button" value="${uiLabelMap.CommonLogin}"/>
	              </div>
	              <div>
	                <label for="newcustomer_submit">${uiLabelMap.CommonMayCreateNewAccountHere}:</label>
	                <a href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.CommonMayCreate}</a>
	              </div>
	            </fieldset>
	          </form>
	          </td>
	          <td><div id="janrainEngageEmbed"></div></td>
	      </tr>
	  </table>
	  </div>
	</div>
	
	<#else>
	<!-- PAGE HEADER -->
	<div class="page_header">
		<div class="page_header_parallax" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>${uiLabelMap.CommonLogin}</h3>
					</div>
				</div>
			</div>
			</div>
			<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li><a href="<@ofbizUrl>main</@ofbizUrl>"><i class="fa fa-home"></i> ${uiLabelMap.CommonMain}</a></li>
							<li>${uiLabelMap.CommonLogin}</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>  
	<div class="inner-content">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 box-content">
					<h4 class="uppercase space30 text-center">${uiLabelMap.CommonRegistered}</h4>
	    			<form method="post" action="<@ofbizUrl>login</@ofbizUrl>" name="loginform" class="horizontal">
					<div class="form-group">
						<label class="" for="userName">${uiLabelMap.CommonUsername}</label>
						<input  type="text" class="form-control" name="USERNAME" id="userName" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>" required="required" >
					</div>
					<div class="form-group">
						<label class="" for="password">${uiLabelMap.CommonPassword}</label>
						<input class="form-control" name="PASSWORD" id="password" required="required" type="password">
					</div>
					<button class="button btn-border btn-md btn-radius btn-center" type="submit">${uiLabelMap.CommonLogin}</button>
					<div class="space20"></div>
					<div class="text-center"><a href="<@ofbizUrl>forgetpassword</@ofbizUrl>">${uiLabelMap.CommonForgotYourPassword}</a></div>
	    			</form>
	  			</div>
			</div>
		</div>
	</div>
	</#if>
</#if>
<script language="JavaScript" type="text/javascript">
  <#if autoUserLogin?has_content>document.loginform.PASSWORD.focus();</#if>
  <#if !autoUserLogin?has_content>document.loginform.USERNAME.focus();</#if>
</script>
