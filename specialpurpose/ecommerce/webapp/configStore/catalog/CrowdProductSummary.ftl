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
    
    
    <#assign largeImageUrl = "/images/defaultImage.jpg">
    
    <#if product.largeImageUrl?has_content><#assign largeImageUrl = product.largeImageUrl!/></#if>
    
    <#list PersonList as PersonList>
		<#assign partyName = PersonList.nickname! />
	</#list>
    <#-- end variable setup -->
    <#assign productInfoLinkId = "productInfoLink">
    <#assign productInfoLinkId = productInfoLinkId + product.productId/>
    <#assign productDetailId = "productDetailId"/>
    <#assign productDetailId = productDetailId + product.productId/>
    <article class="blogpost bm-item isotope-item">	
    	<div class="product project activity">
			<div class="text-center">
				<div class="product-thumbnail">
					<img src="${largeImageUrl}" class="img-responsive" alt="" style="width: 100%;">
					<span class="createrName">
						<span class="label label-success">${uiLabelMap.CrowdPrice}:&nbsp;<@ofbizCurrency amount=price.price isoCode=price.currencyUsed /></span>
						<span class="label label-primary" style="color: white;margin-top: 5px;">${uiLabelMap.TargetAmount}:<@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed /></span>
					</span>
				</div>
				<h3 class="product-title"><a href="/products/p_${product.productId}">${productContentWrapper.get("PRODUCT_NAME", "html")!}</a></h3>
				<p style="">${productContentWrapper.get("DESCRIPTION", "html")!}</p>
				<#if price.listPrice??>
					<#assign sumprice = 0 />
					<#if OrderItemAndProduct??>
						<#list OrderItemAndProduct as order>
							<#assign sumprice = sumprice + (order.unitPrice)*(order.quantity) />
						</#list>	
					</#if>
					<#assign sumpercent = sumprice/price.listPrice>
					<#if sumpercent gt 1><#assign sumpercent = 1></#if>
					<#assign sumdata = sumpercent*100>
					<div class="b-progress-bar">
						<div class="progress-label">${sumpercent?string("0.00%")} ${uiLabelMap.Raisedsofar}</div>
						<div class="progress-scale" style="background-color: #e7e5e6;">
							<div style="width:${sumpercent?string("0.00%")}" class="progress-line"></div>
						</div>
					</div>
				</#if>
			</div>
		</div>
	</article>
<#else>
&nbsp;${uiLabelMap.ProductErrorProductNotFound}.<br />
</#if>
