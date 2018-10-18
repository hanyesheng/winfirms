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
                    <ul class="user_stats">
                        <li>
                            <h4 class="heading_a">${ProductAndRoleIn?size}<span class="sub-heading">${uiLabelMap.ProjectJoin}</span></h4>
                        </li>
                        <li>
                            <h4 class="heading_a">${CourseAndRoleIn?size} <span class="sub-heading">${uiLabelMap.Course}</span></h4>
                        </li>
                        <li>
                            <h4 class="heading_a">${ActiveDegree?size} <span class="sub-heading">${uiLabelMap.ActiveDegree}</span></h4>
                        </li>
                    </ul>
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
                            <div class="uk-width-large-1-2">
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
                                            <i class="md-list-addon-icon material-icons">account_box</i>
                                        </div>
                                        <div class="md-list-content">
                                            <span class="md-list-heading">
                                            	<#if (RoleTypeAndParty?size > 0)>
													<#list RoleTypeAndParty as RoleTypeAndParty>
														<span class="uk-badge uk-badge-primary">${RoleTypeAndParty.description}</span>
													</#list>
												<#else>
													<span class="unverified">${uiLabelMap.Unverified}</span>
												</#if>
                                            </span>
                                            <span class="uk-text-small uk-text-muted">${uiLabelMap.PartyRole}</span>
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
                            <div class="uk-width-large-1-2">
                                <h4 class="heading_c uk-margin-small-bottom">${uiLabelMap.Course}</h4>
                                <ul class="md-list">
                                	<#list PartyRelationship as PartyRelationship>
										<#if PartyRelationship.partyIdTo??>
											<#list PartyGroup as PartyGroup>
												<#if PartyRelationship.partyIdTo = PartyGroup.partyId>
													<li>
				                                        <div class="md-list-content">
				                                            <span class="md-list-heading"><a href="#">${PartyGroup.groupName!}</a></span>
				                                            <span class="uk-text-small uk-text-muted">${PartyGroup.comments!}</span>
				                                        </div>
				                                   </li>
												</#if>
											</#list>
										</#if>
									</#list>
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
                	${screens.render("component://ecommerce/widget/winfirms/CustomerScreens.xml#changepassword")}
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
        <div class="md-card">
        	<div class="md-card-toolbar">
                <h3 class="md-card-toolbar-heading-text">
                    ${uiLabelMap.AddCommonParent}
                </h3>
            </div>
            <div class="md-card-content">
                <div class="md-list uk-margin-bottom">
                    <div class="md-list-content uk-input-group">
                        <form method="post" action="<@ofbizUrl>createPartyRelationship</@ofbizUrl>" id="AddOtherPartyRelationship" class="basic-form" name="AddOtherPartyRelationship">
							<select name="partyIdTo">
							<option value="">---</option>
							<#list PartyRole as PartyRole>
								<#list PartyGroup as PartyGroup>
									<#if PartyGroup.partyId = PartyRole.partyId>
										<option value="${PartyGroup.partyId}">${PartyGroup.groupName}</option>
									</#if>
								</#list>
							</#list>
							</select>
							<input name="partyIdFrom" value="${party.partyId}" type="hidden">
							<input name="roleTypeIdTo" value="CLASS" type="hidden">
							<input name="partyRelationshipTypeId" value="CHILD" type="hidden">
							<input name="statusId" value="PARTYREL_CREATED" type="hidden">
							<input name="fromDate" value="${nowTimestamp}" type="hidden">
						</form>
						<span class="uk-input-group-addon">
							<a class="md-btn" href="javascript:document.getElementById('AddOtherPartyRelationship').submit();"><i class="material-icons">note_add</i>${uiLabelMap.AddCommonParent}</a>
						</span>
                   </div>
                </div>
            </div>
        </div>
        <div class="md-card">
        	<div class="md-card-toolbar">
                <h3 class="md-card-toolbar-heading-text">
                    ${uiLabelMap.RoleVerify}
                </h3>
            </div>
            <div class="md-card-content">
                <div class="md-list uk-margin-bottom">
                    <div class="md-list-content uk-input-group">
                        <form method="post" action="<@ofbizUrl>addrole</@ofbizUrl>" id="addrole" class="basic-form" name="addrole">
							<select name="roleTypeId">
								<option value="BUSINESSMAN">${uiLabelMap.Businessman}</option>
								<option value="INVESTORS">${uiLabelMap.Investors}</option>
								<option value="TEACHER">${uiLabelMap.Teacher}</option>
							</select>
							<input name="partyId" value="${party.partyId}" type="hidden">
						</form>
						<span class="uk-input-group-addon">
							<a class="md-btn" href="javascript:document.getElementById('addrole').submit();"><i class="material-icons">note_add</i>${uiLabelMap.AddRole}</a>
						</span>
                   </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#else>
    <h3>${uiLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}</h3>
</#if>
