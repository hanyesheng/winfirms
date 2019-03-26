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
<#assign searchImageUrl = "/images/winfirms/projhead.jpg"/>
<script src="/images/winfirms/js/jquery.js"></script>
<script src="/images/winfirms/js/imagesloaded.pkgd.min.js"></script>
<script src="/images/winfirms/js/masonry.pkgd.min.js"></script>
<div class="page_header space40 markets">
	<div class="page_header_parallax" style="background: url(${searchImageUrl}) no-repeat fixed center;background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="white">${uiLabelMap.PageTitleSearchResults}</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="bcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="bcrumbs">
						<li><a href="/"><i class="fa fa-home"></i>${uiLabelMap.CommonMain}</a></li>
						<li>${uiLabelMap.PageTitleSearchResults}</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<#assign viewIndexMax = Static["java.lang.Math"].ceil((listSize - 1)?double / viewSize?double)>
<div class="container project">
	<div class="row">
		<div class="row">
			<#if !productIds?has_content>
		  		<h2>&nbsp;${uiLabelMap.ProductNoResultsFound}.</h2>		
			</#if>
			<#if productIds?has_content>
				<#if (viewIndexMax?int > 1)>
					<div class="sorter">
						<div class="col-md-5">
						</div>
						<div class="col-md-2">
							<div class="layout-modes">
								<#if (viewIndex?int > 0)>
									<a href="<@ofbizUrl secure="true">keywordsearch/~VIEW_SIZE=${viewSize}/~VIEW_INDEX=${viewIndex?int - 1}/~clearSearch=N</@ofbizUrl>" style="padding: 4px 8px;"><i class="fa fa-arrow-left"></i></a>
								<#else>
									<a style="padding: 4px 8px;color: #aaa;"><i class="fa fa-arrow-left"></i></a>
								</#if>
								<#if (listSize?int > 0)>
						        ${viewIndex+1}&nbsp;/&nbsp;${viewIndexMax}
						        </#if>
						        <#if highIndex?int < listSize?int>
								<a href="<@ofbizUrl secure="true">keywordsearch/~VIEW_SIZE=${viewSize}/~VIEW_INDEX=${viewIndex+1}/~clearSearch=N</@ofbizUrl>" style="padding: 4px 8px;"><i class="fa fa-arrow-right"></i></a>
								<#else>
								<a style="padding: 4px 8px;color: #aaa;"><i class="fa fa-arrow-right"></i></a>
						        </#if>
							</div>
						</div>	
						<div class="col-md-5">
						</div>
					</div>
				</#if>
			</#if>
		</div>
		<#if productIds?has_content>
		<div class="col-md-12 space30">
			<div class="shop-grid" id="container">
	        <#list productIds as productId> <#-- note that there is no boundary range because that is being done before the list is put in the content -->
	            ${setRequestAttribute("optProductId", productId)}
	            ${setRequestAttribute("listIndex", productId_index)}
	            ${screens.render(searchproductsummaryScreen)}
	        </#list>
			</div>
		</div>
		</#if>

		<#if productIds?has_content>
			<div class="row">
				<div class="sorter">
					<div class="col-md-12">
					<#assign viewIndexMax = Static["java.lang.Math"].ceil((listSize - 1)?double / viewSize?double)>
					<#if (viewIndexMax?int > 1)>
						<ul class="shop_pn">
							<#if (viewIndex?int > 0)>
								<li>
									<a href="<@ofbizUrl secure="true">keywordsearch/~VIEW_SIZE=${viewSize}/~VIEW_INDEX=${viewIndex?int - 1}/~clearSearch=N</@ofbizUrl>"  aria-label="Previous">
										<i class="fa fa-angle-left"></i>
									</a>
								</li>
							</#if>
							<#if (viewIndexMax?int > 1)>
		    					<#list 0..viewIndexMax as curViewNum>
								<li><a href="<@ofbizUrl>keywordsearch/~VIEW_SIZE=${viewSize}/~VIEW_INDEX=${curViewNum?int}/~clearSearch=N</@ofbizUrl>" <#if curViewNum = viewIndex>class="active"</#if> >${curViewNum + 1}</a></li>
								<#if (curViewNum +1) = viewIndexMax><#break></#if>
		    					</#list>
							</#if>
							<#if highIndex?int < (listSize?int - 1)>
								<li>
									<a href="<@ofbizUrl secure="true">keywordsearch/~VIEW_SIZE=${viewSize}/~VIEW_INDEX=${viewIndex+1}/~clearSearch=N</@ofbizUrl>" aria-label="Next">
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
<script>
	$(function(){
		// init Masonry
		var $grid = $('#container').masonry({
		  // options 设置选项  
		    itemSelector : '.col-md-3', //子类元素选择器  
		    columnWidth : '.col-md-3' ,//一列的宽度 ，包括边距 220+10+10  
		    isAnimated:false, //使用jquery的布局变化，是否启用动画效果  
		    percentPosition: true,
		    animationOptions:{  
		    //jquery animate属性 ，动画效果选项。比如渐变效果 Object { queue: false, duration: 500 }  
		    },  
		    gutterWidth:15,//列的间隙  
		    isFitWidth:true,//自适应宽度  
		    isResizableL:true,// 是否可调整大小  
		    isRTL:false,//使用从右到左的布局 
		});
		// layout Masonry after each image loads
		$grid.imagesLoaded().progress( function() {
		  $grid.masonry('layout');
		});
	}); 
</script>