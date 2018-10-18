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
<#if partyGroup??>
	<ul class="uk-tab" data-uk-tab="{connect:'#tabs_anim2', animation:'slide-horizontal'}">
		<#assign ClassCol = 0>
        <#list PartyRelationship as PartyRelationship>
        	<#list PartyGroup as PartyGroup>
				<#if PartyRelationship.partyIdTo = PartyGroup.partyId>
				<li <#if ClassCol = 0>class="uk-active"</#if>><a href="<@ofbizUrl>filemanager</@ofbizUrl>">${PartyGroup.groupName!}</a></li>
				</#if>
				<#assign ClassCol = ClassCol + 1>
			</#list>		
        </#list>
    </ul>
    <ul id="tabs_anim2" class="uk-switcher uk-margin">
    <#list PartyRelationship as PartyRelationship>
    	<#list PartyGroup as PartyGroup>
    		<#if PartyRelationship.partyIdTo = PartyGroup.partyId>
    			<#assign ClassName = PartyGroup.groupName!>
    		</#if>
		</#list>
	<li>
		<div class="uk-grid" data-uk-grid-margin data-uk-grid-match id="user_profile">
			<div class="uk-width-large-1-2">
	        <div class="md-card">
	        	<div class="md-card-toolbar">
	                <h3 class="md-card-toolbar-heading-text">
	                    ${uiLabelMap.AttachFile}
	                </h3>
	            </div>
	            <div class="md-card-content">
	        	<table class="uk-table uk-table-hover">
	           		<tbody>
		            <#list StudentsPartyContentUpload as StudentsPartyContentUpload>
						<#if StudentsPartyContentUpload.partyId = PartyRelationship.partyIdTo>		
						<tr>
							<td>${StudentsPartyContentUpload.contentName}</td>
							<td>
								<a href="ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${StudentsPartyContentUpload.contentId}">
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
	                    ${uiLabelMap.CommonUpload}
	                </h3>
	            </div>
	            <div class="md-card-content">
	           	<table class="uk-table uk-table-hover">
	           		<tbody>
           			<#list PartyContentDownload as PartyContentDownload>
						<#if PartyContentDownload.partyId = PartyRelationship.partyIdTo>
						<tr>
							<td>${PartyContentDownload.contentName}</td>
							<td>
								<form name="removePartyContent_${PartyContentDownload_index}" style="display: inline-block;" method="post" action="<@ofbizUrl>removePartyContent</@ofbizUrl>">
				                  <input name="contentId" value="${PartyContentDownload.contentId}" type="hidden">
				                  <input name="partyId" value="${PartyContentDownload.partyId}" type="hidden">
				                  <input name="partyContentTypeId" value="${PartyContentDownload.partyContentTypeId}" type="hidden">
				                  <input name="fromDate" value="${PartyContentDownload.fromDate}" type="hidden">
				                  <a href="javascript:document.removePartyContent_${PartyContentDownload_index}.submit()">${uiLabelMap.CommonDelete}</a>
				                </form>
								
								<a href="ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${PartyContentDownload.contentId}">${uiLabelMap.CommonDownload}</a>
							</td>
						</tr>
						</#if>
					</#list>
					</tbody>
	           	</table>
	        	</div>
	        </div>
	    </div>
	    
	    <div class="uk-width-large-1-1">
	    	<div class="md-card">
	    	    <div class="md-card-toolbar">
					<h3 class="md-card-toolbar-heading-text">
	                    ${uiLabelMap.UpTo}${ClassName!}
	                </h3>
	            </div>
	    <form id="uploadParentPartyContent" method="post" enctype="multipart/form-data" action="<@ofbizUrl>uploadParentPartyContent</@ofbizUrl>">
	        
	            <div class="md-card-content">
		        	<input type="hidden" name="dataCategoryId" value="PERSONAL"/>
			        <input type="hidden" name="statusId" value="CTNT_PUBLISHED"/>
			        <input name="contentTypeId" value="DOCUMENT" type="hidden">
			        <input type="hidden" name="partyId" value="${PartyRelationship.partyIdTo}" id="contentPartyId"/>
			        <input type="hidden" name="partyContentTypeId" value="USERDEF"/>
			        <input type="hidden" name="isPublic" value="Y"/>
			        <input type="hidden" name="roleTypeId" value="_NA_"/>
					<input type="file" name="uploadedFile" id="input-file-b" class="dropify"/>
		            <input style="margin-top: 10px;" class="md-btn md-btn-block md-btn-icon" type="submit"  value="${uiLabelMap.CommonUpload}"/>
	            </div>
            
        </form>
            </div>
		</div>
	</div>
	</li>
	</#list>
    </ul>




<#elseif person??>
	<ul class="uk-tab" data-uk-tab="{connect:'#tabs_anim2', animation:'slide-horizontal'}">
		<#assign ClassCol = 0>
        <#list PartyRelationship as PartyRelationship>
        	<#list PartyGroup as PartyGroup>
				<#if PartyRelationship.partyIdTo = PartyGroup.partyId>
				<li <#if ClassCol = 0>class="uk-active"</#if>><a href="<@ofbizUrl>filemanager</@ofbizUrl>">${PartyGroup.groupName!}</a></li>
				</#if>
				<#assign ClassCol = ClassCol + 1>
			</#list>		
        </#list>
    </ul>
    
    
    <ul id="tabs_anim2" class="uk-switcher uk-margin">
    <#list PartyRelationship as PartyRelationship>
    	<#list PartyGroup as PartyGroup>
    		<#if PartyRelationship.partyIdTo = PartyGroup.partyId>
    			<#assign ClassName = PartyGroup.groupName!>
    		</#if>
		</#list>
	<li><div class="uk-grid" data-uk-grid-margin data-uk-grid-match id="user_profile">
		<div class="uk-width-large-1-2">
	        <div class="md-card">
	        	<div class="md-card-toolbar">
	                <h3 class="md-card-toolbar-heading-text">
	                    ${uiLabelMap.AttachFile}
	                </h3>
	            </div>
	            <div class="md-card-content">
	           	<table class="uk-table uk-table-hover">
	           		<tbody>
           			<#list PartyContentDownload as PartyContentDownload>
						<#if PartyContentDownload.partyId = PartyRelationship.partyIdTo>
						<tr>
							<td>${PartyContentDownload.contentName}</td>
							<td>
								<a href="ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${PartyContentDownload.contentId}">
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
	                    ${uiLabelMap.CommonUpload}
	                </h3>
	            </div>
	            <div class="md-card-content">
	        	<table class="uk-table uk-table-hover">
	           		<tbody>
		            <#list PartyContentUpload as PartyContentUpload>
						<#if PartyContentUpload.partyId = PartyRelationship.partyIdTo>
						<tr>
							<td>${PartyContentUpload.contentName}</td>
							<td>
								<form name="removePartyContent_${PartyContentUpload_index}" style="display: inline-block;" method="post" action="<@ofbizUrl>removePartyContent</@ofbizUrl>">
				                  <input name="contentId" value="${PartyContentUpload.contentId}" type="hidden">
				                  <input name="partyId" value="${PartyContentUpload.partyId}" type="hidden">
				                  <input name="partyContentTypeId" value="${PartyContentUpload.partyContentTypeId}" type="hidden">
				                  <input name="fromDate" value="${PartyContentUpload.fromDate}" type="hidden">
				                  <a href="javascript:document.removePartyContent_${PartyContentUpload_index}.submit()">${uiLabelMap.CommonDelete}</a>
				                </form>
								<a href="ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${PartyContentUpload.contentId}">
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
	    
	    <div class="uk-width-large-1-1">
	    	<div class="md-card">
	    	    <div class="md-card-toolbar">
					<h3 class="md-card-toolbar-heading-text">
	                    ${uiLabelMap.UpTo}${ClassName!}
	                </h3>
	            </div>
			    <form id="uploadParentPartyContent" method="post" enctype="multipart/form-data" action="<@ofbizUrl>uploadParentPartyContent</@ofbizUrl>">
			        <div class="md-card-content">
			        	<input type="hidden" name="dataCategoryId" value="PERSONAL"/>
				        <input type="hidden" name="statusId" value="CTNT_PUBLISHED"/>
				        <input name="contentTypeId" value="DOCUMENT" type="hidden">
				        <input type="hidden" name="partyId" value="${PartyRelationship.partyIdTo}" id="contentPartyId"/>
				        <input type="hidden" name="partyContentTypeId" value="VNDSHPINF"/>
				        <input type="hidden" name="isPublic" value="Y"/>
				        <input type="hidden" name="roleTypeId" value="_NA_"/>
						<input type="file" name="uploadedFile" id="input-file-b" class="dropify"/>
			            <input style="margin-top: 10px;" class="md-btn md-btn-block md-btn-icon" type="submit"  value="${uiLabelMap.CommonUpload}"/>
		           </div>
		        </form>
            </div>
		</div>
	</div>
	</li>
	</#list>
    </ul>
<#else>
    <h3>${uiLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}</h3>
</#if>