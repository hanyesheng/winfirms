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
<div class="page_header">
	<div class="page_header_parallax" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>${uiLabelMap.CommonForgotYourPassword}</h3>
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
						<li>${uiLabelMap.CommonForgotYourPassword}</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>  
<!-- PAGE HEADER -->
<div class="inner-content">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 box-content">
				<h4 class="uppercase space30 text-center">${uiLabelMap.CommonForgotYourPassword}</h4>
    			<form method="post" action="<@ofbizUrl>forgotpassword</@ofbizUrl>" name="loginform" class="horizontal">
					<div class="form-group">
				      	<input class="form-control" placeholder="${uiLabelMap.CommonUsername}" type="text" id="forgotpassword_userName" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"/>
			    		<div class="space20"></div>
			    		<p class="btn-center">${uiLabelMap.SendNewPasswordToEmail_1}</p>
			    		<p class="btn-center">${uiLabelMap.SendNewPasswordToEmail_3}</p>
			    		<p class="btn-center" style="color: red;">${uiLabelMap.SendNewPasswordToEmail_2}</p>
					</div>
				    <div class="buttons">
				      <!--<input type="submit" class="button btn-border btn-md btn-radius btn-center" name="GET_PASSWORD_HINT" value="${uiLabelMap.CommonGetPasswordHint}"/>-->
				      <!--<div class="space20"></div>-->
				      <input type="submit" class="button btn-border btn-md btn-radius btn-center" name="EMAIL_PASSWORD" value="${uiLabelMap.CommonSend}"/>
				    </div>
				</form>
  			</div>
		</div>
	</div>
</div>
