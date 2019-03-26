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
<#if getUsername>
<script type="text/javascript">
  //<![CDATA[
     lastFocusedName = null;
     function setLastFocused(formElement) {
         lastFocusedName = formElement.name;
         document.write.lastFocusedName;
         document.getElementsByTagName('label')[21].style.display='inline';
     }
//   用户名自动使用手机
//   function changePhone() {
//       document.getElementById('USERNAME').value = jQuery('#CUSTOMER_MOBILE_CONTACT').val();
//   }
//   (function() {
//		 document.getElementById('USERNAME').value = jQuery('#CUSTOMER_MOBILE_CONTACT').val();
//		 })();
     function hideShowUsaStates() {
         var customerStateElement = document.getElementById('newuserform_stateProvinceGeoId');
          var customerCountryElement = document.getElementById('newuserform_countryGeoId');
         if (customerCountryElement.value == "USA" || customerCountryElement.value == "UMI") {
             customerStateElement.style.display = "block";
         } else {
             customerStateElement.style.display = "none";
         }
     }
   //]]>
</script>

<script type="application/javascript" >
	
  function sendMsg(btn) {
    var username = jQuery('#CUSTOMER_MOBILE_CONTACT').val();
    if(!(/^1(3|4|5|7|8|9)\d{9}$/.test(username))){ 
        alert("please input real phone numbers");  
        return false; 
    }else{
          var ajaxUrl = '<@ofbizUrl>sendMsg</@ofbizUrl>';
          //jQuerry Ajax Request
          jQuery.ajax({
              url: ajaxUrl,
              type: 'POST',
              data: {"mobile" : username},
              error: function(msg) {
                  alert("An error occurred loading content! : " + msg);
              },
              success: function(msg) {
                settime(btn);
              }
          });
        }
  }
  var countdown=60;
  function settime(val) {
    
    if (countdown == 0){
      val.removeAttribute("disabled");
      val.value=("${StringUtil.wrapString(uiLabelMap.getMsgCode)}");
      countdown = 60;
      return
    }else{
      val.setAttribute("disabled", true);
      val.value=( + countdown +  "${StringUtil.wrapString(uiLabelMap.tryAgainLater)}");
      countdown--;
    }
    setTimeout(function() {settime(val)},1000);
    } 
  //]]>
</script>
</#if>
<#if userLogin?has_content && userLogin.userLoginId != "anonymous">
<!-- PAGE HEADER -->
<div class="page_header">
	<div class="page_header_parallax" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>${uiLabelMap.EcommerceRegister}</h3>
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
						<li>${uiLabelMap.EcommerceRegister}</li>
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
					<h3>${uiLabelMap.EcommerceRegister}</h3>
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
						<li>${uiLabelMap.EcommerceRegister}</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="padding30">
	<div class="container space30">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 box-content">
			<form method="post" action="<@ofbizUrl>createcustomer${previousParams}</@ofbizUrl>" id="newuserform" onsubmit="return newCustomerSubmit()" name="bootstrap-form">
				<input type="hidden" name="emailProductStoreId" value="${productStoreId}"/>
				<input type="hidden" name="USER_FIRST_NAME" id="USER_FIRST_NAME" value="_NA_"/>
				<input type="hidden" name="USER_LAST_NAME" id="USER_LAST_NAME" value="_NA_"/>
				<input type="hidden" name="CUSTOMER_ADDRESS1" id="CUSTOMER_ADDRESS1" value="_NA_"/>
				<input type="hidden" name="CUSTOMER_CITY" id="CUSTOMER_CITY" value="_NA_"/>
				<input type="hidden" name="CUSTOMER_POSTAL_CODE" id="CUSTOMER_POSTAL_CODE" value="_NA_"/>
				<input type="hidden" name="CUSTOMER_COUNTRY" id="newuserform_countryGeoId" value="CHN"/>
				<input type="hidden" name="CUSTOMER_STATE" id="newuserform_stateProvinceGeoId" value="_NA_"/>
				
				<!-- Field 1 -->
				<div class="input-text form-group">
					<div class="input-text form-group"><label>${uiLabelMap.CommonUsername}*<span style="color: #fa6900;">(${uiLabelMap.UsernameForLogin})</span></label>
					<input type="text" required="required" class="form-control" value="${requestParameters.USERNAME!}" placeholder="${uiLabelMap.SchoolStudentsUseId}${uiLabelMap.CommonUsername}" name="USERNAME" id="USERNAME"/>
				</div>
				<div class="input-text form-group">
					<div class="input-text form-group"><label>${uiLabelMap.AddTo}${uiLabelMap.YourPhoneNumber}*</label>
					<label style="float:right;color:red;display:none;">${uiLabelMap.WrongMobileFormat}</label>
					<label style="float:right;color:red;display:none;">${uiLabelMap.MobileNotEmpty}</label>
					<label style="color:rgb(153, 143, 143);float:right;display:none;">${uiLabelMap.YourMobileFormat}</label></div>
					<div class="input-text form-group"><input required="required" style="width: 45%;display: inline-block;" type="text" name="CUSTOMER_MOBILE_CONTACT" class="input-name form-control" id="CUSTOMER_MOBILE_CONTACT" value="${requestParameters.CUSTOMER_MOBILE_CONTACT!}" onchange="changePhone()" onkeyup="changePhone()" onfocus="reminderMobile()"  onblur="testMobile()"placeholder="${uiLabelMap.RealMobile}"/>
					<input style="width: 25%;display: inline-block;" type="text" name="MSGCODE" id="MSGCODE" class="input-name form-control" placeholder="${uiLabelMap.writeMsgCode}" value="${requestParameters.code!}">
  				<input style="width: 25%;display: inline-block;" type="button" class="input-name form-control" value="${uiLabelMap.getMsgCode}" onclick="sendMsg(this)" /></div>
				</div>
				<div class="input-text form-group">
				  <div class="input-text form-group"><label for="CUSTOMER_EMAIL">${uiLabelMap.AddTo}${uiLabelMap.PartyEmailAddress}*<span style="color: #fa6900;">(${uiLabelMap.EmailTrueForPassword})</span></label></div>
      	  <div class="input-text form-group"><input required="required" class="form-control" type="text" name="CUSTOMER_EMAIL" id="CUSTOMER_EMAIL" placeholder="****@***.***" value="${requestParameters.CUSTOMER_EMAIL!}" /></div>
				</div>
					
				<!-- Field 1 -->
				<div class="input-text form-group">
					<label>${uiLabelMap.PartyNickName}*<span style="color: #fa6900;">(${uiLabelMap.SchoolForName})</span></label>
					<label style="float:right;color:red;display:none;">${uiLabelMap.WrongNickNameFormat}</label>
					<label style="float:right;color:red;display:none;">${uiLabelMap.YourNickNameNotEmpty}</label>
					<label style="color:rgb(153, 143, 143);float:right;display:none;">${uiLabelMap.YourNicknameFormat}</label>
					<input required="required" type="text" class="form-control" name="USER_NICKNAME" id="USER_NICKNAME" value="${requestParameters.USER_NICKNAME!}" onfocus="reminderNickname()"  onblur="testNickname()" placeholder="${uiLabelMap.YourNickname}(${uiLabelMap.SchoolForName})"/>
				</div>
				
				<!-- Field 2 -->
				<div class="input-email form-group">
					<label>${uiLabelMap.CommonPassword}*</label>
					<label style="float:right;color:red;display:none;">${uiLabelMap.WrongPasswordFormat}</label>
					<label style="float:right;color:red;display:none;">${uiLabelMap.YourPasswordNotEmpty}</label>
					<label style="color:rgb(153, 143, 143);float:right;display:none;">${uiLabelMap.YourPasswordFormat}</label>
					<input required="required" type="password" class="form-control" name="PASSWORD" id="PASSWORD" onfocus="setLastFocused(this);"   onblur="testPassword()" placeholder="${uiLabelMap.YourPassword}"/>
				</div>
				<div class="input-email form-group">
					<label>${uiLabelMap.PartyRepeatPassword}*</label>
					<label style="float:right;color:red;display:none;">${uiLabelMap.NotAsYourPassword}</label>
					<label style="float:right;color:red;display:none;">${uiLabelMap.YourPasswordNotEmpty}</label>
					<label style="color:rgb(153, 143, 143);float:right;display:none;">${uiLabelMap.PartyRepeatPassword}</label>
					<input required="required" type="password" class="form-control" name="CONFIRM_PASSWORD" id="CONFIRM_PASSWORD" value="" maxlength="50" onfocus="reminderConfirmPassword();"   onblur="testConfirmPassword()" placeholder="${uiLabelMap.PartyRepeatPassword}"/>
				</div>
				<button class="button btn-border btn-md btn-radius btn-center" type="submit">
					<div class="border">
						<div class="left-plane"></div>
						<div class="right-plane"></div>
					</div>	
					<div class="text">${uiLabelMap.EcommerceRegister}</div>
				</button>
			</form><!-- Form Ends -->
			</div>
		</div>
	</div>
</div>
</#if>
<script type="text/javascript">
  //<![CDATA[
  hideShowUsaStates();
  //]]>
</script>