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
<#assign productLargeImageUrl = productContentWrapper.get("LARGE_IMAGE_URL", "url")! />
<div class="container space30">
	<div class="tab-content project-tab-content">
		<div class="tab-pane active">
			<ul class="list-group videolist">
				<#list ProductContentVideoList as ProductContentVideoList>
					<#if ProductContentVideoList.mimeTypeId?? && ProductContentVideoList.mimeTypeId?contains("video")>
					  	<li class="list-group-item <#if parameters.videoId?? && ProductContentVideoList.drDataResourceId = parameters.videoId>active</#if>">
						    ${ProductContentVideoList.description!}
						    <a href="/store/products/p_${productId}?videoId=${ProductContentVideoList.drDataResourceId}" class="label label-danger pull-right">
						    	<#if parameters.videoId?? && ProductContentVideoList.drDataResourceId = parameters.videoId>
						    		<span class="glyphicon glyphicon-stats"></span>&nbsp;&nbsp;${uiLabelMap.VideoPlaying}...
					    		<#else>
					    			<span class="glyphicon glyphicon-play-circle"></span>&nbsp;&nbsp;${uiLabelMap.PlayVideo}
						    	</#if>
						    </a>
				  		</li>
					</#if>
				</#list>
			</ul>
		</div>
	</div>
</div>