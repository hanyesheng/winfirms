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

		<div class="page_header space40">
			<div class="page_header_parallax" style="background-image: url(/images/defaultCatgoryBg.jpg) !important;">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h3 class="title">${productContentWrapper.get("PRODUCT_NAME", "html")!}</h3>
		    				<h6 class="sub-title" style="color: whitesmoke;">${productContentWrapper.get("DESCRIPTION", "html")!}</h6>
						</div>
					</div>
				</div>
			</div>
			<div class="bcrumb-wrap">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<ul class="bcrumbs">
								<li><a href="/market"><i class="fa fa-home"></i>${uiLabelMap.CommonMain}</a></li>
								<li>${productContentWrapper.get("PRODUCT_NAME", "html")!}</li>
							</ul>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="blog-single">
						<article class="blogpost">
							<div class="post-meta">
								<span><a href="#"><i class="icon-clock2"></i><#list ProductContentAndInfo as ProductContentAndInfo>&nbsp;${ProductContentAndInfo.fromDate?substring(0,10)!}</#list></a></span>
								<span><a href="#"><i class="icon-user"></i>&nbsp;${product.brandName!}</a></span>
								<!--<span><i class="icon-archive3"></i> <a href="">Vector</a>, <a href="#">Design</a></span>
								<span><a href="#"><i class="icon-speech-bubble"></i> 13 Comments</a></span>-->
							</div>
							<div class="space10"></div>
							${productContentWrapper.get("LONG_DESCRIPTION", "html")!}	
						</article>
					</div>
				</div>
			</div>
		</div>
<#else>
&nbsp;${uiLabelMap.ProductErrorProductNotFound}.<br />
</#if>
<div class="space30"></div>









    
    
   
	
    

    
    	
  

  
  
  
