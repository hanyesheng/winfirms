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
    <#list PersonList as PersonList>
		<#assign partyName = PersonList.nickname! />
	</#list>
    <#-- end variable setup -->
    <#assign productInfoLinkId = "productInfoLink">
    <#assign productInfoLinkId = productInfoLinkId + product.productId/>
    <#assign productDetailId = "productDetailId"/>
    <#assign productDetailId = productDetailId + product.productId/>
    <article class="blogpost bm-item isotope-item course-item">
		<div class="staff-img">
			<img src="${largeImageUrl}" class="img-responsive" alt="" style="width: 100%;">
			<div class="coursetag">
				<#list ProductTag as ProductTag>
					<span class="label">${ProductTag.keyword!}</span>
				</#list>
			</div>
		</div>
		<h3 class="product-title text-center"><a href="/products/p_${product.productId}">${productContentWrapper.get("PRODUCT_NAME", "html")!}</a></h3>
		<div class="space10">
			<div class="post-meta text-center">
				<span><i class="icon-user"></i> ${partyName!}</span>
			</div>
		</div>
		<div class="text-center">
			<p>${productContentWrapper.get("DESCRIPTION", "html")!}</p>
		</div>
	</article>
<#else>
&nbsp;${uiLabelMap.ProductErrorProductNotFound}.<br />
</#if>
