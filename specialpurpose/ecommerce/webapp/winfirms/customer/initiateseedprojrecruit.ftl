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
			  <li role="presentation"><a href="<@ofbizUrl>profileInitiateseedprojimg?productId=${productId!}</@ofbizUrl>">${uiLabelMap.ProjectPic}</a></li>
			  <li role="presentation" class="active"><a href="<@ofbizUrl>profileInitiateseedprojrecruit?productId=${productId!}</@ofbizUrl>">${uiLabelMap.RecruitProject}</a></li>
			</ul>
			<div class="space30"></div>
			<div class="row">
			    <div class="col-md-12">
					<#assign Col = 0>
					<#list ProductContentAndInfo as ProductContentAndInfo>
						<#assign ProductContentId = ProductContentAndInfo.contentId>
						<#assign ProductContentThruDate = ProductContentAndInfo.thruDate!>
						<#assign ProductContentFromDate = ProductContentAndInfo.fromDate>
						<#assign textDataResourceId = ProductContentAndInfo.dataResourceId>
						<#assign Col = Col + 1>
						<#if (Col > 0)><#break/></#if>
					</#list>
					<#if ProductContentId??>
					  	<table class="table table-bordered">
							<thead>
								<tr class="active">
									<td colspan="4" style="text-align: center;">${uiLabelMap.RecruitProject}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="1">${uiLabelMap.ProjectSupportDate}</td>
									<td colspan="3">
										${ProductContentThruDate!}
									</td>
							  	</tr>
							  	<tr>
									<td colspan="1">${uiLabelMap.RecruitInfo}</td>
									<td colspan="3">
										${productContentWrapper.get("SPECIALINSTRUCTIONS", "html")!}
									</td>
							  	</tr>
							  	<tr class="active">
									<td colspan="4" style="text-align: center;">${uiLabelMap.Teammates}</td>
								</tr>
								<#if ProductRole?? && (ProductRole?size > 0) >
									<#assign ProCol = 0>
								  	<#list ProductRole as ProductRole>
										<#assign fromDate = ProductRole.fromDate!/>
										<#list teamList as teamList>
											<#if ProductRole.partyId = teamList.partyId>
												<#assign teamId = teamList.partyId! />
												<#if teamList.nickname??>
													<#assign teamName = teamList.nickname />
												<#else>
													<#assign teamName = teamList.partyId />
												</#if>
												<#if teamList.comments??>
													<#assign teamComments = teamList.comments />
												<#else>
													<#assign teamComments = uiLabelMap.NoComments />
												</#if>
												<#assign teamLogoUrl = "/images/winfirms/headdefault.png">
												<#list teamContentList?sort_by('fromDate') as teamContentList>
													<#if teamContentList.partyId = teamList.partyId>
														<#assign teamContentId = teamContentList.contentId! />
														<#if teamContentId?has_content>
															<#assign teamLogoUrl = "/content/control/stream?contentId=${teamContentId}"! />
														<#else>
															<#assign teamLogoUrl = "/images/winfirms/headdefault.png"! />
														</#if>
													</#if>
												</#list>
												<#if userPartyId??>
												<#if teamList.partyId = userPartyId>
													<#assign solved = "1">
												</#if>
												</#if>
												<tr>
													<td>${teamName}</td>
													<td>${fromDate?substring(0,16)}</td>
													<td>
														${teamComments}
													</td>
													<td>
														<form method="post" action="<@ofbizUrl>removePartyFromProduct</@ofbizUrl>" name="UpdateProductRole_${ProCol}">
											               	<input name="fromDate" value="${ProductRole.fromDate}" type="hidden">
											               	<input name="roleTypeId" value="_NA_" type="hidden">
											               	<input name="productId" value="${ProductRole.productId}" type="hidden">
											               	<input name="partyId" value="${ProductRole.partyId}" type="hidden">
										               	</form>
										               	<a class="button btn-border color3 btn-xs btn-radius" href="javascript:document.UpdateProductRole_${ProCol}.submit()"><i class="fa fa-trash"></i>${uiLabelMap.CommonDelete}</a>
													</td>
											  	</tr>
											</#if>
										</#list>
										<#assign ProCol = ProCol + 1>
									</#list>
								<#else>
									<tr>
										<td colspan="4" style="text-align: center;">${uiLabelMap.NoMates}</td>
								  	</tr>
								</#if>
							  	<tr class="active">
									<td colspan="4" style="text-align: center;">${uiLabelMap.EditRecruit}</td>
							  	</tr>
								<form id="createSimpleTextContentForProduct" method="post" action="<@ofbizUrl>createSimpleTextContentForProduct</@ofbizUrl>">
								  	<input name="productId" value="${productId!}" id="EditProductContentSimpleText_productId" type="hidden">
								  	<input name="fromDate" value="${nowTimestamp}" id="EditProductContentSimpleText_fromDate" type="hidden">
								  	<input name="productContentTypeId" value="SPECIALINSTRUCTIONS" id="EditProductContentSimpleText_productContentTypeId" type="hidden">
								  	<input name="purchaseFromDate" id="EditProductContentSimpleText_purchaseFromDate" type="hidden">
								  	<input name="purchaseThruDate" id="EditProductContentSimpleText_purchaseThruDate" type="hidden">
								  	<input name="useCountLimit" id="EditProductContentSimpleText_useCountLimit" type="hidden">
								  	<input name="useTime" id="EditProductContentSimpleText_useTime" type="hidden">
								  	<input name="useTimeUomId" id="EditProductContentSimpleText_useTimeUomId" type="hidden">
								  	<input name="useRoleTypeId" id="EditProductContentSimpleText_useRoleTypeId" type="hidden">
									<input name="textDataResourceId" id="EditProductContentSimpleText_textDataResourceId" type="hidden">
								  	<tr>
										<td colspan="1">${uiLabelMap.ProjectSupportDate}</td>
										<td colspan="3">
											<input required="required" type="text" class="laydate-icon" name="thruDate"  id="EditProductContentSimpleText_thruDate" value="${ProductContentThruDate!}" placeholder="${uiLabelMap.ProductSupportThruDate}" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'});" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
										</td>
								  	</tr>
								  	<tr>
										<td colspan="1">${uiLabelMap.RecruitInfo}</td>
										<td colspan="3">
											<textarea class="xheditor" name="text" cols="85" rows="7" encode-output="true"><#if requestParameters.text??>${requestParameters.text!}<#else>${productContentWrapper.get("SPECIALINSTRUCTIONS", "html")!}</#if></textarea>
										</td>
								  	</tr>
								  	<tr>
										<td colspan="4">
									        <div style="text-align: center;">
												<button type="submit" class="button btn-small btn-center btn-radius">
													<i style="color:white;">
													${uiLabelMap.CommonSave}
													</i>
												</button>
											</div>
						              	</td>
								  	</tr>
								</form>
							</tbody>
					  	</table>
					<#else>
						<form id="createSimpleTextContentForProduct" method="post" action="<@ofbizUrl>createSimpleTextContentForProduct</@ofbizUrl>">
						  	<input name="productId" value="${productId!}" id="EditProductContentSimpleText_productId" type="hidden">
						  	<input name="fromDate" value="${nowTimestamp}" id="EditProductContentSimpleText_fromDate" type="hidden">
						  	<input name="productContentTypeId" value="SPECIALINSTRUCTIONS" id="EditProductContentSimpleText_productContentTypeId" type="hidden">
						  	<input name="purchaseFromDate" id="EditProductContentSimpleText_purchaseFromDate" type="hidden">
						  	<input name="purchaseThruDate" id="EditProductContentSimpleText_purchaseThruDate" type="hidden">
						  	<input name="useCountLimit" id="EditProductContentSimpleText_useCountLimit" type="hidden">
						  	<input name="useTime" id="EditProductContentSimpleText_useTime" type="hidden">
						  	<input name="useTimeUomId" id="EditProductContentSimpleText_useTimeUomId" type="hidden">
						  	<input name="useRoleTypeId" id="EditProductContentSimpleText_useRoleTypeId" type="hidden">
							<input name="textDataResourceId" id="EditProductContentSimpleText_textDataResourceId" type="hidden">
						  	<table class="table table-bordered">
								<thead>
									<tr>
										<td colspan="2" style="text-align: center;">${uiLabelMap.RecruitProject}</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${uiLabelMap.ProjectSupportDate}</td>
										<td>
											<input required="required" type="text" class="laydate-icon" name="thruDate"  id="EditProductContentSimpleText_thruDate" value="${ProductContentThruDate!}" placeholder="${uiLabelMap.ProductSupportThruDate}" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'});" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
										</td>
								  	</tr>
								  	<tr>
										<td>${uiLabelMap.RecruitInfo}</td>
										<td>
											<textarea class="xheditor" name="text" cols="85" rows="7" encode-output="true"><#if requestParameters.text??>${requestParameters.text!}<#else>${productContentWrapper.get("SPECIALINSTRUCTIONS", "html")!}</#if></textarea>
										</td>
								  	</tr>
								  	<tr>
										<td colspan="2">
									        <div style="text-align: center;">
												<button type="submit" class="button btn-small btn-center btn-radius">
													<i style="color:white;">
													${uiLabelMap.CommonSave}
													</i>
												</button>
											</div>
						              	</td>
								  	</tr>
								</tbody>
						  	</table>
						</form>
					</#if>
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