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
<div class="container space30">
<div class="tab-content project-tab-content">
	<div class="tab-pane active">
		<div class="row">
			<div class="col-md-12">
				<div class="VivaTimeline">
					<dl>
						<#assign coldy = 0>
						<#assign lastFromDate = "00000000" />
						<#list ProductContentTimeline as ProductContentTimeline>
							<#assign contentUrl = "/content/control/stream?contentId=${ProductContentTimeline.contentId}"! />
							<#assign coldy = coldy + 1>
							<#assign fromDate = ProductContentTimeline.fromDate?string("yyyyMMdd") />
							<#if fromDate == lastFromDate><#else><dt>${ProductContentTimeline.fromDate?substring(0,10)!}</dt></#if> 
		                    <dd class="<#if coldy%2=0>pos-right<#else>pos-left</#if> clearfix">
		                        <div class="circ"></div>
		                        <div class="time">${ProductContentTimeline.fromDate?substring(12,16)!}</div>	                        
		                        <div class="events">                              
		                            <#if ProductContentTimeline.mimeTypeId?contains("image")>
		                            	<div class="events-body">
			                                <img src="${contentUrl}"/>                              
			                            </div>
		                            </#if>
		                            <#if ProductContentTimeline.mimeTypeId?contains("video")>
		                            	<#assign videoUrl = ProductContentTimeline.drObjectInfo! />
		                            	<video id="my-video" class="video-js" controls preload="auto"  style="border-radius: 5px;min-width: 200px;height: 100%;width: 100%;"
											  poster="<@ofbizContentUrl>${productLargeImageUrl!}</@ofbizContentUrl>" data-setup="{}">
									        <source src="${videoUrl?substring(39)}" type="video/mp4">
									    </video>
		                            </#if>
		                            <div class="events-footer">
		                            	<p>${ProductContentTimeline.description!}</p>
		                            </div>                               
		                        </div>
		                    </dd>
		                    <#assign lastFromDate = ProductContentTimeline.fromDate?string("yyyyMMdd") />
						</#list>
	                </dl>
				</div>
			</div>
		</div>
	</div>
</div>
</div>