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
<#assign NoCol = 0>
<#list CommunicationEventAndRoleNoread as CommunicationEventAndRoleNoread>
	<#assign NoCol = NoCol + 1>
</#list>
<ul class="uk-tab">
	<li class="uk-active"><a href="<@ofbizUrl>messagePriLetterListReceive</@ofbizUrl>">${uiLabelMap.CommunicationEventReceive}<#if NoCol = 0><#else><span class="col">(${NoCol})</span></#if></a></li>
	<li><a href="<@ofbizUrl>messagePriLetterListSend</@ofbizUrl>">${uiLabelMap.CommunicationEventSend}</a></li>
</ul>
<div class="md-card-list-wrapper" id="mailbox">
    <div class="uk-width-large-8-10 uk-container-center">
    	<div class="md-card-list">
			<ul class="hierarchical_slide">
			<#assign colcommunicationEvents=0>
			<#list CommunicationEventAndRoleRead as CommunicationEventAndRoleRead>
				<#list Person as Person>
					<#if Person.partyId = CommunicationEventAndRoleRead.partyIdFrom>
						<#assign nickName = Person.nickname!/>
						<#assign personLogoUrl = "/images/winfirms/headdefault.png"!/>
						<#list PartyContent?sort_by('fromDate') as PartyContent>
							<#if PartyContent.partyId = Person.partyId>
								<#assign personContentId = PartyContent.contentId!/>
								<#if personContentId?has_content>
									<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
								</#if>
							</#if>
						</#list>
					</#if>
					<#if !nickName?has_content>
						<#assign nickName = CommunicationEventAndRoleRead.partyIdFrom!/>
					</#if>
				</#list>
				<#list CommunicationEventAndProduct as CommunicationEventAndProduct>
					<#if CommunicationEventAndProduct.communicationEventId = CommunicationEventAndRoleRead.communicationEventId>
						<#assign productId = CommunicationEventAndProduct.productId!>
						<#assign productUrl = "/products/p_${CommunicationEventAndProduct.productId}?detailId=discuss"!>
						<#list Product as Product>
							<#if Product.productId = CommunicationEventAndProduct.productId!>
								<#assign productName = Product.productName!>
							</#if>
						</#list>
					</#if>
				</#list>
				<#if CommunicationEventAndRoleRead.parentCommEventId?has_content>
					<#assign parentCommEventId = CommunicationEventAndRoleRead.parentCommEventId>
				<#else>
					<#assign parentCommEventId = CommunicationEventAndRoleRead.communicationEventId>
				</#if>
				<#if CommunicationEventAndRoleRead.roleStatusId = "COM_ROLE_READ">
				<li>
	                <!--<div class="md-card-list-item-menu" data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
	                    <a href="#" class="md-icon material-icons">&#xE5D4;</a>
	                    <div class="uk-dropdown uk-dropdown-small">
	                        <ul class="uk-nav">
	                            <li><a href="#"><i class="material-icons">&#xE15E;</i> Reply</a></li>
	                            <li><a href="#"><i class="material-icons">&#xE149;</i> Archive</a></li>
	                            <li><a href="#"><i class="material-icons">&#xE872;</i> Delete</a></li>
	                        </ul>
	                    </div>
	                </div>-->
	                <span class="md-card-list-item-date">${CommunicationEventAndRoleRead.entryDate?substring(0,16)!}</span>
	                <div class="md-card-list-item-avatar-wrapper">
	                    <img src="${personLogoUrl}" class="md-card-list-item-avatar" alt="" />
	                </div>
	                <div class="md-card-list-item-sender">
	                    <span>${nickName}</span>
	                </div>
	                <div class="md-card-list-item-subject">
	                    <div class="md-card-list-item-sender-small">
	                        <span>${nickName}</span>
	                    </div>
	                    <span><#if productUrl??><span class="product-categories">${uiLabelMap.MessageFrom}&nbsp;:&nbsp;<a href="${productUrl}" target="_blank">${productName!}</a></span></#if></span>
	                </div>
	                <div class="md-card-list-item-content-wrapper wrapper-full">
	                    <div class="md-card-list-item-content">
	                        <#if CommunicationEventAndRoleRead.note?has_content>
							<#list CommunicationEventAndRoleReplyLast as CommunicationEventAndRoleReplyLast>
								<#if CommunicationEventAndRoleRead.note = CommunicationEventAndRoleReplyLast.communicationEventId>
								<blockquote>
									<p>${uiLabelMap.PartyReply}${uiLabelMap.MyMessageDiscuss}&nbsp;:&nbsp;${CommunicationEventAndRoleReplyLast.content!}</p>
								</blockquote>
								</#if>
							</#list>
							</#if>
	                        <p>${CommunicationEventAndRoleRead.content!}</p>
	                    </div>
	                    <form class="md-card-list-item-reply"  method="post" action="<@ofbizUrl secure="true">createDisscussProjCommunicationEvent</@ofbizUrl>" name="CreateTopicEvent_${CommunicationEventAndRoleRead.communicationEventId}" onsubmit="return checkIP1();">
	                        <!--回复提交的表单-->
							<input name="action" type="hidden"/>
						  	<input name="my" type="hidden"/>
						  	<input name="messageId" type="hidden"/>
						  	<input name="productId" value="${productId!}" type="hidden"/>
						  	<input name="parentCommEventId" value="${parentCommEventId}" type="hidden"/>
						  	<input name="communicationEventTypeId" value="PRIVATE_LETTER" type="hidden"/>
						  	<input name="statusId" value="COM_COMPLETE" type="hidden"/>
						  	<input name="partyIdFrom" value="${partyId}" type="hidden"/>
						  	<input name="partyIdTo" value="${CommunicationEventAndRoleRead.partyIdFrom}" type="hidden"/>
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
						  	<input name="note" type="hidden" value="${CommunicationEventAndRoleRead.communicationEventId}"/>
						  	<input name="subject" type="hidden" value="${CommunicationEventAndRoleRead.subject?default("")!}"/>
	                        <label for="mailbox_reply_768">${uiLabelMap.PartyReply} <span>${nickName}</span></label>
	                        <textarea class="md-input md-input-full" name="content" id="mailbox_reply_768" cols="30" rows="4"></textarea>
	                        <button type="submit" class="md-btn md-btn-flat md-btn-block md-btn-flat-primary">${uiLabelMap.EcommerceBlogPostedOn}</button>
	                    </form>
	                </div>
	            </li>
				</#if>
				<#if CommunicationEventAndRoleRead.roleStatusId = "COM_ROLE_CREATED">
					<li class="md-card-list-item-selected">
						<span class="md-card-list-item-date">${CommunicationEventAndRoleRead.entryDate?substring(0,16)!}</span>
		                <div class="md-card-list-item-avatar-wrapper">
		                    <img src="${personLogoUrl}" class="md-card-list-item-avatar" alt="" />
		                </div>
		                <div class="md-card-list-item-sender">
		                    <span>${nickName}</span>
		                </div>
		                <div class="md-card-list-item-subject">
		                    <div class="md-card-list-item-sender-small">
		                        <span>${nickName}</span>
		                    </div>
		                    <span><#if productUrl??><span class="product-categories">${uiLabelMap.MessageFrom}&nbsp;:&nbsp;<a href="${productUrl}" target="_blank">${productName!}</a></span></#if></span>
		                </div>
						<div class="md-card-list-item-content-wrapper wrapper-full">
		                    <div class="md-card-list-item-content">
		                        <#if CommunicationEventAndRoleRead.note?has_content>
								<#list CommunicationEventAndRoleReplyLast as CommunicationEventAndRoleReplyLast>
									<#if CommunicationEventAndRoleRead.note = CommunicationEventAndRoleReplyLast.communicationEventId>
									<blockquote>
										<p>${uiLabelMap.PartyReply}${uiLabelMap.MyMessageDiscuss}&nbsp;:&nbsp;${CommunicationEventAndRoleReplyLast.content!}</p>
									</blockquote>
									</#if>
								</#list>
								</#if>
		                        <p>${CommunicationEventAndRoleRead.content!}</p>
		                    </div>
		                    <form method="post" action="<@ofbizUrl secure="true">readDisscussMessage</@ofbizUrl>" name="ecomm_read_mess_${colcommunicationEvents}">
					        <input name="communicationEventId" value="${CommunicationEventAndRoleRead.communicationEventId}" type="hidden"/>
					       	</form>
							<a class="md-btn md-btn-flat md-btn-block md-btn-flat-primary" href="javascript:document.ecomm_read_mess_${colcommunicationEvents}.submit()">${uiLabelMap.EcommerceRead}</a>
		                     
	                	</div>
				   	</li>
			    </#if>
				<#assign colcommunicationEvents=colcommunicationEvents+1>
				</#list>
			</ul>
		</div>
	</div>
</div>
