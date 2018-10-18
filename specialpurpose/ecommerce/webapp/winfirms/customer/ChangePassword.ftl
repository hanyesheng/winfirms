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
<form id="changepasswordform" method="post" action="<@ofbizUrl>updatePassword/${donePage}</@ofbizUrl>">
<div class="uk-modal-header">
    <h3 class="uk-modal-title">${uiLabelMap.PartyChangePassword} <i class="material-icons" data-uk-tooltip="{pos:'top'}" title="${uiLabelMap.CommonFieldsMarkedAreRequired}">&#xE8FD;</i></h3>
</div>
<table class="table table-bordered changepassword">
  <tr>
    <td><label for="currentPassword">${uiLabelMap.PartyOldPassword}</label></td>
    <td><input type="password" class='form-control' name="currentPassword" id="currentPassword" maxlength="20" />*</td>
  </tr>
  <tr>
    <td><label for="newPassword">${uiLabelMap.PartyNewPassword}</label></td>
    <td><input type="password" class='form-control' name="newPassword" id="newPassword" maxlength="20" />*</td>
  </tr>
  <tr>
    <td><label for="newPasswordVerify">${uiLabelMap.PartyNewPasswordVerify}</label></td>
    <td><input type="password" class='form-control' name="newPasswordVerify" id="newPasswordVerify" maxlength="20" />*</td>
  </tr>
  <tr>
    <td><label for="passwordHint">${uiLabelMap.PartyPasswordHint}</label></td>
    <td><input type="text" class='form-control' maxlength="100" name="passwordHint"
      id="passwordHint" value="${userLoginData.passwordHint!}" /></td>
  </tr>
</table>
<div class="uk-modal-footer uk-text-right">
    <button type="button" class="md-btn md-btn-flat uk-modal-close">${uiLabelMap.CommonClose}</button><a href="javascript:document.getElementById('changepasswordform').submit()" class="md-btn md-btn-flat md-btn-flat-primary">${uiLabelMap.CommonSave}</a>
</div>
</form>