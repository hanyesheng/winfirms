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

<div class="container space30 project-comm">
<div class="tab-content">
<div class="tab-pane active">
	<#if partyId??>
		<h3 class="uppercase text-center space50">${uiLabelMap.CommArea}</h3><!-- 必须登录才能留言 -->
		<!-- Comments -->
		<ul class="comment-list">
			<#assign colcommunicationEvents=0>
			<#list disscussCommunicationEvents as communicationEvents>
				<#if !communicationEvents.parentCommEventId?has_content>
					<#list commPersonList as commPersonList>
						<#if commPersonList.partyId = communicationEvents.partyIdFrom>
							<#assign nickName = commPersonList.nickname!/>
							<#assign personLogoUrl = "/images/winfirms/headdefault.png">
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
					<div class="commparent">
					<li>
						<a class="pull-left" href="#"><img class="comment-avatar" src="${personLogoUrl}" alt="" width="50" height="50"></a>
						<div class="comment-meta">
							<span class="replycomm">${nickName}</span>
							<span><em>${communicationEvents.entryDate.toString().substring(0,19)!}</em></span>
							<a data-toggle="modal" data-target=".parent_${colcommunicationEvents}"  href="#" class="replycomm">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-comment"></i>&nbsp;${uiLabelMap.PartyReply}</a>						
							<!-- 点击回复弹出的小框 -->
							<div class="modal fade parent_${colcommunicationEvents}">
							  <div class="modal-dialog">
							    <div class="modal-content">
							    <form method="post" action="<@ofbizUrl secure="true">createDisscussProjCommunicationEvent?detailId=comm</@ofbizUrl>" name="CreateTopicEvent_${communicationEvents.communicationEventId}" class="border" onsubmit="return checkIP1();">
							      	<div class="modal-header">
							        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">${uiLabelMap.Close}</span></button>
							        	<h4 class="modal-title">${uiLabelMap.PartyReply}${nickName}</h4>
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
										  	<input name="subject" type="hidden" value="${uiLabelMap.Project}[${productContentWrapper.get("PRODUCT_NAME", "html")!}]${uiLabelMap.OfDissuiss}"/>
										<!-- Field 2 -->
										<div class="input-email form-group">
											<textarea id="url1" name="content" class="textarea-message form-control" placeholder="${uiLabelMap.PartyReply}${nickName}" rows="4" ></textarea>
										</div>
									<#else>
									  	<h5 class="uppercase text-center space30">${uiLabelMap.EcommerceLoggedToPost}</h5>
									</#if>
							      	</div>
							      	<div class="modal-footer">
							        	<button type="button" class="btn btn-default" data-dismiss="modal">${uiLabelMap.Close}</button>
							        	<button type="submit" class="btn btn-primary">${uiLabelMap.EcommerceBlogPostedOn}<i class="uni-paper-plane"></i></button>
							      	</div>
							      </form>
							    </div><!-- /.modal-content -->
							  </div><!-- /.modal-dialog -->
							</div><!-- /.modal -->
							<p>${communicationEvents.content!}</p>
						</div>
					</li>
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
							<li class="childcomm">
								<div class="comment-meta">
									<span class="replycomm">${nickNamechildFrom!}</span>&nbsp;&nbsp;${uiLabelMap.PartyReply}&nbsp;<span class="replycomm">${nickNamechildTo!}</span>
									<span><em>${childEvents.entryDate.toString().substring(0,19)!}</em></span>
									<a data-toggle="modal" data-target=".${colChildevents}"  href="#" class="replycomm">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-comment"></i>&nbsp;${uiLabelMap.PartyReply}${nickNamechildFrom!}</a>								
									<div class="modal fade ${colChildevents}">
									  	<div class="modal-dialog">
										    <div class="modal-content">
										    <form method="post" action="<@ofbizUrl secure="true">createDisscussProjCommunicationEvent?detailId=comm</@ofbizUrl>" name="CreateTopicEvent_${communicationEvents.communicationEventId}" class="border" onsubmit="return checkIP1();">
										      	<div class="modal-header">
										        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">${uiLabelMap.Close}</span></button>
										        	<h4 class="modal-title">${uiLabelMap.PartyReply}${nickNamechildFrom}</h4>
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
												  	<input name="subject" type="hidden" value="${uiLabelMap.Project}[${productContentWrapper.get("PRODUCT_NAME", "html")!}]${uiLabelMap.OfDissuiss}"/>
												<!-- Field 2 -->
												<div class="input-email form-group">
													<textarea id="url2" name="content" class="textarea-message form-control" placeholder="${uiLabelMap.PartyReply}${nickNamechildFrom}" rows="4" ></textarea>
												</div>
												<#else>
												  	<h5 class="uppercase text-center space30">${uiLabelMap.EcommerceLoggedToPost}</h5>
												</#if>
										      	</div>
										      	<div class="modal-footer">
										        	<button type="button" class="btn btn-default" data-dismiss="modal">${uiLabelMap.Close}</button>
										        	<button type="submit" class="btn btn-primary">${uiLabelMap.EcommerceBlogPostedOn}<i class="uni-paper-plane"></i></button>
										      	</div>
										      	</form>
										    </div><!-- /.modal-content -->
										</div><!-- /.modal-dialog -->
									</div><!-- /.modal -->
									<p>${childEvents.content!}</p>
								</div>
							</li>
						</#if>
						<#assign colChildevents = colChildevents + 1>
					</#list>
					</div>
				</#if>
			<#assign colcommunicationEvents= colcommunicationEvents + 1>
			</#list>
		</ul><!-- Comments Full -->
		<!-- comment -->
		<#if userPartyId??>
			<!-- Post Comment Form -->
			<h3 class="uppercase text-center space30">${uiLabelMap.StartDiscuss} : </h3>
			<!--发起评论时提交的表单-->
			<form class="form" method="post" action="<@ofbizUrl secure="true">createDisscussProjCommunicationEvent?detailId=comm</@ofbizUrl>" name="CreateTopicEvent">
				<input name="action" type="hidden"/>
			  	<input name="my" type="hidden"/>
			  	<input name="messageId" type="hidden"/>
			  	<input name="productId" value="${product.productId}" type="hidden"/>
			  	<input name="parentCommEventId" value="" type="hidden"/>
			  	<input name="communicationEventTypeId" value="PRODUCT_DISSCUSS" type="hidden"/>
			  	<input name="statusId" value="COM_COMPLETE" type="hidden"/>
			  	<input name="partyIdFrom" value="${userPartyId}" type="hidden"/>
			  	<input name="partyIdTo" value="${partyId}" type="hidden"/>
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
			  	<input name="note" type="hidden"/>
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
							<input type="hidden" class="form-control" name="subject" id="exampleInputName" require="" value="${uiLabelMap.Project}[${productContentWrapper.get("PRODUCT_NAME", "html")!}]${uiLabelMap.OfDissuiss}"/>
						</div>
						<div class="form-group textarea-message ">
							<textarea name="content" class="textarea-message form-control" placeholder="${uiLabelMap.CommonContent}" rows="8" id="url3"></textarea>
						</div>
						<button type="submit" class="button btn-border btn-lg btn-radius btn-center">${uiLabelMap.EcommerceBlogPostedOn}</button>
					</div><!-- Column -->
				</div><!-- Row -->
			</form><!-- Post Comment Form -->
		<#else>
		  	<h3 class="uppercase text-center space30">${uiLabelMap.EcommerceLoggedToPost}</h3><!-- 必须登录才能留言 -->
		</#if>
	<#else>
	  	 
	</#if>
</div>
</div>
</div>
<!-- Talkarea _han -->