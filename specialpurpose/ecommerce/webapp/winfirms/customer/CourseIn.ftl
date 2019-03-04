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
<#if IsBusinessman??>
<div class="uk-grid" data-uk-grid-margin data-uk-grid-match id="user_profile">
	<div class="uk-width-large-7-10">
		<div class="md-card">
			<div class="md-card-toolbar">
		    	<h3 class="md-card-toolbar-heading-text">${uiLabelMap.MyCourseJoin}</h3>
		   	</div>
		   	<div class="md-card-content uk-overflow-container">
		    <table class="uk-table table-bordered uk-table-hover">
		      <thead>
		          <tr>
		          	<th></th>
		            <th>${uiLabelMap.CourseName}</th>
		            <!--<th>${uiLabelMap.CourseInfo}</th>-->
		            <th>${uiLabelMap.CourseProjectCategory}</th>
		            <th></th>
		          </tr>
		        </thead>
		        <tbody>
		    	<#assign ProCol = 0>
		        <#list ProductAndRole as ProductAndRole>
		          	<tr>
		          		<td rowspan="3" style="border-right: 1px solid #e0e0e0;">${ProductAndRole_index+1}</td>
			            <td valign="center">
			            	<a href="<@ofbizUrl>product?product_id=${ProductAndRole.productId}</@ofbizUrl>" target="_blank">
			            		${ProductAndRole.productId} - ${ProductAndRole.productName?default("No Name")}
			            	</a>
			              	[${ProductAndRole.description!}]
			            </td>
			            <td valign="center">
			              	<a href="/products/${ProductAndRole.primaryProductCategoryId!}" target="_blank">${uiLabelMap.SeeCourseProjectCategory}</a>
			            </td>
			            <td valign="center" rowspan="3" style="border-left: 1px solid #e0e0e0;">
			              	<form method="post" action="<@ofbizUrl>removeCourseAtCourseIn</@ofbizUrl>" name="RemoveCourse_${ProductAndRole_index}">
								<input name="fromDate" value="${ProductAndRole.fromDate!}" type="hidden">
								<input name="roleTypeId" value="${ProductAndRole.roleTypeId!}" type="hidden">
								<input name="productId" value="${ProductAndRole.productId!}" type="hidden">
								<input name="partyId" value="${ProductAndRole.partyId!}" type="hidden">
							</form>
							<a class="" href="javascript:document.RemoveCourse_${ProductAndRole_index}.submit()">${uiLabelMap.CommonDelete}</a>
			            </td>
		          	</tr>
		          	<tr>
		          		<#assign ColDownloadFiles = 1>
		          		<#list ProductContentAndInfoDownload as ProductContentAndInfoDownload>
							<#if ProductContentAndInfoDownload.productId = ProductAndRole.productId>
								<#assign ColDownloadFiles = ColDownloadFiles + 1>
							</#if>
						</#list>
		          		<td colspan="2" style="padding: 0px;">
		          			<table class="uk-table table-bordered uk-table-hover">
		          				<tbody>
		          					<tr>
		          						<td rowspan="${ColDownloadFiles!}" style="border-right: 1px solid #e0e0e0;border-bottom: 0px solid #e0e0e0;width: 100px;">${uiLabelMap.FileDownload}</td>
		          					</tr>
		          					<#list ProductContentAndInfoDownload as ProductContentAndInfoDownload>
										<#if ProductContentAndInfoDownload.productId = ProductAndRole.productId>
											<tr>
												<td>
													${ProductContentAndInfoDownload.contentName}
													<a href="/partymgr/control/img/${ProductContentAndInfoDownload.contentName}?imgId=${(ProductContentAndInfoDownload.dataResourceId)!}" target="_blank">
														${uiLabelMap.CommonDownload}
													</a>
												</td>
											</tr>
										</#if>
									</#list>
		          				</tbody>
		          			</table>
		          		</td>
		          	</tr>
			        <tr>
			        	<#assign ColUploadFiles = 2>
		          		<#list ProductContentAndInfoUpload as ProductContentAndInfoUpload>
							<#if ProductContentAndInfoUpload.productId = ProductAndRole.productId>
								<#assign ColUploadFiles = ColUploadFiles + 1>
							</#if>
						</#list>
		          		<td colspan="2" style="padding: 0px;">
		          			<table class="uk-table table-bordered uk-table-hover">
		          				<tbody>  		
	          						<tr>
						          		<td rowspan="${ColUploadFiles!}" style="border-right: 1px solid #e0e0e0;border-bottom: 0px solid #e0e0e0;width: 100px;">
						          			${uiLabelMap.FileUpload}
						          		</td>
						          	</tr>
						          	<#list ProductContentAndInfoUpload as ProductContentAndInfoUpload>
										<#if ProductContentAndInfoUpload.productId = ProductAndRole.productId>
											<tr>
												<td>
													${ProductContentAndInfoUpload.contentName!}
													<form name="removeUploadCourseFile_${ProductContentAndInfoUpload_index}" style="display: inline-block;" method="post" action="<@ofbizUrl>removeUploadCourseFile</@ofbizUrl>">
									                  	<input name="fromDate" value="${ProductContentAndInfoUpload.fromDate!}" type="hidden">
														<input name="productId" value="${ProductContentAndInfoUpload.productId!}" type="hidden">
														<input name="contentId" value="${ProductContentAndInfoUpload.contentId!}" type="hidden">
														<input name="productContentTypeId" value="${ProductContentAndInfoUpload.productContentTypeId!}" type="hidden">
									                  <a href="javascript:document.removeUploadCourseFile_${ProductContentAndInfoUpload_index}.submit()">${uiLabelMap.CommonDelete}</a>
									                </form>
													<a href="/partymgr/control/img/${ProductContentAndInfoUpload.contentName}?imgId=${(ProductContentAndInfoUpload.dataResourceId)!}" target="_blank">
														${uiLabelMap.CommonDownload}
													</a>
												</td>
											</tr>
										</#if>
									</#list>
									<tr>
										<td>
						          			<form name="uploadCourseFile_${ProductAndRole_index}" id="uploadCourseFile" method="post" enctype="multipart/form-data" action="<@ofbizUrl>uploadCourseFile</@ofbizUrl>">
									        	<input type="hidden" name="productId" value="${ProductAndRole.productId}" id="EditCourseFile_productId">
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
												<a href="javascript:document.uploadCourseFile_${ProductAndRole_index}.submit()">${uiLabelMap.CommonUpload}</a>
							        		</form>
						        		</td>
									</tr>
		          				</tbody>
		          			</table>
		          		</td>
		          	</tr>
		          	<tr>
		          		<td colspan="4" style="background-color: #0097a7;padding: 1px;"></td>
		          	</tr>
			    </#list>
		      </tbody>
		    </table>
			</div>
		</div>
	</div>
	<div class="uk-width-large-3-10 hidden-print">
		<div class="md-card">
        	<div class="md-card-toolbar">
                <h3 class="md-card-toolbar-heading-text">
                    ${uiLabelMap.AddCommonParent}
                </h3>
            </div>
            <div class="md-card-content">
                <div class="md-list uk-margin-bottom">
                    <div class="md-list-content uk-input-group">
                        <form method="post" action="<@ofbizUrl>addCourseAtCourseIn</@ofbizUrl>" id="AddCourse" class="basic-form" name="AddCourse">
							<input type="hidden" name="sequenceNum" id="AddCourse_sequenceNum">
  							<input type="hidden" class="" value="${userLogin.partyId}" name="partyId" size="25" id="AddCourse_partyId" require="">
  							<input type="hidden" class="" value="BUSINESSMAN" name="roleTypeId" size="25" id="AddCourse_partyId" require="">
  							<input type="hidden" name="fromDate" class="required hasDatepicker" title="" value="${nowTimestamp}" size="25" maxlength="30" id="AddCourse_fromDate">
      						<input type="hidden" name="thruDate" title="" size="25" maxlength="30" id="AddCourse_thruDate" class="hasDatepicker">
      						<input type="hidden" class="" name="comments" size="30" id="AddCourse_comments" require="">
							<select name="productId">
								<option value="">---</option>
								<!--显示允许浏览下的所有课程-->
								<#list ProductAndCategoryMember as ProductAndCategoryMember>
									<#assign CourseHas = 0>
									<#list ProductAndRole as ProductAndRole>
										<#if ProductAndRole.productId = ProductAndCategoryMember.productId><#assign CourseHas = 1></#if>
									</#list>
									<option value="${ProductAndCategoryMember.productId}" <#if CourseHas = 1>disabled="disabled"</#if> >${ProductAndCategoryMember.productName}</option>
								</#list>
							</select>
						</form>
						<span class="uk-input-group-addon">
							<a class="md-btn" href="javascript:document.getElementById('AddCourse').submit();"><i class="material-icons">note_add</i>${uiLabelMap.AddCommonParent}</a>
						</span>
                   </div>
                </div>
            </div>
        </div>
    </div>
</div>
</#if>
