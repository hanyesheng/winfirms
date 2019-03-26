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
	<#if investorsContentId?has_content>
		<#assign investorsLogoUrl = "/content/control/stream?contentId=${investorsContentId}"! />
	<#else>	
		<#assign investorsLogoUrl = "/images/winfirms/user.png">
	</#if>
	<td align="center" style="width: 120px;">
		<img src="${investorsLogoUrl}" class="img-responsive" alt="">
	</td>
	<td><a href="/products/p_${product.productId}" style="white-space: normal;">${product.productName!}</a></td>
	<td>${product.description!}</td>
	<td><#if FieldAboutFeature?has_content><#list FieldAboutFeature as FieldAboutFeature><span class="label label-info">${FieldAboutFeature.description}</span></#list><#else>----</#if></td>
<#else>
	<td colspan="6">${uiLabelMap.ProductErrorProductNotFound}.</td>
</#if>
</tr>