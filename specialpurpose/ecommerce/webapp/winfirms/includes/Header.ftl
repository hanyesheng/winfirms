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
<#if (requestAttributes.externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>
<#if (externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>

<#assign NoCol = CommunicationEventAndRoleNoreadall?size>
<#if userLoginContentId?has_content>
	<#assign userLoginLogoUrl = "/content/control/stream?contentId=${userLoginContentId}"! />
<#else>	
	<#assign userLoginLogoUrl = "/images/winfirms/user.png">
</#if>
	<div id="top-bar" class="hidden-xs hidden-sm">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="top-bar-content">
						<p>${uiLabelMap.CommonContactUs}<span></span><i class="icon-mobile2"></i>${uiLabelMap.CommonTelephoneAbbr} -  (028) 87897886 <span></span>&bull;<span></span> <i class="icon-mail3"></i> ${uiLabelMap.Email} - <a href="#">winfirms@qq.com</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<header id="header-main">
		<div class="container">
			<div class="navbar yamm navbar-default">
				<div class="navbar-header">
					<button type="button" data-toggle="collapse" data-target="#navbar-collapse-1" class="navbar-toggle">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a href="/control/main" style="margin-top: 4px;" class="navbar-brand"><img src="/images/winfirms/logo.png" width="40" alt=""/></a>
				</div>
				<!-- end navbar-header -->
				<#assign shoppingCart = sessionAttributes.shoppingCart!>
				<div class="header-x pull-right">
					<div class="s-cart">
						<div class="sc-trigger"><i class="icon-bag"></i><span>${shoppingCart.getTotalQuantity()}</span></div>
						<div class="cart-info">
							${screens.render("component://ecommerce/widget/winfirms/BusinessScreens.xml#minicart")}
						</div>
					</div>
					<!-- SEARCH -->
					<div class="s-cart">
						<div class="ss-trigger"><a data-toggle="modal" data-target=".search" style="color: #363636;"><i class="icon-search2"></i></a></div>
						<!-- 点击回复弹出的小框 -->
						<div class="modal fade search">
						  <div class="modal-dialog">
						    <div class="modal-content">
					    	 	<#assign currentCatalogId =
									    Static["org.apache.ofbiz.product.catalog.CatalogWorker"].getCurrentCatalogId(request)/>
								<form id="advtokeywordsearchform" method="post" action="<@ofbizUrl secure="true">keywordsearch</@ofbizUrl>">
							    <div class="modal-header">
						        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">${uiLabelMap.Close}</span></button>
						        	<h4 class="modal-title text-center">${uiLabelMap.CommonSearch}</h4>
						      	</div>
						      	<div class="modal-body">
								    <input type="hidden" name="VIEW_SIZE" value="20"/>
								    <input type="hidden" name="PAGING" value="Y"/>
								    <input type="hidden" name="SEARCH_CATALOG_ID" value="${currentCatalogId}"/>
								    <input type="hidden" name="SEARCH_OPERATOR" id="SEARCH_OPERATOR_ANY" value="OR">
								    <input name="SEARCH_SUB_CATEGORIES" value="Y" type="hidden">
						      	    <div class="input-group">  
							         	<span class="input-group-btn">  
							              	<select class="btn btn-default" name="SEARCH_CATEGORY_ID" id="schema" style="padding: 13px 20px;">  
							                   	<option value="">${uiLabelMap.CommonAll}</option>  
							              		<option value="10003">${uiLabelMap.Project}</option>  
							              		<option value="10004">${uiLabelMap.Party}</option>  
							              		<option value="10002">${uiLabelMap.News}</option>  
							              		<option value="10001">${uiLabelMap.Course}</option>  
							              	</select>  
							         	</span>  
							         	<input type="text" class="form-control" placeholder="${uiLabelMap.Textyourcontent}" name="SEARCH_STRING" id="SEARCH_STRING"  value="${requestParameters.SEARCH_STRING?if_exists}">  
						      	    </div>  
					      		</div>
					      		<div class="modal-footer">
					        		<button type="submit" class="btn btn-default btn-center"><i class="icon-search2"></i></button>
					      		</div>
					      		</form>
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
						</div><!-- /.modal -->
					</div>
				</div>
				<div id="navbar-collapse-1" class="navbar-collapse collapse navbar-right">
					<ul class="nav navbar-nav">
						<#list ProductCategoryRollupAndChildOne as ProductCategoryRollupAndChildOne>
							<#list ProductCategoryRollupAndChildTwo as ProductCategoryRollupAndChildTwo>
								<#if (ProductCategoryRollupAndChildOne.productCategoryId = ProductCategoryRollupAndChildTwo.parentProductCategoryId)>
									<#assign OneLevel = 1>
								</#if>
							</#list>
							<li class="dropdown">
								<#if OneLevel??>
									<a href="#" data-toggle="dropdown" class="dropdown-toggle">
										${ProductCategoryRollupAndChildOne.categoryName}
										<div class="arrow-up"><i class="fa fa-angle-down"></i></div>
									</a>
								<#else>	
									<a <#if parameters.productCategoryId?? && parameters.productCategoryId = ProductCategoryRollupAndChildOne.productCategoryId>class="selected"</#if> href="/products/${ProductCategoryRollupAndChildOne.productCategoryId}" >
										${ProductCategoryRollupAndChildOne.categoryName}
									</a>
								</#if>
								<#if OneLevel??>
								<ul class="dropdown-menu"  role="menu">
									<#list ProductCategoryRollupAndChildTwo as ProductCategoryRollupAndChildTwo>
										<#if (ProductCategoryRollupAndChildOne.productCategoryId = ProductCategoryRollupAndChildTwo.parentProductCategoryId)>
										<li><a <#if parameters.productCategoryId?? && parameters.productCategoryId = ProductCategoryRollupAndChildTwo.productCategoryId>class="selected"</#if> href="/products/${ProductCategoryRollupAndChildTwo.productCategoryId}">${ProductCategoryRollupAndChildTwo.categoryName}</a></li>									
										</#if>
									</#list>
								</ul>
								</#if>
							</li>
						</#list>
						<#if userLogin?has_content && userLogin.userLoginId != "anonymous">
							<#list Person as Person><#assign userloginNickname = Person.nickname!></#list>
		      				<li class="universityplan">
		      					<a href="#" data-toggle="dropdown" class="dropdown-toggle">
		      						<img class="createrLogoUrl img-responsive rounded" src="${userLoginLogoUrl}">
		      					</a>
		      					<ul class="dropdown-menu"  role="menu">
									<li><a href="#">${uiLabelMap.CommonWelcome}&nbsp;${userloginNickname!}</a></li>									
									<li><a class="sc-trigger" href="<@ofbizUrl>viewprofile</@ofbizUrl>">${uiLabelMap.FireManager}<#if NoCol = 0><#else><span>${NoCol}</span></#if></a></li>	
	      							<li><a href="<@ofbizUrl>autoLogout</@ofbizUrl>">${uiLabelMap.CommonLogout}</a></li>
								</ul>
		      				</li>
	    				<#else>
							<li><a href="<@ofbizUrl>checkLogin</@ofbizUrl>">${uiLabelMap.CommonLogin}</a></li>
		      				<li><a href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.EcommerceRegister}</a></li>
	      				</#if>
					</ul>
				</div>
			</div>
		</div>
	</header>
