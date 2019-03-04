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
	<li><a href="<@ofbizUrl>messagePriLetterListReceive</@ofbizUrl>">${uiLabelMap.CommunicationEventReceive}<#if NoCol = 0><#else><span class="col">(${NoCol})</span></#if></a></li>
	<li class="uk-active"><a href="<@ofbizUrl>messagePriLetterListSend</@ofbizUrl>">${uiLabelMap.CommunicationEventSend}</a></li>
</ul>
<div class="md-card-list-wrapper" id="mailbox">
    <div class="uk-width-large-8-10 uk-container-center">
    	<div class="md-card-list">
		<ul class="hierarchical_slide">
			<#assign colcommunicationEvents=0>
			<#list CommunicationEventAndRoleSend as CommunicationEventAndRoleSend>
				<#if CommunicationEventAndRoleSend.partyIdTo??>
					<#list Person as Person>
						<#if Person.partyId = CommunicationEventAndRoleSend.partyIdTo>
							<#assign nickName = Person.nickname!/>
							<#assign personLogoUrl = "/images/winfirms/user.png">
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
							<#assign nickName = CommunicationEventAndRoleSend.partyIdTo!/>
						</#if>
					</#list>
				</#if>
				<#list CommunicationEventAndProduct as CommunicationEventAndProduct>
					<#if CommunicationEventAndProduct.communicationEventId = CommunicationEventAndRoleSend.communicationEventId>
						<#assign productId = CommunicationEventAndProduct.productId>
						<#assign productUrl = "/products/p_${CommunicationEventAndProduct.productId}?detailId=discuss">
						<#list Product as Product>
							<#if Product.productId = CommunicationEventAndProduct.productId>
								<#assign productName = Product.productName!>
							</#if>
						</#list>
					</#if>
				</#list>
				<#if CommunicationEventAndRoleSend.parentCommEventId?has_content>
					<#assign parentCommEventId = CommunicationEventAndRoleSend.parentCommEventId>
				<#else>
					<#assign parentCommEventId = CommunicationEventAndRoleSend.communicationEventId>
				</#if>
				<li>
					<span class="md-card-list-item-date">${CommunicationEventAndRoleSend.entryDate?substring(0,16)!}</span>
					<div class="md-card-list-item-sender">
	                    <span>
	                    	To&nbsp;:&nbsp;${nickName}
	                		<#list CommunicationEventAndRole as CommunicationEventAndRole>
								<#if CommunicationEventAndRole.communicationEventId = CommunicationEventAndRoleSend.communicationEventId>
									<#assign sendStatus = CommunicationEventAndRole.roleStatusId>
								</#if>
							</#list>
	                		<#if sendStatus?? && sendStatus = "COM_ROLE_CREATED">
								<span class="uk-badge uk-badge-warning">${uiLabelMap.MySendNoRead}</span>
							<#else>
								<span class="uk-badge uk-badge-success">${uiLabelMap.MySendRead}</span>
							</#if>
	                    </span>
	                </div>
	                <div class="md-card-list-item-subject">
	                    <div class="md-card-list-item-sender-small">
	                        <span>${nickName}</span>
	                    </div>
	                    <span>
	                    	<#if productUrl??><span class="product-categories">${uiLabelMap.MessageFrom}&nbsp;:&nbsp;<a href="${productUrl}" target="_blank">${productName!}</a></span></#if>
	                	</span>
	                </div>
	                <div class="md-card-list-item-content-wrapper wrapper-full">
	                    <div class="md-card-list-item-content">
	                    	<#if CommunicationEventAndRoleSend.parentCommEventId??>
								<#if CommunicationEventAndRoleSend.note?has_content>
									<#list CommunicationEventAndRoleReplyLast as CommunicationEventAndRoleReplyLast>
										<#if CommunicationEventAndRoleSend.note = CommunicationEventAndRoleReplyLast.communicationEventId>
										<blockquote>
											<p>${CommunicationEventAndRoleReplyLast.content!}</p>
										</blockquote>
										</#if>
									</#list>
								</#if>
							</#if>
	                        <p>${CommunicationEventAndRoleSend.content!}</p>
	                   </div>
	               </div>
				</li>
				<#assign colcommunicationEvents=colcommunicationEvents+1>
				</#list>
			</ul>
		</div>
	</div>
</div>
