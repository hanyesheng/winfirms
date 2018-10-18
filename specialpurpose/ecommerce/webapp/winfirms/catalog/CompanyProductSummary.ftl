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
	<li class="product">
		<#if product.detailImageUrl?? && product.detailImageUrl?string?has_content>
		<img src="<@ofbizContentUrl>${product.detailImageUrl!}</@ofbizContentUrl>" class="img-responsive" alt="">
		<#else>
		<img src="<@ofbizContentUrl>${contentPathPrefix!}${largeImageUrl}</@ofbizContentUrl>" class="img-responsive" alt="">
		</#if>
		<div class="product-post-info space10">
			<h5>
				<a href="/products/p_${product.productId}">${productContentWrapper.get("PRODUCT_NAME", "html")!}</a>
			</h5>
			<p>${productContentWrapper.get("DESCRIPTION", "html")!}</p>
			<div class="stats1-info">
				<i class="fa fa-money"></i>
				<div class="stats1-info-left">
				<p><span class="count count1"><#if product.brandName??>${product.brandName!}w<#else>----</#if></span></p>
				<h2>${uiLabelMap.RegisteredCapital}</h2>
				</div>
			</div>
			<div class="stats1-info">
				<i class="icon-support"></i>
				<div class="stats1-info-left">
				<p><span class="count count1"><#if product.comments??>${product.comments!}%<#else>----</#if></span></p>
				<h2>${uiLabelMap.EquityTransferAble}</h2></div>
			</div>
			<div class="stats1-info">
				<i class="fa fa-signal"></i>
				<div class="stats1-info-left">
				<p><span class="count count1"><#if FinancingStageFeature?has_content><#list FinancingStageFeature as FinancingStageFeature>${FinancingStageFeature.description}</#list><#else>----</#if></span></p>
				<h2>${uiLabelMap.FinancingStage}</h2></div>
			</div>
			<div class="stats1-info">
				<i class="icon-clock2"></i>
				<div class="stats1-info-left">
				<p><span class="count count1"><#if product.releaseDate??>${(product.releaseDate?substring(0,10))!}<#else>----</#if></span></p>
				<h2>${uiLabelMap.CompanyCreatedDate}</h2></div>
			</div>
		</div>
		<#list FieldAboutFeature as FieldAboutFeature><span class="label label-info">${FieldAboutFeature.description}</span></#list>
		<#list ProductTag as ProductTag>
			<span class="label label-info">${ProductTag.keyword!}</span>
		</#list>
	</li>
<#else>
&nbsp;${uiLabelMap.ProductErrorProductNotFound}.<br />
</#if>
