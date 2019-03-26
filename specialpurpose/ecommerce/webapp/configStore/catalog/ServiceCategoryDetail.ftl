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
<#if productCategory??>
	<#assign categoryImageUrl = "/images/defaultCatgoryBg.jpg" />
	<#if productCategory.categoryImageUrl??>
	    <#assign categoryImageUrl = productCategory.categoryImageUrl />
    </#if>
    <#assign categoryName = productCategory.categoryName!/>
    <#assign categoryDescription = productCategory.description!/>
    <#assign longDescription = productCategory.longDescription!/>
    <#list ProductCategory as ProductCategory>
    	 <#assign categoryParentName = ProductCategory.categoryName!/>
    </#list>
	<div class="page_header space20 project">
		<div class="page_header_parallax4" style="background: url(${categoryImageUrl}) no-repeat fixed center;background-size: cover;">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3><span>${categoryParentName}</span><#if categoryName?has_content>${categoryName} </#if><#if longDescription?has_content><br>${longDescription}</#if></h3>
						<p class="white">${categoryDescription}</p>
					</div>
				</div>
			</div>
		</div>
		<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li><a href="<@ofbizUrl>main</@ofbizUrl>"><i class="fa fa-home"></i>&nbsp;&nbsp;${uiLabelMap.CommonMain}</a></li>
							<li>${categoryName}</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</#if>
<!--?sort_by("sequenceNum")-->
<div id="ajaxload">
	<div id="loadgif" style="position:absolute;left:50%;right:50%;z-index: 10000;padding-top: 4%;display: none;"><img alt="" src="/images/ajax-loader.gif"/></div>

