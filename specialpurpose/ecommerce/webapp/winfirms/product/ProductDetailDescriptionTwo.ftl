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
<#assign productLargeImageUrl = productContentWrapper.get("MEDIUM_IMAGE_URL", "url")! />
<#list ProductContentVideoIntro?sort_by('fromDate') as ProductContentVideoIntro>
	<#assign drDataResourceId = ProductContentVideoIntro.drDataResourceId! />
	<#assign mimeTypeId = ProductContentVideoIntro.mimeTypeId! />
	<#assign videoUrl = ProductContentVideoIntro.drObjectInfo! />
</#list>	
<div class="container space30">
<div class="tab-content project-tab-content">
	<div class="tab-pane active">
		<#if mimeTypeId?? && mimeTypeId?contains("video")>
		<div class="row space30">
			<div class="col-md-8 col-md-offset-2">
				<div class="padding30">
					<video class="video-js" controls preload="none" style="border-radius: 5px;min-width: 200px;height: 100%;width: 100%;"
					      poster="${product.mediumImageUrl!}"
					      data-setup="">
					    <source src="${videoUrl?substring(39)}" type='${mimeTypeId!}' />
				  	</video>
				</div>
			</div>
		</div>
		<hr class="space50" style="background-color:#dedede;height:1px;">
		</#if>
		<article class="blogpost">
			${productContentWrapper.get("LONG_DESCRIPTION", "html")!}
		</article>
	</div>
</div>
</div>