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
<#if party??>
<#assign personLogoUrl = "/images/winfirms/headdefault.png"!/>
<#list PartyContent?sort_by('fromDate') as PartyContent>
	<#assign personContentId = PartyContent.contentId!/>
	<#if personContentId?has_content>
		<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
	</#if>
</#list>
<div class="uk-grid" data-uk-grid-margin>
    <div class="uk-width-large-7-10">
        <div class="md-card">
            <div class="user_heading" data-uk-sticky="{ top: 48, media: 960 }">
                <div class="user_heading_avatar fileinput fileinput-new" data-provides="fileinput">
                    <div class="fileinput-new thumbnail">
                        <img src="${personLogoUrl}" alt="user avatar"/>
                    </div>
                    <div class="fileinput-preview fileinput-exists thumbnail"></div>
                    <div class="user_avatar_controls">
                        <span class="btn-file">
                            <span class="fileinput-new"><i class="material-icons">&#xE2C6;</i></span>
                            <span class="fileinput-exists"><i class="material-icons">&#xE86A;</i></span>
                            <input type="file" name="user_edit_avatar_control" id="user_edit_avatar_control">
                        </span>
                        <a href="#" class="btn-file fileinput-exists" data-dismiss="fileinput"><i class="material-icons">&#xE5CD;</i></a>
                    </div>
                </div>
                <div class="user_heading_content">
                    <h2 class="heading_b"><span class="uk-text-truncate" id="user_edit_uname">${person.nickname!}</span><span class="sub-heading" id="user_edit_position"><#if person.comments??>${person.comments!}<#else>${uiLabelMap.NoPartyComments}</#if></span></h2>
                </div>
            </div>
            <div class="user_content">
                <ul id="user_edit_tabs" class="uk-tab" data-uk-tab="{connect:'#user_edit_tabs_content'}">
                    <li class="uk-active"><a href="#">${uiLabelMap.BasicInformation}</a></li>
                </ul>
                <ul id="user_edit_tabs_content" class="uk-switcher uk-margin">
                    <li>
						<form id="editpersonform1" method="post" action="<@ofbizUrl>updatePerson</@ofbizUrl>" name="editpersonform">
                        <input type="hidden" name="partyId" value="${person.partyId!}"/>
                        <div class="uk-margin-top wrapper-full">
                            <div class="uk-grid" data-uk-grid-margin>
                            	<div class="uk-width-medium-1-2">
                                    <label for="nickname">${uiLabelMap.PartyNickName}</label>
                                    <input type="text" id="nickname" name="nickname" value="${personData.nickname!}" class="md-input"/>
                                </div>
                                <div class="uk-width-medium-1-2">
                                    <label for="gender">${uiLabelMap.PartyGender}</label>
                                    <select name="gender" class="md-input" id="gender">
						            <#if personData.gender?has_content >
						              <option value="${personData.gender}">
						                <#if personData.gender == "M" >${uiLabelMap.CommonMale}</#if>
						                <#if personData.gender == "F" >${uiLabelMap.CommonFemale}</#if>
						              </option>
						              <option value=""> --</option>
						            <#else>
						              <option value=""> --</option>
						            </#if>
						              <option value="M">${uiLabelMap.CommonMale}</option>
						              <option value="F">${uiLabelMap.CommonFemale}</option>
						            </select>
                                </div>
								<div class="uk-width-medium-1-2">
                                    <label for="lastName">${uiLabelMap.PartyLastName}*</label>
									<input type="text" class="md-input" id="lastName" name="lastName" value="${personData.lastName!}"/>
                                </div>
                                <div class="uk-width-medium-1-2">
                                    <label for="firstName">${uiLabelMap.PartyFirstName}*</label>
                                	<input type="text" class="md-input" id="firstName" name="firstName" value="${personData.firstName!}"/>
								</div>
                                <div class="uk-width-medium-1-2">
                                    <label for="birthDate">${uiLabelMap.PartyBirthDate}</label>
                                    <input class="md-input" type="text" id="birthDate" name="birthDate" data-uk-datepicker="{format:'YYYY-MM-DD'}" value="${(personData.birthDate.toString())!}">
                                </div>
                            </div>
                            <div class="uk-grid">
                                <div class="uk-width-1-1">
                                    <label for="comments">${uiLabelMap.CommonComment}</label>
                                    <textarea class="md-input md-input-full" name="comments" id="comments" >${personData.comments!}</textarea>
                                </div>
                            </div>
                            <a href="javascript:document.editpersonform.submit()" class="md-btn md-btn-block md-btn-flat-primary">${uiLabelMap.CommonSave}</a>
                        </div>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="uk-width-large-3-10">
        <div class="md-card">
        	<div class="md-card-toolbar">
                <h3 class="md-card-toolbar-heading-text">
                    ${uiLabelMap.Course}
                </h3>
            </div>
            <div class="md-card-content">
            	<table class="uk-table uk-table-hover"><tbody>
            	<#assign hasParentCol = "0">
				<#list PartyRelationship as PartyRelationship>
					<#if PartyRelationship.partyIdTo??>
						<#list PartyGroup as PartyGroup>
							<#if PartyRelationship.partyIdTo = PartyGroup.partyId>
								<tr>
									<td><span class="label label-info">${PartyGroup.groupName!}</span></td>
									<form method="post" id="deletePartyRelationship_${hasParentCol}" action="<@ofbizUrl>deletePartyRelationship</@ofbizUrl>" name="ListPartyRelationships">
										<input name="roleTypeIdTo" value="CLASS" type="hidden">
										<input name="fromDate" value="${PartyRelationship.fromDate!}" type="hidden">
										<input name="partyIdFrom" value="${PartyRelationship.partyIdFrom!}" type="hidden">
										<input name="partyIdTo" value="${PartyRelationship.partyIdTo!}" type="hidden">
										<input name="roleTypeIdFrom" value="${PartyRelationship.roleTypeIdFrom!}" type="hidden">
									</form>
									<td width="10%">
										<a style="float: right;" class="button btn-border color3 btn-xs btn-radius" href="javascript:document.getElementById('deletePartyRelationship_${hasParentCol}').submit();"><i class="fa fa-trash"></i>${uiLabelMap.CommonDelete}</a>
									</td>
								</tr>
								<#assign hasParentCol = hasParentCol + 1>
							</#if>
						</#list>
					</#if>
				</#list>
				</tbody></table>
            </div>
        </div>
    </div>
</div>
<#else>
    <h3>${uiLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}</h3>
</#if>