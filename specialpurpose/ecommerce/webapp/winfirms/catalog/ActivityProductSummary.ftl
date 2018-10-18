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
    <!--变量为默认图片-->
    <#assign largeImageUrl = "/images/defaultImage.jpg">
	<!--如果有大图数据将数据赋给变量-->
    <#if product.largeImageUrl?has_content><#assign largeImageUrl = product.largeImageUrl!></#if>
    <#-- end variable setup -->
    <#assign productInfoLinkId = "productInfoLink">
    <#assign productInfoLinkId = productInfoLinkId + product.productId/>
    <#assign productDetailId = "productDetailId"/>
    <#assign productDetailId = productDetailId + product.productId/>
    <#list ProductContentAndInfo as ProductContentAndInfo>
    	<#if ProductContentAndInfo.productId = product.productId>
    		<#assign rrcruitCol = 1>
    	</#if>
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
    <div class="blogpost bm-item isotope-item">
    	<#if rrcruitCol??>
    		<span class="PROJECT label label-warning">${uiLabelMap.Recruiting}</span>
    	</#if>
		<div class="product project activity">
			<div class="text-center">
				<div class="product-thumbnail">
					<img src="${largeImageUrl}" class="img-responsive" alt="" style="width: 100%;">
					<span class="createrName">
						<#if partyName??><span class="label label-warning">By:&nbsp;${partyName!}</span></#if>
					</span>
				</div>
				<h3 class="product-title"><a href="/products/p_${product.productId}">${productContentWrapper.get("PRODUCT_NAME", "html")!}</a></h3>
				<div class="space10">
					<div class="post-meta">
						<#if product.releaseDate??><span><i class="icon-clock2"></i>&nbsp;${(product.releaseDate?substring(0,10))!}</span></#if>
						
					</div>
				</div>
				<p style="">${productContentWrapper.get("DESCRIPTION", "html")!}</p>
				<div class="text-left">
					<#if ParentName??><span class="label label-primary">From:&nbsp;${ParentName!}</span></#if>
					<#list ProductTag as ProductTag>
						<span class="label label-info">${ProductTag.keyword!}</span>
					</#list>
				</div>
			</div>
		</div>
	</div>
<#else>
&nbsp;${uiLabelMap.ProductErrorProductNotFound}.<br />
</#if>
