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
<div class="blog_list uk-grid-width-medium-1-1 uk-grid-width-large-1-1" data-uk-grid="{gutter: 24}" style="margin-top: 10px;">
	<div>
	    <div class="md-card">
	    	<div class="md-card-toolbar"><h3 class="md-card-toolbar-heading-text">${uiLabelMap.RecruitInfo}</h3></div>
	        <#list ProductContentRecruit as ProductContentRecruit>
				<#assign dataResourceId = ProductContentRecruit.dataResourceId! />
				<#assign contentUrl = "/content/control/stream?contentId=${ProductContentRecruit.contentId}"! />
                <div class="md-card-content">
                    <#assign textData = null! />
	            	<#if dataResourceId?has_content>
	            		<#list dataText as dataText>
							<#if dataText.dataResourceId = dataResourceId>
								<#assign textData = dataText.textData! />
							</#if>
						</#list>
					</#if>
					<div class="blog_list_teaser">
                        ${StringUtil.wrapString(textData!)}
                    </div>
                    <div class="uk-alert uk-alert-success">
                        ${uiLabelMap.CommonFromDate}&nbsp;:&nbsp;<span class="uk-text-large">${ProductContentRecruit.fromDate?substring(0,16)!}</span>
                        &nbsp;/&nbsp;
                        ${uiLabelMap.CommonCreatedBy}&nbsp;:&nbsp;<span class="uk-text-large">${ProductContentRecruit.createdByUserLogin!}</span>
                        &nbsp;/&nbsp;
                        ${uiLabelMap.CommonLastModifiedBy}&nbsp;:&nbsp;<span class="uk-text-large">${ProductContentRecruit.lastModifiedByUserLogin!}</span>
                    </div>
                    <form method="post" action="<@ofbizUrl>removeProjectRecruit</@ofbizUrl>" onsubmit="javascript:submitFormDisableSubmits(this)" name="removeProjectRecruitInfos_${ProductContentRecruit_index}">
                    	<input name="fromDate" value="${ProductContentRecruit.fromDate}" type="hidden">
                    	<input name="productId" value="${ProductContentRecruit.productId}" type="hidden">
                    	<input name="contentId" value="${ProductContentRecruit.contentId}" type="hidden">
                    	<input name="productContentTypeId" value="${ProductContentRecruit.productContentTypeId}" type="hidden">
                    </form>
                    <div class="blog_list_footer uk-text-center">
                    	<div class="md-card-toolbar-actions">
                            <a href="<@ofbizUrl>updateProjectRecruit?productId=${ProductContentRecruit.productId!}&contentId=${ProductContentRecruit.contentId!}&productContentTypeId=${ProductContentRecruit.productContentTypeId!}&fromDate=${ProductContentRecruit.fromDate!}</@ofbizUrl>" class="md-btn md-btn-flat md-btn-flat-primary"><i class="material-icons uk-text-primary">edit</i>${uiLabelMap.CommonEdit}</a>
                            <a href="javascript:document.removeProjectRecruitInfos_${ProductContentRecruit_index}.submit()" class="md-btn md-btn-flat md-btn-flat-danger"><i class="material-icons uk-text-danger">delete</i>${uiLabelMap.CommonDelete}</a>
                       </div>
                    </div>
                </div>
        	</#list>
        </div>
    </div>
</div>