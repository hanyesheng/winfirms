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
    <!--预览图-->
	<#assign largeImageUrl = "/images/defaultImage.jpg">  
    <#if product.largeImageUrl?has_content><#assign largeImageUrl = product.largeImageUrl!/></#if>

    <article class="blogpost bm-item isotope-item course-item" >
		<div class="post-media">
			<a href="/store/products/p_${product.productId}">
				<img src="${largeImageUrl!}" class="img-responsive" alt="" >
			</a>
		</div>
		<p></p>
    	<!--标题-->
		<h2 class="post-title-small"><a href="/store/products/p_${product.productId}">${product.productName!}</a></h2>
		<div class="post-meta">
			<!--发布时间-->
			<span><a><i class="icon-clock2"></i><#list ProductContentAndInfo as ProductContentAndInfo>&nbsp;${ProductContentAndInfo.fromDate?substring(0,10)!}</#list></a></span>
			<!--作者-->
			<span><a><i class="icon-user"></i>&nbsp;${product.brandName!}</a></span>
		</div>
		<p></p>
		<!--描述-->
		<div class="post-excerpt">
			<#list ProductContentAndInfo as ProductContentAndInfo>
				<p>${ProductContentAndInfo.description!}</p>
			</#list>
		</div>
	</article>
<#else>
&nbsp;${uiLabelMap.ProductErrorProductNotFound}.<br />
</#if>
