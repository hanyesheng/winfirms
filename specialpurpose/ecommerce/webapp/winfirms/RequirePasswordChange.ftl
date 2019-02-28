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

<#assign username = ""/>
<#if requestParameters.USERNAME?has_content>
  <#assign username = requestParameters.USERNAME/>
<#elseif autoUserLogin?has_content>
  <#assign username = autoUserLogin.userLoginId/>
</#if>
<!-- PAGE HEADER -->
<#if userLogin?has_content && userLogin.userLoginId != "anonymous">
<#list Person as Person><#assign userloginNickname = Person.nickname!></#list>
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
<div class="page_header">
	<div class="page_header_parallax" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>${uiLabelMap.CommonPasswordChange}</h3>
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
						<li>${uiLabelMap.CommonPasswordChange}</li>
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
					<h4 class="uppercase space30 text-center">${uiLabelMap.SendNewPasswordToEmail_3}</h4>
	    			<form method="post" action="<@ofbizUrl>login${previousParams}</@ofbizUrl>" name="loginform" class="horizontal">
						<input type="hidden" name="requirePasswordChange" value="Y"/>
	          <input type="hidden" name="USERNAME" value="${username}"/>
					<div class="form-group">
						<label class="" for="password">${uiLabelMap.CommonUsername}</label>
						<input disabled="disabled" type="text" class="form-control" name="USERNAME" id="userName" value="${username}" required="required" >
					</div>
					<#if autoUserLogin?has_content>
						<div>
                  (${uiLabelMap.CommonNot}&nbsp;${autoUserLogin.userLoginId}?&nbsp;<a href="<@ofbizUrl>${autoLogoutUrl}</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonClickHere}</a>)
              </div>
          </#if>
					<div class="form-group">
						<label class="" for="password">${uiLabelMap.TemporaryPassword}</label>
						<input class="form-control" name="PASSWORD" required="required" type="password">
					</div>
					<div class="form-group">
						<label class="" for="password">${uiLabelMap.CommonNewPassword}</label>
						<input class="form-control" name="newPassword" required="required" type="password">
					</div>
					<div class="form-group">
						<label class="" for="password">${uiLabelMap.CommonNewPasswordVerify}</label>
						<input class="form-control" name="newPasswordVerify" required="required" type="password">
					</div>
					<button class="button btn-border btn-md btn-radius btn-center" type="submit">${uiLabelMap.CommonLogin}</button>
					<div class="space20"></div>
					</form>
	  			</div>
			</div>
		</div>
	</div>
</div>
</#if>
<script language="JavaScript" type="text/javascript">
  <#if autoUserLogin?has_content>document.loginform.PASSWORD.focus();</#if>
  <#if !autoUserLogin?has_content>document.loginform.USERNAME.focus();</#if>
</script>
