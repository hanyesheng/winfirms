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
	<#assign nickName = PersonList.nickname! />
</#list>
<div class="container space30">
<#if sessionAttributes.userLogin?has_content && sessionAttributes.userLogin.userLoginId != "anonymous">
	<#if PartyRole?has_content>
	<div class="tab-content project-tab-content">
		<div class="tab-pane active">
			<div class="row">
				<div class="col-md-12">
					<div class="panel-group" id="accordion-e1">
						<div class="panel panel-default">
						<#assign coldy = 0>
						<#list ProductContentTypeParent as ProductContentTypeParent>
						<div style="padding: 10px;text-align: center;">${ProductContentTypeParent.productContentTypeId}&nbsp;&nbsp;${ProductContentTypeParent.description}</div>
						<#list ProductContentType as ProductContentType>
			            	<#if ProductContentType.parentTypeId?? && ProductContentType.parentTypeId = ProductContentTypeParent.productContentTypeId>
				            <#assign contentId = null!/>
				            <#assign fromDate = null!/>
				            <#assign dataResourceId = null!/>
				            <#list ProductContent as ProductContent>
				            	<#if ProductContent.productContentTypeId = ProductContentType.productContentTypeId>
				            		<#assign contentId = ProductContent.contentId! />
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
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" style="padding: 10px;" data-toggle="collapse" data-parent="#accordion-e1" href="#collapse${coldy}">
									${ProductContentType.productContentTypeId}&nbsp;&nbsp;${ProductContentType.description}
									<span style="top: 11px;" class="fa fa-chevron-down"></span>
									</a>
								</h4>
								<a data-toggle="modal" style="padding: 5px;background-color: white;" data-target=".colcommunicationEvents_${coldy}"  href="#" class="replycomm">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-comment"></i>&nbsp;${uiLabelMap.PlanNote}<span style="font-size: 13px;line-height: 22px;color: #777">[${ProductContentType.description!}]</span></a>						
								<!-- 点击回复弹出的小框 -->
								<div class="modal fade colcommunicationEvents_${coldy}">
								  <div class="modal-dialog">
								    <div class="modal-content">
								    <form method="post" action="<@ofbizUrl secure="true">createDisscussProjCommunicationEvent?detailId=plan</@ofbizUrl>" name="CreateTopicEvent_${coldy}" class="border" onsubmit="return checkIP1();">
								      	<div class="modal-header">
								        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">${uiLabelMap.Close}</span></button>
								        	<h4 class="modal-title">${uiLabelMap.PartyReply}${nickName}--${uiLabelMap.CommonAbout}${ProductContentType.description!}</h4>
								      	</div>
								      	<div class="modal-body">
								        <#if userPartyId??>
										<!--回复提交的表单-->
											<input name="action" type="hidden"/>
										  	<input name="my" type="hidden"/>
										  	<input name="messageId" type="hidden"/>
										  	<input name="parentCommEventId" value="" type="hidden"/>
										  	<input name="communicationEventTypeId" value="PRIVATE_LETTER" type="hidden"/>
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
										  	<input name="subject" value="${ProductContentType.description!}" type="hidden"/>
											<!-- Field 2 -->
											<div class="input-email form-group">
												<textarea required="required" id="url1" name="content" class="textarea-message form-control" placeholder="${uiLabelMap.PartyReply}${nickName}" rows="4" ></textarea>
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
							</div>
							<div id="collapse${coldy}" class="panel-collapse collapse <#if coldy = 0>in</#if>">
								<div class="panel-body">
									<div class="row">
										${StringUtil.wrapString(textData!)}
										<p> </p>
									</div>
								</div>
							</div>
							<#assign coldy = coldy + 1>
							</#if>
						</#list>
						</#list>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<#else>
		<div class="tab-content tab-content project-tab-content"><div class="tab-pane active"><div class="commparent noread" style="height: 600px;padding-top: 50px;">
			${uiLabelMap.YouMustBeInvestor}${uiLabelMap.OnlyCan}${uiLabelMap.Readmore}.
			<br>
			<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="buttontext">${uiLabelMap.Gotoverify}</a>
	   </div></div></div>
	</#if>
<#else>
	<div class="tab-content tab-content project-tab-content"><div class="tab-pane active"><div class="commparent noread" style="height: 600px;padding-top: 50px;">
		${uiLabelMap.OrderYouMust}
        <a href="<@ofbizUrl>checkLogin</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonBeLogged}</a>
        ${uiLabelMap.Readmore}.
    </div></div></div>
</#if>
</div>