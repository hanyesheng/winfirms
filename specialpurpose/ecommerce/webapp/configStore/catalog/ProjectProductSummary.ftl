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

<#if product??>
    <#-- variable setup -->
    <#if requestAttributes.productCategoryMember??>
        <#assign prodCatMem = requestAttributes.productCategoryMember>
    </#if>
    <#assign smallImageUrl = productContentWrapper.get("SMALL_IMAGE_URL", "url")!>
    <#assign largeImageUrl = productContentWrapper.get("LARGE_IMAGE_URL", "url")!>
    <#if !smallImageUrl?string?has_content><#assign smallImageUrl = "/images/defaultImage.jpg"></#if>
    <#if !largeImageUrl?string?has_content><#assign largeImageUrl = "/images/defaultImage.jpg"></#if>
    <#-- end variable setup -->
    <#assign productInfoLinkId = "productInfoLink">
    <#assign productInfoLinkId = productInfoLinkId + product.productId/>
    <#assign productDetailId = "productDetailId"/>
    <#assign productDetailId = productDetailId + product.productId/>
    <#list ProductContentAndInfo as ProductContentAndInfo>
		<#assign rrcruitCol = 1>
    </#list>
    <#list PersonList as PersonList>
		<#assign partyName = PersonList.nickname! />
	</#list>
	<#list ProductAndRole as ProductAndRole>
		<#if ProductAndRole.productId = product.productId>
			<#list PartyGroup as PartyGroup>
				<#if ProductAndRole.partyId?? && ProductAndRole.partyId = PartyGroup.partyId>
					<#assign ParentName = PartyGroup.groupName!>
				</#if>
			</#list>
		</#if>
	</#list>
	
	<#list PartyGroup as PartyGroup>
		<#if OrganizerPartyId?? && OrganizerPartyId = PartyGroup.partyId>
			<#assign partyName = PartyGroup.groupName!>
		</#if>
	</#list>
	<#if OrganizerPartyId??>
		<#if organizerLogoContentId?has_content>
			<#assign createrLogoUrl = "/content/control/stream?contentId=${organizerLogoContentId}"! />
		<#else>
			<#assign createrLogoUrl = "/images/winfirms/user.png">
		</#if>
	<#else>
		<#if createrLogoContentId?has_content>	
			<#assign createrLogoUrl = "/content/control/stream?contentId=${createrLogoContentId}"! />
		<#else>
			<#assign createrLogoUrl = "/images/winfirms/user.png">
		</#if>
	</#if>
	
    <article class="blogpost bm-item isotope-item">
		<div class="product project">
	    	<#if rrcruitCol??>
	    		<span class="PROJECT label label-success">${uiLabelMap.Recruiting}</span>
	    	</#if>
			<div class="text-center">
				<div class="product-thumbnail">
					<#if product.detailImageUrl?? && product.detailImageUrl?string?has_content>
					<img src="<@ofbizContentUrl>${product.detailImageUrl!}</@ofbizContentUrl>" class="img-responsive" alt="" style="width: 100%;">
					<#else>
					<img src="<@ofbizContentUrl>${largeImageUrl}</@ofbizContentUrl>" class="img-responsive" alt="" style="width: 100%;">
					</#if>
					<span class="createrName">
						<span class="label label-primary">${partyName!}</span>
					</span>
				</div>
				<h3 class="product-title"><img class="createrLogoUrl img-responsive rounded" src="${createrLogoUrl}"><a href="/store/products/p_${product.productId}">${productContentWrapper.get("PRODUCT_NAME", "html")!}</a></h3>
				<p>${productContentWrapper.get("DESCRIPTION", "html")!}</p>
				<div class="text-left">
				<#if ParentName??><span class="label label-primary" style="margin-top: 4px;">From:&nbsp;${ParentName!}</span></#if>
				</div>
				<div class="text-left">
				<#list FieldAboutFeature as FieldAboutFeature><span class="label label-info">${FieldAboutFeature.description}</span></#list>
				<#list FinancingStageFeature as FinancingStageFeature><span class="label label-info">${FinancingStageFeature.description}</span></#list>
				<#list ProductTag as ProductTag>
					<span class="label label-info">${ProductTag.keyword!}</span>
				</#list></div>
			</div>
		</div>
	</article>
<#else>
&nbsp;${uiLabelMap.ProductErrorProductNotFound}.<br />
</#if>
