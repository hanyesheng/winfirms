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
		<#if downloadProductContentAndInfoList?has_content>
			<h3 class="uppercase text-center space30">${uiLabelMap.FileDownload}</h3>
	        <table class="table table-bordered">
	        	<tbody>
		     	<#if userLogin?has_content && userLogin.userLoginId != "anonymous">
					<#list downloadProductContentAndInfoList as downloadProductContentAndInfo>
			            <tr>
							<td>
								${downloadProductContentAndInfo.contentName!}
								<#if downloadProductContentAndInfo.description?has_content>
				            		 - ${downloadProductContentAndInfo.description}
				            	</#if>
							</td>
							<td>
								<a href="/partymgr/control/img/${downloadProductContentAndInfo.contentName}?imgId=${(downloadProductContentAndInfo.dataResourceId)!}">
									${uiLabelMap.CommonDownload}
								</a>
							</td>
						</tr>
		        	</#list>
				<#else>
					<tr>
						<td colspan="2">
						( ${uiLabelMap.OrderYouMust}<a href="<@ofbizUrl>checkLogin</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonLogin}</a>${uiLabelMap.DownloadFile} )
						</td>
					</tr>
				</#if>
				</tbody>
			</table>
		</#if>
	</div>
</div>
</div>