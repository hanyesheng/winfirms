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
<div class="md-card">
	<div class="space30"></div>
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
		<div class="margin-top-30">
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
			    <form action="<@ofbizUrl>subRoleUpdateProductContent</@ofbizUrl>" method="post" style="margin: 0;" name="productForm">
			        <input type="hidden" name="productId" value="${productId!}"/>
			        <table class="table table-bordered" cellspacing="0" class="basic-table uk-table">
			        	<thead>
						<tr>
							<td colspan="2" style="text-align: center;">${uiLabelMap.RoleVerify}--${uiLabelMap.VerifyStepTwo}</td>
						</tr>
						</thead>
			            <tr>
			                <td><b>${uiLabelMap.YourTrueName}</b></td>
			                <td>
			                    <input type="text" name="productName" value="${product.productName!}"  style="width: 100%; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
			                </td>
			            </tr>
			            <t>
							<td>${uiLabelMap.PartyRole}&nbsp;*&nbsp;:</td>
							<td>
								<#list RoleType as RoleType>
									<input type="text" class="" disabled="disabled" id="url1" value="${RoleType.description!}" style="width: 100%; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
								</#list>
							</td>
						</tr>
			            <tr>
			                <td><b>${uiLabelMap.OneWordInformation}</b></td>
			                <td>
			                    <input type="text" name="description" value="${(product.description)!}" style="width: 100%; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
			                </td>
			            </tr>
			            <tr>
			                <td><b>${uiLabelMap.CommentInformation}</b></td>
			                <td>
			                    <input type="text" name="comments" value="${(product.comments)!}" style="width: 100%; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
			                </td>
			            </tr>
			            <tr>
			                <td><b>${uiLabelMap.RoleLongDescription}</b></td>
			                <td>
			                    <textarea class="xheditor" name="longDescription" cols="85" rows="7" encode-output="true">${(product.longDescription)!}</textarea>
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <div><b>${uiLabelMap.ProductSmallImage}</b></div>
			    			<#if (product.smallImageUrl)??>
			                    <a href="<@ofbizContentUrl>${(product.smallImageUrl)!}</@ofbizContentUrl>" target="_blank"><img alt="Small Image" src="<@ofbizContentUrl>${(product.smallImageUrl)!}</@ofbizContentUrl>" width="100px"/></a>
			    			</#if>
			               </td>
			                <td>
			                    <input type="text" name="smallImageUrl" value="${(product.smallImageUrl)?default('')}" style="width: 100%; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;" disabled="disabled"/>
			    			<#if productId?has_content>
			                    <div>
			                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
			                        <a href="javascript:insertImageName('small','${imageNameSmall}.jpg');" class="buttontext">.jpg</a>
			                        <a href="javascript:insertImageName('small','${imageNameSmall}.gif');" class="buttontext">.gif</a>
			                        <a href="javascript:insertImageName('small','');" class="buttontext">${uiLabelMap.CommonClear}</a>
			                    </div>
			    			</#if>
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <div><b>${uiLabelMap.ProductMediumImage}</b></div>
			    			<#if (product.mediumImageUrl)??>
			                    <a href="<@ofbizContentUrl>${product.mediumImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Medium Image" src="<@ofbizContentUrl>${product.mediumImageUrl}</@ofbizContentUrl>" width="100px"/></a>
			    			</#if>
			               </td>
			                <td>
			                    <input type="text" name="mediumImageUrl" value="${(product.mediumImageUrl)?default('')}" style="width: 100%; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;" disabled="disabled"/>
			    			<#if productId?has_content>
			                    <div>
			                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
			                        <a href="javascript:insertImageName('medium','${imageNameMedium}.jpg');" class="buttontext">.jpg</a>
			                        <a href="javascript:insertImageName('medium','${imageNameMedium}.gif');" class="buttontext">.gif</a>
			                        <a href="javascript:insertImageName('medium','');" class="buttontext">${uiLabelMap.CommonClear}</a>
			                    </div>
			    			</#if>
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <div><b>${uiLabelMap.ProductLargeImage}</b></div>
			    			<#if (product.largeImageUrl)??>
			                    <a href="<@ofbizContentUrl>${product.largeImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Large Image" src="<@ofbizContentUrl>${product.largeImageUrl}</@ofbizContentUrl>" width="100px"/></a>
			    			</#if>
			               </td>
			                <td>
			                    <input type="text" name="largeImageUrl" value="${(product.largeImageUrl)?default('')}" style="width: 100%; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;" disabled="disabled"/>
			    			<#if productId?has_content>
			                    <div>
			                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
			                        <a href="javascript:insertImageName('large','${imageNameLarge}.jpg');" class="buttontext">.jpg</a>
			                        <a href="javascript:insertImageName('large','${imageNameLarge}.gif');" class="buttontext">.gif</a>
			                        <a href="javascript:insertImageName('large','');" class="buttontext">${uiLabelMap.CommonClear}</a>
			                    </div>
			    			</#if>
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <div><b>${uiLabelMap.ProductDetailImage}</b></div>
			    			<#if (product.detailImageUrl)??>
			                    <a href="<@ofbizContentUrl>${product.detailImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Detail Image" src="<@ofbizContentUrl>${product.detailImageUrl}</@ofbizContentUrl>" width="100px"/></a>
			    			</#if>
			               </td>
			                <td>
			                    <input type="text" name="detailImageUrl" value="${(product.detailImageUrl)?default('')}" style="width: 100%; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;" disabled="disabled"/>
			   	 			<#if productId?has_content>
			                    <div>
			                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
			                        <a href="javascript:insertImageName('detail','${imageNameDetail}.jpg');" class="buttontext">.jpg</a>
			                        <a href="javascript:insertImageName('detail','${imageNameDetail}.gif');" class="buttontext">.gif</a>
			                        <a href="javascript:insertImageName('detail','');" class="buttontext">${uiLabelMap.CommonClear}</a>
			                    </div>
			    			</#if>
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <div><b>${uiLabelMap.ProductOriginalImage}</b></div>
			    			<#if (product.originalImageUrl)??>
			                    <a href="<@ofbizContentUrl>${product.originalImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Original Image" src="<@ofbizContentUrl>${product.originalImageUrl}</@ofbizContentUrl>" width="100px"/></a>
			    			</#if>
			               </td>
			                <td>
			                    <input type="text" name="originalImageUrl" value="${(product.originalImageUrl)?default('')}" style="width: 100%; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;" disabled="disabled"/>
			    			<#if productId?has_content>
			                    <div>
			                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
			                        <a href="javascript:insertImageName('original','${imageNameOriginal}.jpg');" class="buttontext">.jpg</a>
			                        <a href="javascript:insertImageName('original','${imageNameOriginal}.gif');" class="buttontext">.gif</a>
			                        <a href="javascript:insertImageName('original','');" class="buttontext">${uiLabelMap.CommonClear}</a>
			                    </div>
			    			</#if>
			                </td>
			            </tr>
			            <tr>
			                <td colspan="2">
						        <div style="text-align: center;">
									<button type="submit" class="button btn-small btn-center btn-radius"><i style="color:white;">${uiLabelMap.CommonSave}</i></button>
								</div>
			              </td>
			            </tr>
			        </table>
			    </form>
			    </div>
			    <div class="col-md-12">
				    <script language="JavaScript" type="text/javascript">
				        function setUploadUrl(newUrl) {
				            var toExec = 'document.imageUploadForm.action="' + newUrl + '";';
				            eval(toExec);
				        };
				    </script>
				    <form method="post" enctype="multipart/form-data" action="<@ofbizUrl secure="true">subRoleUploadProductImage?productId=${productId}&amp;upload_file_type=original</@ofbizUrl>" name="imageUploadForm">
				        <table class="table table-bordered">
				        	<thead>
							<tr>
								<td colspan="2">${uiLabelMap.ProductUploadImage}</td>
							</tr>
							</thead>
				            <input type="hidden" name="upload_file_type_bogus" value="original" />
				            	
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
				    <!--<#if productId?has_content>
					  	<#assign productAdditionalImage1 = productContentWrapper.get("ADDITIONAL_IMAGE_1", "url")! />
					  	<#assign productAdditionalImage2 = productContentWrapper.get("ADDITIONAL_IMAGE_2", "url")! />
					  	<#assign productAdditionalImage3 = productContentWrapper.get("ADDITIONAL_IMAGE_3", "url")! />
					  	<#assign productAdditionalImage4 = productContentWrapper.get("ADDITIONAL_IMAGE_4", "url")! />
					</#if>
					<form id="addAdditionalImagesForm" method="post" action="<@ofbizUrl>subRoleAddAdditionalImagesForProduct</@ofbizUrl>" enctype="multipart/form-data">
					  	<input id="additionalImageProductId" type="hidden" name="productId" value="${productId!}" />
					  	<table class="table table-bordered">
						<thead>
							<tr>
								<td colspan="2">${uiLabelMap.ProductAddAdditionalImages}</td>
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
								<a href="<@ofbizUrl>createRoleShowSecCk?productId=${productId}</@ofbizUrl>" style="display: inline-block;" class="button btn-small btn-center btn-radius">${uiLabelMap.RefreshImg}</a>
							</div>
						</td>
						  	</tr>
						</tbody>
					  	</table>
					  	
					</form>-->
				</div>
		    </div>
		    <#list ProdCatalogCategoryList as ProdCatalogCategoryList>
		    	<#assign AllCategoryId = ProdCatalogCategoryList.productCategoryId>
		    </#list>
		    <#list ProductCategory as ProductCategory>
		    	<#assign ShowCategoryId = ProductCategory.productCategoryId>
		    </#list>
		    <script type="text/javascript">
		    	function verifySub() {
		    	$('#mySubModal').modal('show')
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
		            	var checkUrl = '<@ofbizUrl>addrole</@ofbizUrl>';
		        		var ajaxUrl = '<@ofbizUrl>addrole</@ofbizUrl>';  
				        //step-2
				        jQuery.ajax({
				            url: ajaxUrl,
			            	type: 'POST',
				            data: {"partyId" : '${partyId}',"roleTypeId" : 'SUBSCRIBER'},
				            error: function(msg) {
				                alert("2-finish-error! : " + msg);
				            },
				            success: function(msg) {
				            	var checkUrl = '<@ofbizUrl>addPartyToProduct</@ofbizUrl>';
				        		var ajaxUrl = '<@ofbizUrl>addPartyToProduct</@ofbizUrl>';  
						        //step-3
						        jQuery.ajax({
						            url: ajaxUrl,
					            	type: 'POST',
						            data: {"partyId" : '${partyId}',"fromDate" : '${nowTimestamp}',"roleTypeId" : 'SUBSCRIBER',"productId" : '${product.productId}'},
						            error: function(msg) {
						                alert("3-finish-error! : " + msg);
						            },
						            success: function(msg) {
					            		setTimeout(function(){ document.getElementById('loadtext').innerHTML='${StringUtil.wrapString(uiLabelMap.VerifyTwo)}' }, 2000);
	        							setTimeout(function(){ document.getElementById('loadtext').innerHTML='${StringUtil.wrapString(uiLabelMap.VerifyThree)}' }, 4000);
				            			setTimeout(function(){ document.getElementById('loadtext').innerHTML='${StringUtil.wrapString(uiLabelMap.VerifyFour)}' }, 6000);
						            	setTimeout(function(){ document.getElementById('loadtext').innerHTML='${StringUtil.wrapString(uiLabelMap.VerifyFive)}' }, 8000);
						               	setTimeout(function(){ $('#mySubModal').modal('hide') }, 10000);
						               	setTimeout(function(){ window.location.href='<@ofbizUrl>viewprofile</@ofbizUrl>'; }, 8000);
						            	}
						        	});
				            	}
				        	});
		           		}
		        	});
		     	}
		</script>
		<#if bus?? && bus = "SUBSCRIBER">
			<div class="space30"></div>
			<blockquote class="style1">
				<p>${uiLabelMap.HasRoleNoOperate}</p>
			</blockquote>
			<div class="alert info align-center">
				<div class="row">
					<div class="col-md-12">
						<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.CommonGoBack}</a>
					</div>
				</div>
			</div>
		<#else>
	    	<div class="alert info"><a href="javascript:void(0);" onclick="javascript:verifySub();" class="button btn-border btn-small btn-radius white btn-center">${uiLabelMap.CompleteRoleVerify}</a></div>		
		</#if>
		</div>
	</#if>
</div>
<div id="mySubModal" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">${uiLabelMap.VerifyStatus}(<i class="fa fa-exclamation-triangle orange"></i>${uiLabelMap.NoOperation})</h4>
      </div>
      <div class="modal-body">
        <p id="loadtext">${StringUtil.wrapString(uiLabelMap.VerifyOne)}</p>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->