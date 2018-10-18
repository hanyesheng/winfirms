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
<#list RoleTypeAndParty as RoleTypeAndParty>
	<#assign bus = RoleTypeAndParty.roleTypeId>
</#list>
<#list ProdCatalogCategoryList as ProdCatalogCategoryList>
	<#assign AllCategoryId = ProdCatalogCategoryList.productCategoryId>
</#list>
<#list ProductCategory as ProductCategory>
	<#assign ShowCategoryId = ProductCategory.productCategoryId>
</#list>
<#list Person as Person>
	<#assign nickname = Person.nickname!/>
</#list>
<#if bus?? && bus = "BUSINESSMAN">
	<#if ShowCategoryId?has_content>
	<#list ProductCategoryMember as ProductCategoryMember>
		<#if ProductCategoryMember.productCategoryId = ShowCategoryId>
		<#assign EditCol = 1>
		</#if>
	</#list>
	<div class="md-card">
		<#if product?? && product.createdByUserLogin = userLoginId>
		<script language="JavaScript" type="text/javascript">
		    function insertNowTimestamp(field) {
		        eval('document.productForm.' + field + '.value="${nowTimestampString}";');
		    };
		    function insertImageName(type,nameValue) {
		        eval('document.productForm.' + type + 'ImageUrl.value=nameValue;');
		    };
		</script>
		<script type="text/javascript" src="/images/winfirms/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="/images/winfirms/js/xheditor-1.2.2.min.js"></script>
		<script type="text/javascript" src="/images/winfirms/js/xheditor_lang/zh-cn.js"></script>
		<script type="text/javascript" src="<@ofbizContentUrl>/images/winfirms/js/laydate.js</@ofbizContentUrl>"></script>
		<div class="margin-top-30">
			<ul class="nav nav-pills" role="tablist">
			  <li role="presentation"><a href="<@ofbizUrl>profileInitiateseedprojsecond?productId=${productId!}</@ofbizUrl>">${uiLabelMap.ProjectInformation}</a></li>
			  <li role="presentation" class="active"><a href="<@ofbizUrl>profileInitiateseedprojimg?productId=${productId!}</@ofbizUrl>">${uiLabelMap.ProjectPic}</a></li>
			  <li role="presentation"><a href="<@ofbizUrl>profileInitiateseedprojrecruit?productId=${productId!}</@ofbizUrl>">${uiLabelMap.RecruitProject}</a></li>
			</ul>
			<div class="space30"></div>
			<div class="row">
			    <#if fileType?has_content>
			    	<div class="panel panel-success">
						<div class="panel-heading">
							<h6 class="panel-title">${uiLabelMap.ProductResultOfImageUpload}</h3>
						</div>
						<div class="panel-body">
							<#if !(clientFileName?has_content)>
						    <div>${uiLabelMap.ProductNoFileSpecifiedForUpload}.</div>
						    <#else>
						    <div>${uiLabelMap.ProductTheFileOnYourComputer}: <b>${clientFileName!}</b></div>
						    <div>${uiLabelMap.ProductServerFileName}: <b>${fileNameToUse!}</b></div>
						    <div>${uiLabelMap.ProductServerDirectory}: <b>${imageServerPath!}</b></div>
						    <div>${uiLabelMap.ProductTheUrlOfYourUploadedFile}: <b><a href="<@ofbizContentUrl>${imageUrl!}</@ofbizContentUrl>">${imageUrl!}</a></b></div>
						    </#if>
						</div>
					</div>
			    </#if>
			    <div class="col-md-12">
			   	<table class="table table-bordered" cellspacing="0" class="basic-table uk-table">
		        	<thead>
						<tr>
							<td colspan="2" style="text-align: center;">${uiLabelMap.ProjectPic}</td>
						</tr>
					</thead>
					<tbody>
			            <tr>
			                <td>
			                    <div><b>${uiLabelMap.ProductOriginalImage}</b></div>
				    			<#if (product.originalImageUrl)??>
				                    <a href="<@ofbizContentUrl>${product.originalImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Original Image" src="<@ofbizContentUrl>${product.originalImageUrl}</@ofbizContentUrl>" width="100px"/></a>
				    			</#if>
			               </td>
			                <td>
			                    <div class="panel panel-default" style="margin-bottom: 10px;">
								  <div class="panel-body" style="padding: 10px;">
								    ${(product.originalImageUrl)?default('')}
								  </div>
								</div>
			                </td>
			            </tr>
			            <!--<tr>
							<td colspan="2" style="text-align: center;">
								<form method="post" enctype="multipart/form-data" name="imageUploadForm" id="imageCropperUploadForm">
			       			 		<input type="hidden" name="upload_file_type_bogus" value="small"/>
				            	</form>
				                <label class="label quote-info" style="padding-top: 10%;cursor: pointer;">
							      <img class="img-responsive rounded" data-toggle="tooltip" title="${StringUtil.wrapString(uiLabelMap.UploadYourLogo)}" id="avatar" src="<@ofbizContentUrl>${product.originalImageUrl}</@ofbizContentUrl>" alt="avatar">
							      <input type="file" class="sr-only" id="input" name="image" accept="image/*">
							    </label>
							    <div class="progress" style="display: none; margin-bottom: 1rem;">
							      <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
							    </div>
							</td>
						</tr>-->
		            </tbody>
			   	</table>	    
				
			    </div>
			    <div class="col-md-12">
				    <form method="post" enctype="multipart/form-data" action="<@ofbizUrl secure="true">profileUploadProductImageSeed?productId=${productId}&amp;upload_file_type=original</@ofbizUrl>" name="imageUploadForm">
				        <table class="table table-bordered">
				        	<thead>
							<tr>
								<td colspan="2" style="text-align: center;">${uiLabelMap.ProductUploadImage}</td>
							</tr>
							</thead>
				            <input type="hidden" name="upload_file_type_bogus" value="original"/>
				          
				            <tr>
				            	<td>
				                    <input type="file" size="50" name="fname"/>
				                </td>
				                <td>
				                    <input type="submit" class="button btn-small btn-center btn-radius" value="${uiLabelMap.ProductUploadImage}"/>
				                </td>
				            </tr>
				        </table>
				        <span class="tooltip">${uiLabelMap.ProductOriginalImageMessage} : {ofbiz.home}/applications/product/config/ImageProperties.xml&quot;</span>
				    </form>
				    <!--追加图片-->
				    <!--<#if productId?has_content>
					  	<#assign productAdditionalImage1 = productContentWrapper.get("ADDITIONAL_IMAGE_1", "url")! />
					  	<#assign productAdditionalImage2 = productContentWrapper.get("ADDITIONAL_IMAGE_2", "url")! />
					  	<#assign productAdditionalImage3 = productContentWrapper.get("ADDITIONAL_IMAGE_3", "url")! />
					  	<#assign productAdditionalImage4 = productContentWrapper.get("ADDITIONAL_IMAGE_4", "url")! />
					</#if>
					<form id="addAdditionalImagesForm" method="post" action="<@ofbizUrl>profileAddAdditionalImagesForProductSeed?productId=${productId}</@ofbizUrl>" enctype="multipart/form-data">
					  	<input id="additionalImageProductId" type="hidden" name="productId" value="${productId!}" />
					  	<table class="table table-bordered">
						<thead>
							<tr>
								<td colspan="2" style="text-align: center;">${uiLabelMap.ProductAddAdditionalImages}</td>
							</tr>
						</thead>
						<tbody>
						  	<tr>
						<td><a href="javascript:void(0);" swapDetail="<@ofbizContentUrl>${productAdditionalImage1!}</@ofbizContentUrl>"><img src="<@ofbizContentUrl>${productAdditionalImage1!}</@ofbizContentUrl>" width="100px" alt="" /></a></td>
						<td><input id="additionalImageOne" type="file" size="20" name="additionalImageOne" /></td>
						  	</tr>
						  	<tr>
						<td><a href="javascript:void(0);" swapDetail="<@ofbizContentUrl>${productAdditionalImage2!}</@ofbizContentUrl>" ><img src="<@ofbizContentUrl>${productAdditionalImage2!}</@ofbizContentUrl>" width="100px" alt="" /></a></td>
						<td><input type="file" size="20" name="additionalImageTwo" /></td>
						  	</tr>
						  	<tr>
						<td><a href="javascript:void(0);" swapDetail="<@ofbizContentUrl>${productAdditionalImage3!}</@ofbizContentUrl>"><img src="<@ofbizContentUrl>${productAdditionalImage3!}</@ofbizContentUrl>" width="100px" alt="" /></a></td>
						<td><input type="file" size="20" name="additionalImageThree" /></td>
						  	</tr>
						 	<tr>
						<td><a href="javascript:void(0);" swapDetail="<@ofbizContentUrl>${productAdditionalImage4!}</@ofbizContentUrl>"><img src="<@ofbizContentUrl>${productAdditionalImage4!}</@ofbizContentUrl>" width="100px" alt="" /></a></td>
						<td><input type="file" size="20" name="additionalImageFour" /></td>
						  	</tr>
						  	<tr>
						<td colspan="2">
							<div style="text-align: center;">
								<input class="button btn-small btn-center btn-radius" style="display: inline-block;" type="submit" value='${uiLabelMap.CommonUpload}' />
								<a href="<@ofbizUrl>profileInitiateseedprojsecond?productId=${productId}</@ofbizUrl>" style="display: inline-block;" class="button btn-small btn-center btn-radius">${uiLabelMap.RefreshImg}</a>
							</div>
						</td>
						  	</tr>
						</tbody>
					  	</table>
					</form>-->
				</div>
		    </div>
		    <#if !EditCol??>
		    <script type="text/javascript">
		    	function createProject() {
		    	$('#completeModal').modal('show')
				var checkUrl = '<@ofbizUrl>addProductToAll</@ofbizUrl>';
		        var ajaxUrl = '<@ofbizUrl>addProductToAll</@ofbizUrl>';
		        //step-1
		        jQuery.ajax({
		            url: ajaxUrl,
		            type: 'POST',
		            data: {"productCategoryId" : '${AllCategoryId}',"fromDate" : '${nowTimestamp}',"productId" : '${product.productId}'},
		            error: function(msg) {
		                alert("1-pipei-error : " + msg);
		            },
		            success: function() {
	            		var checkUrl = '<@ofbizUrl>addProductToShow</@ofbizUrl>';
		        		var ajaxUrl = '<@ofbizUrl>addProductToShow</@ofbizUrl>';  
				        //step-4
				        jQuery.ajax({
				            url: ajaxUrl,
			            	type: 'POST',
				            data: {"productCategoryId" : '${ShowCategoryId}',"fromDate" : '${nowTimestamp}',"productId" : '${product.productId}'},
				            error: function(msg) {
				                alert("4-finish-error! : " + msg);
				            },
				            success: function(msg) {
			            		setTimeout(function(){ document.getElementById('loadtext').innerHTML='${StringUtil.wrapString(uiLabelMap.createProjectTwo)}' }, 2000);
				            	setTimeout(function(){ document.getElementById('loadtext').innerHTML='${StringUtil.wrapString(uiLabelMap.createProjectThree)}' }, 4000);
				               	setTimeout(function(){ $('#completeModal').modal('hide') }, 6000);
				               	setTimeout(function(){ window.location.href='<@ofbizUrl>viewprofile</@ofbizUrl>'; }, 5000);
				            	}
				        	});
		            	}
		        	});
		     	}
			</script>
		    <div class="alert info"><a href="javascript:void(0);" onclick="javascript:createProject();" class="button btn-border btn-small btn-radius white btn-center">${uiLabelMap.CompleteProjectNext}</a></div>		
			<div id="completeModal" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title">${uiLabelMap.VerifyStatus}(<i class="fa fa-exclamation-triangle orange"></i>${uiLabelMap.NoOperation})</h4>
			      </div>
			      <div class="modal-body">
			        <p id="loadtext">${StringUtil.wrapString(uiLabelMap.createProjectOne)}</p>
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			</#if>
		<#else>
			<div class="space30"></div>
			<blockquote class="style1">
				<p>${uiLabelMap.NoRoleToOperate}</p>
			</blockquote>
			<div class="alert info align-center">
				<div class="row">
					<div class="col-md-12">
						<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.CommonGoBack}</a>
					</div>
				</div>
			</div>
		</#if>
		</div>
	</div>
	<#else/>
	<div class="md-card">
		<div class="panel panel-danger margin-top-100" style="margin-bottom: 100px;">
			<div class="panel-heading">
				<h3 class="panel-title">${uiLabelMap.Reminder}</h3>
			</div>
			<div class="panel-body">
				<p>${uiLabelMap.CannotCreatNow}</p>
			</div>
		</div>
	</div>
	</#if>
<#else>
	<div class="md-card">
		<div class="space30"></div>
		<blockquote class="style1">
			<p>${uiLabelMap.NoRoleToOperate}</p>
		</blockquote>
		<div class="alert info align-center">
			<div class="row">
				<div class="col-md-12">
					<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.CommonGoBack}</a>
				</div>
			</div>
		</div>
	</div>
</#if>