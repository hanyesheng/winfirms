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
<#list RoleTypeAndParty as RoleTypeAndParty>
	<#if RoleTypeAndParty.roleTypeId = "BUSINESSMAN">
		<#assign Businessman = 1>
	</#if>
</#list>
<#if Businessman??>
    <ul style="list-style: none;">
	<li>
		<div class="uk-grid" data-uk-grid-margin data-uk-grid-match id="user_profile">
		<#list CourseAndRoleIn as CourseAndRoleIn>
		<div class="uk-width-large-1-2">
	        <div class="md-card">
	        	<div class="md-card-toolbar">
	                <h3 class="md-card-toolbar-heading-text">
	                    <a href="#">${CourseAndRoleIn.productName}</a>${uiLabelMap.FileDownload}
	                </h3>
	            </div>
	            <div class="md-card-content">
	           	<table class="uk-table uk-table-hover">
	           		<tbody>
           			<#list ProductContentAndInfoDownload as ProductContentAndInfoDownload>
						<#if ProductContentAndInfoDownload.productId = CourseAndRoleIn.productId>
						<tr>
							<td>${ProductContentAndInfoDownload.contentName}</td>
							<td>
								<a href="/partymgr/control/img/${ProductContentAndInfoDownload.contentName}?imgId=${(ProductContentAndInfoDownload.dataResourceId)!}">
									${uiLabelMap.CommonDownload}
								</a>
							</td>
						</tr>
						</#if>
					</#list>
					</tbody>
	           	</table>
	        	</div>
	        </div>
	    </div>
	    <div class="uk-width-large-1-2">
	        <div class="md-card">
	        	<div class="md-card-toolbar">
	                <h3 class="md-card-toolbar-heading-text">
	                    <a href="#">${CourseAndRoleIn.productName}</a>${uiLabelMap.CommonUpload}
	                </h3>
	            </div>
	            <div class="md-card-content">
	        	<table class="uk-table uk-table-hover">
	           		<tbody>
			            <#list ProductContentAndInfoUpload as ProductContentAndInfoUpload>
							<#if ProductContentAndInfoUpload.productId = CourseAndRoleIn.productId>
							<tr>
								<td>${ProductContentAndInfoUpload.contentName}</td>
								<td>
									<form name="removeUploadCourseFile_${ProductContentAndInfoUpload_index}" style="display: inline-block;" method="post" action="<@ofbizUrl>removeUploadCourseFile</@ofbizUrl>">
					                  	<input name="fromDate" value="${ProductContentAndInfoUpload.fromDate!}" type="hidden">
										<input name="productId" value="${ProductContentAndInfoUpload.productId!}" type="hidden">
										<input name="contentId" value="${ProductContentAndInfoUpload.contentId!}" type="hidden">
										<input name="productContentTypeId" value="${ProductContentAndInfoUpload.productContentTypeId!}" type="hidden">
					                  <a href="javascript:document.removeUploadCourseFile_${ProductContentAndInfoUpload_index}.submit()">${uiLabelMap.CommonDelete}</a>
					                </form>
									<a href="/partymgr/control/img/${ProductContentAndInfoUpload.contentName}?imgId=${(ProductContentAndInfoUpload.dataResourceId)!}">
										${uiLabelMap.CommonDownload}
									</a>
								</td>
							</tr>
							</#if>
						</#list>
						<tr>
							<td colspan="2">
								<form name="uploadCourseFile_${CourseAndRoleIn_index}" id="uploadCourseFile" method="post" enctype="multipart/form-data" action="<@ofbizUrl>uploadCourseFile</@ofbizUrl>">
						        	<input type="hidden" name="productId" value="${CourseAndRoleIn.productId}" id="EditCourseFile_productId">
								  	<input type="hidden" name="contentId" id="EditCourseFile_contentId">
								  	<input type="hidden" name="productContentTypeId" value="DIGITAL_UPLOAD" id="EditCourseFile_productContentTypeId">
								  	<input type="hidden" name="purchaseFromDate" id="EditCourseFile_purchaseFromDate">
								  	<input type="hidden" name="purchaseThruDate" id="EditCourseFile_purchaseThruDate">
								  	<input type="hidden" name="useCountLimit" id="EditCourseFile_useCountLimit">
								  	<input type="hidden" name="useTime" id="EditCourseFile_useTime">
								  	<input type="hidden" name="useTimeUomId" id="EditCourseFile_useTimeUomId">
								  	<input type="hidden" name="useRoleTypeId" id="EditCourseFile_useRoleTypeId">
								  	<input type="hidden" name="description" id="EditCourseFile_description">
								  	<input type="hidden" name="fileDataResourceId" id="EditCourseFile_fileDataResourceId">
						        	<input type="hidden" name="sequenceNum" size="6" id="EditCourseFile_sequenceNum">  
								  	<input type="hidden" value="${nowTimestamp}" name="fromDate" title="" size="25" maxlength="30" id="EditCourseFile_fromDate_i18n">
								  	<input type="hidden" name="thruDate"  maxlength="30" id="EditCourseFile_thruDate_i18n">
									<input type="file" name="imageData"/>
									<a href="javascript:document.uploadCourseFile_${CourseAndRoleIn_index}.submit()">${uiLabelMap.CommonUpload}</a>
				        		</form>
							</td>
						</tr>
					</tbody>
	           	</table>
	        	</div>
	        </div>
	    </div>
	    </#list>
	</div>
	</li>
    </ul>
<#else>
    <h3>${uiLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}</h3>
</#if>