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
<#if productId??>
	<div class="uk-width-medium-8-10 uk-container-center">
		<div class="md-card md-card-single">
			<div class="md-card-toolbar">
                <div class="md-card-toolbar-actions">
                    <i class="md-icon material-icons" id="toggleAll">&#xe8f2;</i>
                </div>
                <h3 class="md-card-toolbar-heading-text large">
                    ${uiLabelMap.BusinessPlan}
                </h3>
            </div>
            <style>
            	.hierarchical_slide>*{
            		visibility: inherit;
            	}
            </style>
            <div class="md-card-content padding-reset">
            <#list ProductContentTypeParent as ProductContentTypeParent>
            	<h4 class="heading_c full_width_in_card">${ProductContentTypeParent.productContentTypeId}-${ProductContentTypeParent.description}</h4>
            	<div class="uk-accordion uk-accordion-alt hierarchical_slide help_accordion" data-slide-children="h3" data-slide-context=".md-card-content">
	            <#list ProductContentType as ProductContentType>
	            	<#if ProductContentType.parentTypeId?? && ProductContentType.parentTypeId = ProductContentTypeParent.productContentTypeId>
		            <#assign contentId = null!/>
		            <#assign fromDate = null!/>
		            <#assign dataResourceId = null!/>
		            <#list ProductContent as ProductContent>
		            	<#if ProductContent.productContentTypeId = ProductContentType.productContentTypeId>
		            		<#assign contentId = ProductContent.contentId! />
		            		<#assign projectId = ProductContent.productId! />
		            		<#assign fromDate = ProductContent.fromDate! />
		            		<#assign dataResourceId = ProductContent.dataResourceId! />
	            		</#if>
	            	</#list>
	            	<#assign textData = null! />
	            	<#if dataResourceId?has_content>
	            		<#list dataText as dataText>
							<#if dataText.dataResourceId = dataResourceId>
								<#assign textData = dataText.textData! />
							</#if>
						</#list>
					</#if>
		            <h3 class="uk-accordion-title">
		            	${ProductContentType.productContentTypeId}&nbsp;&nbsp;${ProductContentType.description}
		            </h3>
                    <div class="uk-accordion-content">
                    	<div class="plan-list">
			                <span class="md-card-toolbar-actions">
			                	<#if textData?has_content>
			                		<form method="post" action="<@ofbizUrl>removeProjectPlanInfos</@ofbizUrl>" onsubmit="javascript:submitFormDisableSubmits(this)" name="removeProjectPlanInfos_${ProductContentType_index}">
				                    	<input name="fromDate" value="${fromDate!}" type="hidden">
				                    	<input name="productId" value="${parameters.productId!}" type="hidden">
				                    	<input name="contentId" value="${contentId!}" type="hidden">
				                    	<input name="productContentTypeId" value="${ProductContentType.productContentTypeId!}" type="hidden">
				                    </form>
			                    	<a href="<@ofbizUrl secure="true">updateProjectPlan?productId=${projectId!}&contentId=${contentId!}&productContentTypeId=${ProductContentType.productContentTypeId!}&fromDate=${fromDate!}</@ofbizUrl>" class="md-btn md-btn-small md-btn-flat md-btn-flat-primary"><i class="material-icons uk-text-primary">edit</i>${uiLabelMap.CommonEdit}</a>
			                    	<a href="javascript:document.removeProjectPlanInfos_${ProductContentType_index}.submit()" class="md-btn md-btn-flat md-btn-flat-danger"><i class="material-icons uk-text-danger">delete</i>${uiLabelMap.CommonDelete}</a>
			                    <#else>
			                    	<form method="post" action="<@ofbizUrl>updateProjectPlan</@ofbizUrl>" id="EditProductContentSimpleText" class="basic-form" onsubmit="javascript:submitFormDisableSubmits(this)" name="createProjectPlanInfos_${ProductContentType_index}">
									  <input type="hidden" name="productId" value="${parameters.productId!}" id="EditProductContentSimpleText_productId">
									  <input type="hidden" name="productContentTypeId" value="${ProductContentType.productContentTypeId!}">
									</form>
			                    	<a href="javascript:document.createProjectPlanInfos_${ProductContentType_index}.submit()" class="md-btn md-btn-small md-btn-flat md-btn-flat-primary">${uiLabelMap.CommonCreate}</a>
			                    </#if>
			                </span>
		                </div>
		                ${StringUtil.wrapString(textData!)}
                    </div>
	            	</#if>
	            </#list>
	            </div>
            </#list>
            </div>
        </div>
    </div>
</#if>
