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
	<li class="uk-active"><a href="<@ofbizUrl>messageApplyListSend</@ofbizUrl>">${uiLabelMap.CommunicationEventSend}</a></li>
	<li><a href="<@ofbizUrl>messageApplyListReceive</@ofbizUrl>">${uiLabelMap.CommunicationEventReceive}<#if NoCol = 0><#else><span class="col">(${NoCol})</span></#if></a></li>
</ul>
<div class="md-card-list-wrapper" id="mailbox">
    <div class="uk-width-large-8-10 uk-container-center">
    	<div class="md-card-list">
		<ul class="hierarchical_slide">
			<#assign colcommunicationEvents=0>
			<#list CommunicationEventAndRoleSend as CommunicationEventAndRoleSend>
				<#assign itemCol = 0>
				<#if CommunicationEventAndRoleSend.partyIdTo??>
					<#list Person as Person>
						<#if Person.partyId = CommunicationEventAndRoleSend.partyIdTo>
							<#assign nickName = Person.nickname!/>
							<#list PartyContent?sort_by('fromDate') as PartyContent>
								<#if PartyContent.partyId = Person.partyId>
									<#assign personContentId = PartyContent.contentId!/>
									<#if personContentId?has_content>
										<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
									<#else>
										<#assign personLogoUrl = "/images/winfirms/headdefault.png">
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
						<#assign productUrl = "/products/p_${CommunicationEventAndProduct.productId}">
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
				<#list ProductAndRole as ProductAndRole>
					<#if (ProductAndRole.productId = productId) && (ProductAndRole.partyId = CommunicationEventAndRoleSend.partyIdFrom)>
						<#assign itemCol = 1>
					</#if>
				</#list>
				<#if itemCol = 1>
					<#else>
					<#if CommunicationEventAndRoleSend.statusId = "COM_CANCELLED">
						<#assign itemCol = 2>
					</#if>
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
	                        <span>To&nbsp;:&nbsp;${nickName}</span>
	                    </div>
	                    <span>
	                    	<#if productUrl??><span class="product-categories">${uiLabelMap.MessageFrom}&nbsp;:&nbsp;<a href="${productUrl}" target="_blank">${productName!}</a></span></#if>
	                    	<#if itemCol = 0><span class="uk-badge uk-badge-warning">${uiLabelMap.ApplyWaiting}</span></#if>
							<#if itemCol = 1><span class="uk-badge uk-badge-success">${uiLabelMap.ApplyResolved}</span></#if>
							<#if itemCol = 2><span class="uk-badge uk-badge-danger">${uiLabelMap.ApplyCancelled}</span></#if>
	                    </span>
	                </div>
	                <div class="md-card-list-item-content-wrapper wrapper-full">
	                    <div class="md-card-list-item-content">
	                        <p>
							${uiLabelMap.Applyinfo}&nbsp;:&nbsp;${CommunicationEventAndRoleSend.content!}
							</p>
							<#if CommunicationEventAndRoleSend.note?has_content>
							<p>
								${uiLabelMap.NoteContact?substring(0,48)!}&nbsp;:&nbsp;${CommunicationEventAndRoleSend.note!}
							</p>
							</#if>
	                   </div>
                   </div>
	            </li>
				<#assign colcommunicationEvents=colcommunicationEvents+1>
			</#list>
		</ul>
	</div>
	</div>
</div>
