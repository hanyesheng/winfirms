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
<#list PersonList as PersonList>
	<#assign partyId = PersonList.partyId! />
</#list>
<div class="md-card">
<div class="md-card-content">
<div class="uk-margin-large-bottom">
	<!-- Comments -->
	<ul class="uk-comment-list">
		<#assign colcommunicationEvents=0>
		<#list disscussCommunicationEvents as communicationEvents>
			<#if !communicationEvents.parentCommEventId?has_content>
				<#list commPersonList as commPersonList>
					<#if commPersonList.partyId = communicationEvents.partyIdFrom>
						<#assign nickName = commPersonList.nickname!/>
						<#assign personLogoUrl = "/images/winfirms/user.png">
						<#list commPartyContentList?sort_by('fromDate') as commPartyContentList>
							<#if commPartyContentList.partyId = commPersonList.partyId>
								<#assign personContentId = commPartyContentList.contentId!/>
								<#if personContentId?has_content>
									<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
								</#if>
							</#if>
						</#list>
					</#if>
					<#if !nickName?has_content>
						<#assign nickName = communicationEvents.partyIdFrom!/>
					</#if>
				</#list>
				<li>
					<article class="uk-comment">
	                    <header class="uk-comment-header">
	                        <img class="md-user-image uk-comment-avatar" src="${personLogoUrl}" alt="">
	                        <h4 class="uk-comment-title"><a class="" data-uk-modal="{target:'#modal_${communicationEvents_index}'}">${nickName}</a></h4>
	                        <div class="uk-comment-meta">${communicationEvents.entryDate.toString().substring(0,19)!}</div>
	                    </header>
	                    <div class="uk-modal" id="modal_${communicationEvents_index}">
	                    	<div class="uk-modal-dialog">
			                	<form method="post" action="<@ofbizUrl secure="true">createDisscussProjCommunicationEvent?detailId=comm</@ofbizUrl>" name="CreateTopicEvent_${communicationEvents.communicationEventId}" class="border" onsubmit="return checkIP1();">
							      	<div class="uk-modal-header">
							        	<h3 class="uk-modal-title">${uiLabelMap.PartyReply}${nickName}</h3>
							      	</div>
							      	<div class="modal-body">
							        <#if userPartyId??>
									<!--回复提交的表单-->
										<input name="action" type="hidden"/>
										  	<input name="my" type="hidden"/>
										  	<input name="messageId" type="hidden"/>
										  	<input name="productId" value="${product.productId}" type="hidden"/>
										  	<input name="parentCommEventId" value="${communicationEvents.communicationEventId}" type="hidden"/>
										  	<input name="communicationEventTypeId" value="PRODUCT_DISSCUSS" type="hidden"/>
										  	<input name="statusId" value="COM_COMPLETE" type="hidden"/>
										  	<input name="partyIdFrom" value="${userPartyId}" type="hidden"/>
										  	<input name="partyIdTo" value="${communicationEvents.partyIdFrom}" type="hidden"/>
										  	<input name="contactMechTypeId" type="hidden"/>
										  	<input name="contactMechIdFrom" autocomplete="off" type="hidden"/>
										  	<input name="contactMechIdTo" autocomplete="off" type="hidden"/>
										  	<input name="roleTypeIdFrom" value="_NA_" type="hidden"/>
										  	<input name="roleTypeIdTo" value="_NA_" type="hidden"/>
										  	<input name="contactListId" type="hidden"/>
										  	<input name="datetimeStarted" type="hidden"/>
										  	<input name="datetimeEnded" type="hidden"/>
										  	<input name="reasonEnumId" type="hidden"/>
										  	<input name="contentMimeTypeId" value="text/plain" type="hidden"/>
										  	<input name="note" type="hidden" value="${communicationEvents.communicationEventId}"/>
										  	<input name="subject" type="hidden" value="${uiLabelMap.Project}[${product.productName!}]${uiLabelMap.OfDissuiss}"/>
											<!-- Field 2 -->
										<div class="input-email form-group wrapper-full">
											<textarea required="required" id="url1" name="content" class="md-input md-input-full" placeholder="${uiLabelMap.PartyReply}${nickName}" rows="4" ></textarea>
										</div>
									<#else>
									  	<h5 class="uppercase text-center space30">${uiLabelMap.EcommerceLoggedToPost}</h5>
									</#if>
							      	</div>
							      	<div class="uk-modal-footer uk-text-right">
							        	<button type="button" class="md-btn md-btn-flat uk-modal-close" data-dismiss="modal">${uiLabelMap.CommonClose}</button>
							        	<button type="submit" class="md-btn md-btn-flat md-btn-flat-primary">${uiLabelMap.EcommerceBlogPostedOn}<i class="uni-paper-plane"></i></button>
							      	</div>
							      </form>
			                </div>
			            </div>
	                    <div class="uk-comment-body">
	                        <p>${communicationEvents.content!}</p>
	                    </div>
	                </article>
	                <ul>
					<!-- Comments Replay 所有对评论的回复-->
					<#assign colChildevents=0>
					<#list childEvents as childEvents>
						<#if childEvents.parentCommEventId?has_content&&childEvents.parentCommEventId = communicationEvents.communicationEventId>
							<#list commPersonList as commPersonList>
								<#if commPersonList.partyId = childEvents.partyIdFrom>
									<#assign nickNamechildFrom = commPersonList.nickname!/>
								</#if>
								<#if !nickName?has_content>
									<#assign nickNamechildFrom = childEvents.partyIdFrom!/>
								</#if>
								<#if commPersonList.partyId = childEvents.partyIdTo>
									<#assign nickNamechildTo= commPersonList.nickname!/>
								</#if>
								<#if !nickNamechildTo?has_content>
									<#assign nickNamechildTo = childEvents.partyIdTo!/>
								</#if>
							</#list>
							<li>
		                        <article class="uk-comment">
		                            <header class="uk-comment-header">
		                                <h4 class="uk-comment-title"><a class="" data-uk-modal="{target:'#modal_child_${childEvents_index}'}">${nickNamechildFrom!}</a>&nbsp;&nbsp;${uiLabelMap.PartyReply}&nbsp;${nickNamechildTo!}</h4>
		                                <div class="uk-comment-meta">${childEvents.entryDate.toString().substring(0,19)!}</div>
		                            </header>
		                            <div class="uk-modal" id="modal_child_${childEvents_index}">
		                    			<div class="uk-modal-dialog">
										    <form method="post" action="<@ofbizUrl secure="true">createDisscussProjCommunicationEvent?detailId=comm</@ofbizUrl>" name="CreateTopicEvent_${communicationEvents.communicationEventId}" class="border" onsubmit="return checkIP1();">
										      	<div class="uk-modal-header">
										        	<h3 class="uk-modal-title">${uiLabelMap.PartyReply}${nickNamechildFrom}</h3>
										      	</div>
										      	<div class="modal-body">
										        <#if userPartyId??>
												<!--回复提交的表单-->
												<input name="action" type="hidden"/>
												  	<input name="my" type="hidden"/>
												  	<input name="messageId" type="hidden"/>
												  	<input name="productId" value="${product.productId}" type="hidden"/>
												  	<input name="parentCommEventId" value="${communicationEvents.communicationEventId}" type="hidden"/>
												  	<input name="communicationEventTypeId" value="PRODUCT_DISSCUSS" type="hidden"/>
												  	<input name="statusId" value="COM_COMPLETE" type="hidden"/>
												  	<input name="partyIdFrom" value="${userPartyId}" type="hidden"/>
												  	<input name="partyIdTo" value="${childEvents.partyIdFrom}" type="hidden"/>
												  	<input name="contactMechTypeId" type="hidden"/>
												  	<input name="contactMechIdFrom" autocomplete="off" type="hidden"/>
												  	<input name="contactMechIdTo" autocomplete="off" type="hidden"/>
												  	<input name="roleTypeIdFrom" value="_NA_" type="hidden"/>
												  	<input name="roleTypeIdTo" value="_NA_" type="hidden"/>
												  	<input name="contactListId" type="hidden"/>
												  	<input name="datetimeStarted" type="hidden"/>
												  	<input name="datetimeEnded" type="hidden"/>
												  	<input name="reasonEnumId" type="hidden"/>
												  	<input name="contentMimeTypeId" value="text/plain" type="hidden"/>
												  	<input name="note" type="hidden" value="${childEvents.communicationEventId}"/>
												  	<input name="subject" type="hidden" value="${uiLabelMap.Project}[${product.productName!}]${uiLabelMap.OfDissuiss}"/>
												<!-- Field 2 -->
												<div class="input-email form-group wrapper-full">
													<textarea required="required" id="url2" name="content" class="md-input md-input-full" placeholder="${uiLabelMap.PartyReply}${nickNamechildFrom}" rows="4" ></textarea>
												</div>
												<#else>
												  	<h5 class="uppercase text-center space30">${uiLabelMap.EcommerceLoggedToPost}</h5>
												</#if>
										      	</div>
										      	<div class="uk-modal-footer uk-text-right">
										        	<button type="button" class="btn btn-default" data-dismiss="modal">${uiLabelMap.CommonClose}</button>
										        	<button type="submit" class="btn btn-primary">${uiLabelMap.EcommerceBlogPostedOn}<i class="uni-paper-plane"></i></button>
										      	</div>
									      	</form>
										</div><!-- /.modal-dialog -->
									</div><!-- /.modal -->
		                            <div class="uk-comment-body">
		                                <p>${childEvents.content!}</p>
		                            </div>
		                        </article>
		                    </li>
						</#if>
						<#assign colChildevents = colChildevents + 1>
					</#list>
					</ul>
				</li>
			</#if>
			<#assign colcommunicationEvents= colcommunicationEvents + 1>
		</#list>
	</ul>
</div>
</div>
</div>
<!-- Talkarea _han -->