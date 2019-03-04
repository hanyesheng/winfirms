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
<div class="uk-grid" data-uk-grid-margin="" data-uk-grid-match="">
	<div class="uk-width-medium-3-5 uk-width-large-3-5 uk-row-first" style="margin-top: 10px;">
		<div>
		    <div class="md-card">
		    	<div class="md-card-toolbar"><h3 class="md-card-toolbar-heading-text">${uiLabelMap.Teammates}</h3></div>
		        <div class="md-card-content">
		        <ul class="md-list md-list-addon">
		        	<li>
	                	<#assign createrLogoUrl = "/images/winfirms/user.png">
						<#list PartyAndUserLogin as PartyAndUserLogin>
							<#if product.createdByUserLogin = PartyAndUserLogin.userLoginId>
								<#assign createrPartyId = PartyAndUserLogin.partyId!/>
							</#if>
						</#list>
						<#list PartyContent?sort_by('fromDate') as PartyContent>
							<#if PartyContent.partyId = createrPartyId>
								<#assign createrContentId = PartyContent.contentId!/>
								<#if createrContentId?has_content>
									<#assign createrLogoUrl = "/content/control/stream?contentId=${createrContentId}"!/>
								</#if>
							</#if>
						</#list>
	                    <div class="md-list-addon-element">
	                        <img class="md-user-image md-list-addon-avatar" src="${createrLogoUrl!}" alt="">
	                        <br/>
	                    </div>
	                    <div class="md-list-content">
	                        <span class="md-list-heading"><span class="uk-badge uk-badge-success"><i class="material-icons md-color-light-green-50">face</i>&nbsp;${uiLabelMap.ProjectCreatedby}</span>${createrName!}-[${product.createdByUserLogin!}]</span>
	                        <span class="uk-text-small uk-text-muted">${product.createdDate?substring(0,16)!}</span>
	                    </div>
	                </li>
	                <#list ProductAndRole as ProductAndRole>
	                <li>
	                	<#assign personLogoUrl = "/images/winfirms/user.png">
						<#list PartyContent?sort_by('fromDate') as PartyContent>
							<#if PartyContent.partyId = ProductAndRole.partyId>
								<#assign personContentId = PartyContent.contentId!/>
								<#if personContentId?has_content>
									<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
								</#if>
							</#if>
						</#list>
						<#list PartyAndUserLogin as PartyAndUserLogin>
							<#if PartyAndUserLogin.partyId = ProductAndRole.partyId>
								<#assign UserLogin = PartyAndUserLogin.userLoginId!/>
							</#if>
						</#list>
						<form method="post" action="<@ofbizUrl>removeProjectParty</@ofbizUrl>" onsubmit="javascript:submitFormDisableSubmits(this)" name="UpdateProjectParty_${ProductAndRole_index}">
							<input name="fromDate" value="${ProductAndRole.fromDate!}" type="hidden">
							<input name="roleTypeId" value="${ProductAndRole.roleTypeId!}" type="hidden">
							<input name="VIEW_SIZE_1" value="20" type="hidden">
							<input name="productId" value="${ProductAndRole.productId!}" type="hidden">
							<input name="VIEW_INDEX_1" value="0" type="hidden">
							<input name="partyId" value="${ProductAndRole.partyId!}" type="hidden">
						</form>
	                    <div class="md-list-addon-element">
	                        <img class="md-user-image md-list-addon-avatar" src="${personLogoUrl!}" alt="">
	                        <br/>
	                        <a href="javascript:document.UpdateProjectParty_${ProductAndRole_index}.submit()">${uiLabelMap.CommonDelete}</a>
	                    </div>
	                    <div class="md-list-content">
	                        <span class="md-list-heading">
	                        	<#if ProductAndRole.roleTypeId = "_NA_"><span class="uk-badge"><i class="material-icons md-color-light-green-50">people</i>&nbsp;${uiLabelMap.Teammates}[${uiLabelMap.CommonNormal}]</span></#if>
                        		<#if ProductAndRole.roleTypeId = "BUSINESSMAN"><span class="uk-badge uk-badge-primary"><i class="material-icons md-color-light-green-50">person</i>&nbsp;${uiLabelMap.Teammates}[${uiLabelMap.CommonManager}]</span></#if>
                        		<#if ProductAndRole.roleTypeId = "INVESTORS"><span class="uk-badge uk-badge-primary"><i class="material-icons md-color-light-green-50">monetization_on</i>&nbsp;${uiLabelMap.Investors}</span></#if>
	                        	${ProductAndRole.nickname!}-[${UserLogin!}]
	                        </span>
	                        <p style="margin: 5px;"><#if ProductAndRole.comments??>${uiLabelMap.CommentInformation}&nbsp;:&nbsp;${ProductAndRole.comments!}</#if></p>
	                        <span class="uk-text-small uk-text-muted">${ProductAndRole.fromDate?substring(0,16)!}</span>
	                    </div>
	                </li>
	                </#list>
	            </ul>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="uk-width-medium-2-5 uk-width-large-2-5" style="margin-top: 10px;">
		<div>
		    <div class="md-card">
		    	<div class="md-card-toolbar"><h3 class="md-card-toolbar-heading-text">${uiLabelMap.CommonAdd}${uiLabelMap.Teammates}</h3></div>
		        <div class="md-card-content uk-overflow-container">
		        	<form method="post" action="<@ofbizUrl>addProjectParty</@ofbizUrl>" id="AddProjectParty" class="basic-form" onsubmit="javascript:submitFormDisableSubmits(this)" name="AddProjectParty" novalidate="novalidate">
				  		<input type="hidden" name="productId" value="${productId!}" id="AddProjectParty_productId">
				  		<input type="hidden" name="sequenceNum" id="AddProjectParty_sequenceNum">
				  		<input type="hidden" class="" name="thruDate_i18n">    
				      	<input type="hidden" name="thruDate">
				      	<input type="hidden" name="fromDate_i18n" value="${nowTimestamp}">
				      	<input type="hidden" name="fromDate" value="${nowTimestamp}">
				  		<table cellspacing="0" class="basic-table  uk-table ">
				  		<tbody>
				  			<tr>
					  			<td class="label">
									<label for="AddProjectParty_partyId" id="AddProjectParty_partyId_title">${uiLabelMap.PartyId}</label>  
					  			</td>
					  			<td>
									<input type="text" class="" name="partyId" size="25" id="AddProjectParty_partyId" require="">  
					  			</td>
				  			</tr>
						  	<tr>
							  	<td class="label">
									<label for="AddProjectParty_roleTypeId" id="AddProjectParty_roleTypeId_title">${uiLabelMap.AddRole}</label>  </td>
							  	<td>
							  		<span class="ui-widget">
							    		<select class="valid" name="roleTypeId" id="AddProjectParty_roleTypeId" size="1">                
							    			<option value="_NA_">${uiLabelMap.Teammates}[${uiLabelMap.CommonNormal}]</option>            
							    			<option value="BUSINESSMAN">${uiLabelMap.Teammates}[${uiLabelMap.CommonManager}]</option>            
							    			<option value="INVESTORS">${uiLabelMap.Investors}</option>     
							    		</select>
							  		</span>
							  		<span class="uk-badge">${uiLabelMap.AddRoleNote}</span>
								</td>
						  	</tr>
				  			<tr>
				  				<td class="label">
									<label for="AddProjectParty_comments" id="AddProjectParty_comments_title">${uiLabelMap.CommentInformation}</label>  
				  				</td>
				  				<td>
									<input type="text" class="" name="comments" size="30" id="AddProjectParty_comments" require="">  
				  
				  				</td>
				  			</tr>
						  	<tr>
							  <td class="label">&nbsp;  </td>
							  <td colspan="4">
							    <input type="submit" class="smallSubmit" name="submitButton" value="${uiLabelMap.CommonCreate}">
							  </td>
						  	</tr>
				  		</tbody>
			  			</table>
					</form>
	            </div>
	        </div>
	    </div>
	</div>
</div>