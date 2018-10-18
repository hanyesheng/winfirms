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
<tr class="product">
<#if product??>
	<#assign smallImageUrl = productContentWrapper.get("SMALL_IMAGE_URL", "url")!>
    <#assign largeImageUrl = productContentWrapper.get("LARGE_IMAGE_URL", "url")!>
    <#if !smallImageUrl?string?has_content><#assign smallImageUrl = "/images/defaultImage.jpg"></#if>
    <#if !largeImageUrl?string?has_content><#assign largeImageUrl = "/images/defaultImage.jpg"></#if>
	<#if incubatorContentId?has_content>
		<#assign incubatorLogoUrl = "/content/control/stream?contentId=${incubatorContentId}"! />
	<#else>	
		<#assign incubatorLogoUrl = "/images/winfirms/headdefault.png">
	</#if>
	<td align="center">
	<img src="<@ofbizContentUrl>${product.largeImageUrl!}</@ofbizContentUrl>" class="img-responsive" alt="">
	</td>
	<td><a href="/products/p_${product.productId}">${product.productName!}</a></td>
	<td>${product.description!}</td>
	<td><#if CityFeature?has_content><#list CityFeature as CityFeature><span class="label label-primary">${CityFeature.description}</span></#list><#else>----</#if></td>
	<td>
		<#list ProductTag as ProductTag>
			<span class="label label-info">${ProductTag.keyword!}</span>
		</#list>
	</td>
<#else>
	<td colspan="5">${uiLabelMap.ProductErrorProductNotFound}.</td>
</#if>
</tr>