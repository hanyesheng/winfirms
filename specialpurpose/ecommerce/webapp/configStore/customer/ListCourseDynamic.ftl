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
<div class="blog_list uk-grid-width-medium-1-2 uk-grid-width-large-1-3" data-uk-grid="{gutter: 24}" style="margin-top: 10px;">
	<#list ProductContentTimeline as ProductContentTimeline>
		<#assign contentUrl = "/content/control/stream?contentId=${ProductContentTimeline.contentId}"! />
        <div>
            <div class="md-card">
                <div class="md-card-content small-padding">
                    <#if ProductContentTimeline.mimeTypeId?contains("image")>
	                	<img src="${contentUrl}" class="blog_list_teaser_image"/>       
	                </#if>
	                <#if ProductContentTimeline.mimeTypeId?contains("video")>
	                	<#assign videoUrl = ProductContentTimeline.drObjectInfo! />
	                	<video id="my-video" class="video-js blog_list_teaser_image" controls preload="auto"  style="border-radius: 5px;min-width: 200px;height: 100%;width: 100%;"
							  poster="<@ofbizContentUrl>${contentPathPrefix!}${productLargeImageUrl!}</@ofbizContentUrl>" data-setup="{}">
					        <source src="${videoUrl?substring(39)}" type="video/mp4">
					    </video>
	                </#if>
                    <div class="blog_list_teaser">
                        <p>${ProductContentTimeline.description!}</p>
                        <span class="uk-text-muted uk-text-small">${ProductContentTimeline.fromDate?substring(0,16)!}</span>
                    </div>
                    <form method="post" action="<@ofbizUrl>removeCourseDynamicInfos</@ofbizUrl>" onsubmit="javascript:submitFormDisableSubmits(this)" name="removeProjectDynamicInfos_${ProductContentTimeline_index}">
                    	<input name="fromDate" value="${ProductContentTimeline.fromDate}" type="hidden">
                    	<input name="productId" value="${ProductContentTimeline.productId}" type="hidden">
                    	<input name="contentId" value="${ProductContentTimeline.contentId}" type="hidden">
                    	<input name="productContentTypeId" value="TIMELINE" type="hidden">
                    </form>
                    <div class="blog_list_footer">
                        <a href="javascript:document.removeProjectDynamicInfos_${ProductContentTimeline_index}.submit()" class="md-btn md-btn-small md-btn-flat md-btn-flat-primary uk-float-right"><i class="material-icons uk-text-primary">delete</i>${uiLabelMap.CommonDelete}</a>
                    </div>
                </div>
            </div>
        </div>
	</#list>
</div>