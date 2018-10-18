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
<div class="uk-grid" data-uk-grid-margin data-uk-grid-match id="user_profile">
    <div class="uk-width-large-7-10">
        <div class="md-card">
            <div class="user_heading">
                <div class="user_heading_avatar">
                    <div class="thumbnail">
                        <img src="${personLogoUrl}" alt="user avatar"/>
                    </div>
                </div>
                <div class="user_heading_content">
                    <h2 class="heading_b uk-margin-bottom">
                    	<#if person??>
	                    	<span class="uk-text-truncate">${person.nickname!}</span>
	                    	<span class="sub-heading">
	                    		<#if person.comments??>${person.comments!}<#else>${uiLabelMap.NoPartyComments}</#if>
	                    	</span>
                    	<#else>
					      	<span class="uk-text-truncate">${partyGroup.groupName!}</span>
	                    	<span class="sub-heading">
	                    		<#if partyGroup.comments??>${partyGroup.comments!}<#else>${uiLabelMap.NoPartyComments}</#if>
	                    	</span>
					    </#if>
                    </h2>
                    <!--<ul class="user_stats">
                        <li>
                            <h4 class="heading_a">1<span class="sub-heading">${uiLabelMap.ProjectJoin}</span></h4>
                        </li>
                        <li>
                            <h4 class="heading_a">1<span class="sub-heading">${uiLabelMap.Course}</span></h4>
                        </li>
                        <li>
                            <h4 class="heading_a">1<span class="sub-heading">${uiLabelMap.ActiveDegree}</span></h4>
                        </li>
                    </ul>-->
                </div>
                <a class="md-fab md-fab-small md-fab-accent hidden-print" href="<@ofbizUrl>editperson</@ofbizUrl>">
                    <i class="material-icons">&#xE150;</i>
                </a>
            </div>
            <div class="user_content">
            	<ul id="user_profile_tabs" class="uk-tab" data-uk-tab="{connect:'#user_profile_tabs_content', animation:'slide-horizontal'}" data-uk-sticky="{ top: 48, media: 960 }">
                    <li class="uk-active"><a href="#">${uiLabelMap.BasicInformation}</a></li>
               	</ul>
                <ul id="user_profile_tabs_content" class="uk-switcher uk-margin">
                    <li>
                    	<div class="uk-grid uk-margin-medium-top uk-margin-large-bottom" data-uk-grid-margin>
                            <div class="uk-width-large-1-1">
                                <h4 class="heading_c uk-margin-small-bottom">${uiLabelMap.PersonalInformation}</h4>
                                <ul class="md-list md-list-addon">
                                <#if person??>
                                	<li>
                                        <div class="md-list-addon-element">
                                            <i class="md-list-addon-icon material-icons">code</i>
                                        </div>
                                        <div class="md-list-content">
                                            <span class="md-list-heading">${person.partyId!}</span>
                                            <span class="uk-text-small uk-text-muted">${uiLabelMap.PartyId}</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="md-list-addon-element">
                                            <i class="md-list-addon-icon material-icons">sentiment_satisfied_alt</i>
                                        </div>
                                        <div class="md-list-content">
                                            <span class="md-list-heading">${person.nickname!}</span>
                                            <span class="uk-text-small uk-text-muted">${uiLabelMap.FormFieldTitle_nickname}</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="md-list-addon-element">
                                            <i class="md-list-addon-icon material-icons">wc</i>
                                        </div>
                                        <div class="md-list-content">
                                            <span class="md-list-heading">
                                            	<#if person.gender??>
													<#if person.gender == "M" >${uiLabelMap.CommonMale}</#if>
								                	<#if person.gender == "F" >${uiLabelMap.CommonFemale}</#if>
							                	<#else>
							                		----
												</#if>
                                            </span>
                                            <span class="uk-text-small uk-text-muted">${uiLabelMap.PartyGender}</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="md-list-addon-element">
                                            <i class="md-list-addon-icon material-icons">date_range</i>
                                        </div>
                                        <div class="md-list-content">
                                            <span class="md-list-heading"><#if person.birthDate??>${person.birthDate!}<#else>----</#if></span>
                                            <span class="uk-text-small uk-text-muted">${uiLabelMap.FormFieldTitle_birthDate}</span>
                                        </div>
                                    </li>
                                    <#else>
								      <label>${uiLabelMap.PartyPersonalInformationNotFound}</label>
								    </#if>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="uk-width-large-3-10 hidden-print">
        <div class="md-card">
            <div class="md-card-toolbar">
                <div class="md-card-toolbar-actions">
                    <button class="md-btn md-btn-small md-btn-flat md-btn-flat-primary" data-uk-modal="{target:'#modal_header_footer'}">${uiLabelMap.PartyChangePassword}</button>
                </div>
                <h3 class="md-card-toolbar-heading-text">
                    ${uiLabelMap.CommonUsername} &amp; ${uiLabelMap.CommonPassword}
                </h3>
            </div>
            <div class="uk-modal" id="modal_header_footer">
                <div class="uk-modal-dialog">
                	<form id="changepasswordform" method="post" action="<@ofbizUrl>updatePassword</@ofbizUrl>">
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
                </div>
            </div>
            <div class="md-card-content">
                <div class="md-list">
                    <li>
                        <div class="md-list-content">
                            <span class="md-list-heading">${userLogin.userLoginId}</span>
                            <span class="uk-text-small uk-text-muted uk-text-truncate">${uiLabelMap.CommonUsername}</span>
                        </div>
                    </li>
                </div>
            </div>
        </div>
    </div>
</div>
<#else>
    <h3>${uiLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}</h3>
</#if>
