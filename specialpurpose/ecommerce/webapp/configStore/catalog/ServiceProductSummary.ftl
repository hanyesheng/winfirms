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

<script type="text/javascript">
//<![CDATA[
    
    function isVirtual(product) {
        var isVirtual = false;
        <#if virtualJavaScript??>
        for (i = 0; i < VIR.length; i++) {
            if (VIR[i] == product) {
                isVirtual = true;
            }
        }
        </#if>
        return isVirtual;
    }
    function addItem() {
       if (document.addform.add_product_id.value == 'NULL') {
           showErrorAlert("${uiLabelMap.CommonErrorMessage2}","${uiLabelMap.CommonPleaseSelectAllRequiredOptions}");
           return;
       } else {
           if (isVirtual(document.addform.add_product_id.value)) {
               document.location = '<@ofbizUrl>product?category_id=${categoryId!}&amp;product_id=</@ofbizUrl>' + document.addform.add_product_id.value;
               return;
           } else {
               document.addform.submit();
           }
       }
    }

 </script>

<#if product??>
    <#-- variable setup -->
    <#if backendPath?default("N") == "Y">
        <#assign productUrl><@ofbizCatalogUrl productId=product.productId productCategoryId=categoryId/></#assign>
    <#else>
        <#assign productUrl><@ofbizCatalogAltUrl productId=product.productId productCategoryId=categoryId/></#assign>
    </#if>

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
    
    <!-- 产品预览 -->
	<div class="col-md-3">
		<div class="product service">
			<#if product.brandName?has_content><span class="badge red">${product.brandName}</span></#if>
			<div class="text-center">
				<div class="product-thumbnail">
					<a href="/store/products/p_${product.productId}">
						<img src="<@ofbizContentUrl>${contentPathPrefix!}${largeImageUrl}</@ofbizContentUrl>" class="img-responsive" alt=""/>
					</a>
					<#if price.isSale?? && price.isSale>
						<span class="salePrice">${uiLabelMap.OrderOnSale}!</span>
						<#assign priceStyle = "salePrice" />
					<#else>
						<#assign priceStyle = "regularPrice" />
					</#if>
					<#if "Y" = product.isVirtual!>  </#if><span class="product-price"><@ofbizCurrency amount=price.price isoCode=price.currencyUsed /></span>
					<#if product.productTypeId! == "ASSET_USAGE" || product.productTypeId! == "ASSET_USAGE_OUT_IN">
						<#if product.reserv2ndPPPerc?? && product.reserv2ndPPPerc != 0><br /><span class="product-price">${uiLabelMap.ProductReserv2ndPPPerc}<#if !product.reservNthPPPerc?? || product.reservNthPPPerc == 0>${uiLabelMap.CommonUntil} ${product.reservMaxPersons!1}</#if> <@ofbizCurrency amount=product.reserv2ndPPPerc*price.price/100 isoCode=price.currencyUsed /></span></#if>
						<#if product.reservNthPPPerc?? &&product.reservNthPPPerc != 0><br /><span class="product-price">${uiLabelMap.ProductReservNthPPPerc} <#if !product.reserv2ndPPPerc?? || product.reserv2ndPPPerc == 0>${uiLabelMap.ProductReservSecond} <#else> ${uiLabelMap.ProductReservThird} </#if> ${uiLabelMap.CommonUntil} ${product.reservMaxPersons!1}, ${uiLabelMap.ProductEach}: <@ofbizCurrency amount=product.reservNthPPPerc*price.price/100 isoCode=price.currencyUsed /></span></#if>
						<#if (!product.reserv2ndPPPerc?? || product.reserv2ndPPPerc == 0) && (!product.reservNthPPPerc?? || product.reservNthPPPerc == 0)><br />${uiLabelMap.ProductMaximum} ${product.reservMaxPersons!1} ${uiLabelMap.ProductPersons}.</#if>
					</#if>
				</div>
				<h3 class="product-title"><a href="/store/products/p_${product.productId}">${product.productName!}</a></h3>
				<#if productContentWrapper.get("DESCRIPTION", "html")?length lt 40>
					<p style="line-height: 1.3;">${productContentWrapper.get("DESCRIPTION", "html")!}</p>
				<#else>
					<p style="line-height: 1.3;">${productContentWrapper.get("DESCRIPTION", "html")?substring(0,40)!}...</p>
				</#if>
				<div class="text-left">
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


