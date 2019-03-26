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
<div id="div3">
	<script type="text/javascript">
			(function () {
				$("#loadgif").hide();
				$("#ajaxload").removeClass("overlay");
			});
	    	function callDocumentByPaginate(info) {
			
	        var str = info.split('~');
	        var checkUrl = '/control/investorsCategoryAjaxFired';
	        if(checkUrl.search("http"))
	            var ajaxUrl = '/control/investorsCategoryAjaxFired';
	        else
	            var ajaxUrl = '/control/investorsCategoryAjaxFiredSecure';   
	            $("#loadgif").show(); 
	            $("#ajaxload").addClass("overlay");
	        //jQuerry Ajax Request
	        jQuery.ajax({
	            url: ajaxUrl,
	            type: 'POST',
	            data: {"category_id" : str[0], "VIEW_SIZE" : str[1], "VIEW_INDEX" : str[2]},
	            error: function(msg) {
	                alert("An error occurred loading content! : " + msg);
	            },
	            success: function(msg) {
	                jQuery('#div3').html(msg);
	                $("#loadgif").hide();
					$("#ajaxload").removeClass("overlay");
	            }
	        });
	     }
	</script>
	<#list ProductCategory as ProductCategory>
    	 <#assign categoryParentName = ProductCategory.categoryName!/>
    </#list>
	<div class="container">
		<div class="row">
			<div class="sorter">
				<div class="col-md-10">
						<ol class="breadcrumb" style="background-color: inherit;margin-bottom: 0px;">
							<li>${categoryParentName}&nbsp;&nbsp;:&nbsp;&nbsp;</li>
							<#list ProductCategoryRollupAndChildItem as ProductCategoryRollupAndChildItem>
							<li><a <#if ProductCategoryRollupAndChildItem.productCategoryId = productCategory.productCategoryId>class="active"</#if> href="/store/products/${ProductCategoryRollupAndChildItem.productCategoryId!}">${ProductCategoryRollupAndChildItem.categoryName!}</a></li>
							</#list>
						</ol>
				</div>
				<#-- Pagination -->
				<#if paginateEcommerceStyle??>
					<#assign viewIndexMax = Static["java.lang.Math"].ceil((listSize)?double / viewSize?double)>
					<#if (viewIndexMax?int > 0)>
					<div class="col-md-2">
						<div class="layout-modes">
							<a <#if (viewIndex?int > 0)>href="/store/products/${productCategoryId}?VIEW_SIZE=${viewSize}&VIEW_INDEX=${viewIndex?int - 1}" </#if> style="padding: 4px 8px;"><i class="fa fa-arrow-left"></i></a>
							${viewIndex?int + 1}&nbsp;/&nbsp;${viewIndexMax}
							<a <#if highIndex?int < listSize?int>href="/store/products/${productCategoryId}?VIEW_SIZE=${viewSize}&VIEW_INDEX=${viewIndex?int + 1}" </#if> style="padding: 4px 8px;"><i class="fa fa-arrow-right"></i></a>
						</div>
					</div>
					</#if>
				<#else>
				    <#include "component://common/webcommon/includes/htmlTemplate.ftl"/>
				    <#assign commonUrl = "category?category_id="+ (parameters.category_id!) + "&"/>
				    <#--assign viewIndex = viewIndex - 1/-->
				    <#assign viewIndexFirst = 0/>
		     		<#assign viewIndexPrevious = viewIndex - 1/>
				    <#assign viewIndexNext = viewIndex + 1/>
				    <#assign viewIndexLast = Static["org.ofbiz.base.util.UtilMisc"].getViewLastIndex(listSize, viewSize) />
				    <#assign messageMap = Static["org.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
				    <#assign commonDisplaying = Static["org.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
				    <@nextPrev commonUrl=commonUrl ajaxEnabled=false javaScriptEnabled=false paginateStyle="nav-pager" paginateFirstStyle="nav-first" viewIndex=viewIndex highIndex=highIndex listSize=listSize viewSize=viewSize ajaxFirstUrl="" firstUrl="" paginateFirstLabel="" paginatePreviousStyle="nav-previous" ajaxPreviousUrl="" previousUrl="" paginatePreviousLabel="" pageLabel="" ajaxSelectUrl="" selectUrl="" ajaxSelectSizeUrl="" selectSizeUrl="" commonDisplaying=commonDisplaying paginateNextStyle="nav-next" ajaxNextUrl="" nextUrl="" paginateNextLabel="" paginateLastStyle="nav-last" ajaxLastUrl="" lastUrl="" paginateLastLabel="" paginateViewSizeLabel="" />
				</#if>
				
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 space30 investorsProduct">
				<table class="table table-hover">
					<thead>
						<tr>
							<th colspan="2" class="text-center investorsName">${uiLabelMap.Businessman}</th>
							<th>${uiLabelMap.BriefIntroduction}</th>
							<th>${uiLabelMap.Entrepreneurship}</th>
						</tr>
					</thead>
					<tbody class="investorsProduct">
						<#if productCategoryMembers?has_content>
						    <#list productCategoryMembers as productCategoryMember>
					    	${setRequestAttribute("optProductId", productCategoryMember.productId)}
					        ${setRequestAttribute("productCategoryMember", productCategoryMember)}
					        ${setRequestAttribute("listIndex", productCategoryMember_index)}
					        ${screens.render(businessmanProductsummaryScreen)}
					        </#list>
						<#else>
						    <hr />
						    <div>${uiLabelMap.ProductNoProductsInThisCategory}</div>
						</#if>
					</tbody>
				</table>
			</div>
		</div>
		<#if paginateEcommerceStyle??>
			<#assign viewIndexMax = Static["java.lang.Math"].ceil((listSize)?double / viewSize?double)>
			<div class="row">
				<div class="sorter">
					<div class="col-md-12">
					<#if (viewIndexMax?int > 0)>
						<ul class="shop_pn">
							<#if (viewIndex?int > 0)>
								<li>
									<a href="/store/products/${productCategoryId}?VIEW_SIZE=${viewSize}&VIEW_INDEX=${viewIndex?int - 1}" aria-label="Previous">
										<i class="fa fa-angle-left"></i>
									</a>
								</li>
							</#if>
							<#if (viewIndexMax?int > 1)>
	        					<#list 1..viewIndexMax as curViewNum>
								<li><a href="/store/products/${productCategoryId}?VIEW_SIZE=${viewSize}&VIEW_INDEX=${curViewNum-1?int}" <#if viewIndex + 1 = curViewNum>class="active"</#if> >${curViewNum}</a></li>
								</#list>
	    					</#if>
							<#if highIndex?int < listSize?int>
								<li>
									<a href="/store/products/${productCategoryId}?VIEW_SIZE=${viewSize}&VIEW_INDEX=${viewIndex?int + 1}" aria-label="Next">
										<i class="fa fa-angle-right"></i>
									</a>
								</li>
							</#if>
						</ul>
					</#if>
					</div>
				</div>
			</div>
		</#if>
	</div>
</div>
</div>
