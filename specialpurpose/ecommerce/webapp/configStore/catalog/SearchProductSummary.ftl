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
    <#list UserLoginList as UserLoginList>
    	<#if UserLoginList.userLoginId = product.createdByUserLogin>
    	<#list PersonList as PersonList>
    		<#if UserLoginList.partyId = PersonList.partyId>
    			<#assign createrName = PersonList.nickname!>
    			<#if createrName??>
	    		<#else>
	    			<#assign createrName = product.createdByUserLogin!>
	    		</#if>
	    	</#if>
    	</#list>
    	</#if>
    </#list>
    <div class="col-md-3 space30">
    	<div class="text-center">
	    	<div class="post-media">
				<img style="width: 100%;" src="<@ofbizContentUrl>${contentPathPrefix!}${largeImageUrl}</@ofbizContentUrl>" class="img-responsive" alt="">
				<div class="donate-meter">
					<span class="white"><i class="icon-user"></i>&nbsp;&nbsp;${createrName!}</span>
				</div>
			</div>
			<div class="space10"></div>
			<h3 class="product-title"><a href="/store/products/p_${product.productId}">${productContentWrapper.get("PRODUCT_NAME", "html")!}</a></h3>
			<span><i class="icon-clock2"></i>&nbsp;&nbsp;${(product.createdDate?substring(0,16))!}</span>
			<p>${productContentWrapper.get("DESCRIPTION", "html")!}</p>
		</div>
	</div>
<#else>
&nbsp;${uiLabelMap.ProductErrorProductNotFound}.<br />
</#if>
