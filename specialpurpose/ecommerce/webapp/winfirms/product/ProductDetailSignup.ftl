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
<script type="text/javascript">
	function addItem() {
       if (document.addform.add_product_id.value == 'NULL') {
           showErrorAlert("${uiLabelMap.CommonErrorMessage2}","${uiLabelMap.CommonPleaseSelectAllRequiredOptions}");
           return;
       } else {
               document.addform.submit();
          }
    }
</script>
<#assign productId = product.productId>
<#list CommunicationEventAndProduct as CommunicationEventAndProduct>
	<#assign col = "0">
</#list>
<#list PersonList as PersonList>
	<#assign partyId = PersonList.partyId! />
	<#if PersonList.nickname??>
		<#assign partyName = PersonList.nickname />
	<#else>
		<#assign partyName = product.createdByUserLogin />
	</#if>
	<#if PersonList.comments??>
		<#assign partyComments = PersonList.comments />
	<#else>
		<#assign partyComments = uiLabelMap.NoComments />
	</#if>
</#list>
<#list ProductRole as ProductRole>
	<#assign fromDate = ProductRole.fromDate!/>
	<#list teamList as teamList>
		<#if ProductRole.partyId = teamList.partyId>
			<#assign teamId = teamList.partyId! />
			<#if userPartyId??>
			<#if teamList.partyId = userPartyId>
				<#assign solved = "1">
			</#if>
			</#if>
		</#if>
	</#list>
</#list>
<!--如果用户是创建者-->
<#if userPartyId??>
	<#if partyId = userPartyId>
		<#assign iam = "1">
	</#if>
</#if>
<!--是否开始招募-->
<#if ProductContentAndInfo?has_content>
	<#assign rrcruitCol = 1>
</#if>
<#assign price = priceMap! />
<#assign shoppingCart = sessionAttributes.shoppingCart!>
<#list shoppingCart.items() as cartLine>
	<#if cartLine.getProductId() = product.productId>
		<#assign shoppingCartHas = "Y">
	</#if>
</#list>
	
<div class="container space30">
<div class="tab-content project-tab-content">
	<div class="tab-pane active">
		<div class="row" style="padding: 30px;">
		<#if price?has_content>
			<!--是否付款-->
			<#list OrderItemAndProduct as OrderItemAndProduct>
	          <#list OrderHeader as OrderHeader>
	            <#if OrderHeader.orderId = OrderItemAndProduct.orderId>
	            	<#assign HasSignup = "Y"/>
	            </#if>
	          </#list>
	        </#list>
        	<!--是否限制人数（众筹）-->
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="p-price text-center">
						<#if price.isSale?? && price.isSale>
							<span class="salePrice">${uiLabelMap.OrderOnSale}!</span>
							<#assign priceStyle = "salePrice" />
						  <#else>
							<#assign priceStyle = "regularPrice" />
						</#if>
						<#if price.listPrice?? && price.price?? && price.price &lt; price.listPrice>
							<div>${uiLabelMap.TotlePrice}:
							  <span class="basePrice">
							<@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed />
							  </span>
							</div>
					  	</#if>
					  	<div style="font-size: 25px;color: #FA6901;">${uiLabelMap.PayPrice}:
						<span class="${priceStyle}">
							<@ofbizCurrency amount=price.price isoCode=price.currencyUsed />
						</span>
						</div>
						<#if product.productTypeId! == "ASSET_USAGE" || product.productTypeId! == "ASSET_USAGE_OUT_IN">
							<#if product.reserv2ndPPPerc?? && product.reserv2ndPPPerc != 0><br/>
								<span class="${priceStyle}">
									${uiLabelMap.ProductReserv2ndPPPerc}
									<#if !product.reservNthPPPerc?? || product.reservNthPPPerc == 0>
									    ${uiLabelMap.CommonUntil} ${product.reservMaxPersons!1}
									</#if>
									<@ofbizCurrency amount=product.reserv2ndPPPerc*price.price/100 isoCode=price.currencyUsed />
								</span>
							</#if>
							<#if product.reservNthPPPerc?? &&product.reservNthPPPerc != 0><br/>
							    <span class="${priceStyle}">
									${uiLabelMap.ProductReservNthPPPerc}
									<#if !product.reserv2ndPPPerc?? || product.reserv2ndPPPerc == 0>
								  		${uiLabelMap.ProductReservSecond}
									<#else>
								  		${uiLabelMap.ProductReservThird}
									</#if>
										${uiLabelMap.CommonUntil} ${product.reservMaxPersons!1}, ${uiLabelMap.ProductEach}:
								<@ofbizCurrency amount=product.reservNthPPPerc*price.price/100 isoCode=price.currencyUsed />
							    </span>
							</#if>
							<#if (!product.reserv2ndPPPerc?? || product.reserv2ndPPPerc == 0) && (!product.reservNthPPPerc?? ||
								product.reservNthPPPerc == 0)>
							  <br/>${uiLabelMap.ProductMaximum} ${product.reservMaxPersons!1} ${uiLabelMap.ProductPersons}.
							</#if>
						</#if>
					</div>
					<p class="space30 text-center">
						${productContentWrapper.get("PRICE_DETAIL_TEXT", "html")!}
					</p>
				</div>
				<!--<#if ProductOrderItem?has_content>
					<#assign SignUpCol = ProductOrderItem?size>
				<#else>
					<#assign SignUpCol = 0>
				</#if>
				<#if product.quantityIncluded??>
					<#assign SignUpPercent = SignUpCol/product.quantityIncluded><#else><#assign SignUpPercent = 0>
				</#if>-->
				<!-- end section -->
				<!--人数约束-->
				<!--<div class="col-md-8">
					<div class="row">
						<div class="col-md-12 ss2-content padding30 signup">
							<div class="col-md-6 space20">
								<div class="stats1-info">
									<p><span class="count count1">${SignUpCol!}</span></p>
									<h2>${uiLabelMap.HasSignup}</h2>
								</div>
							</div>
							<div class="col-md-6 space20">
								<div class="stats1-info">
									<p><span class="count count1">${product.quantityIncluded!}</span></p>
									<h2>${uiLabelMap.SignupTarget}</h2>
								</div>
							</div>
							<div class="col-md-12">
								<div class="progress">
								  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="${SignUpPercent?string("0.00#%")}" aria-valuemin="0" aria-valuemax="100" style="width: ${SignUpPercent?string("0.00#%")}">
								    &nbsp;&nbsp;&nbsp;&nbsp;${SignUpCol!}/${product.quantityIncluded!}<span>${SignUpPercent?string("0.00#%")}</span>
								  </div>
								</div>
							</div>
						</div>
					</div>
				</div>-->
			<div class="col-md-12 text-center space40">
				<div class="dm-wrap" style="height: 2px;"><span style="width:100%;height: 2px;"></span></div>
			</div>
		</#if>
		</div>	
		<!--如果有招募信息显示招募信息-->
		<#if rrcruitCol??>
			<div class="col-md-12 space40">
				<div class="panel panel-default">
	  				<div class="panel-body">
					${productContentWrapper.get("SPECIALINSTRUCTIONS", "html")!}
					</div>
				</div>
			</div>
			
			<!-- comment -->
			<h3 class="uppercase text-center space30">${uiLabelMap.AddApplyActivityInfo}</h3>
			<#if userPartyId??>
				<!-- Post Comment Form -->
				<#if solved?? || col?? || iam??>
					<#if solved?? >
						<div class="alert success text-center">
							<i class="fa fa-lg fa-check-circle-o"></i>${uiLabelMap.ApplyResolved}
						</div>
					<#elseif iam?? >
						<div class="alert success text-center">
							<i class="fa fa-lg fa-check-circle-o"></i>${uiLabelMap.Youarecreater}
						</div>
					<#elseif col??>
					<#list CommunicationEventAndProduct as CommunicationEventAndProduct>
						<#if CommunicationEventAndProduct.statusId = "COM_IN_PROGRESS">
							<div class="alert notice text-center">
								<i class="fa fa-lg fa-comments-o"></i>${uiLabelMap.ApplyWaiting}
							</div>
							<#list teamList as teamList>
								<#if CommunicationEventAndProduct.partyIdFrom = teamList.partyId>
									<#if teamList.nickname??>
										<#assign userName = teamList.nickname />
									<#else>
										<#assign userName = teamList.partyId />
									</#if>
								</#if>
							</#list>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th colspan="2" class="text-center">${uiLabelMap.Applyinfo}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${uiLabelMap.Applyperson}</td>
										<td>${userName}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.Applydate}</td>
										<td>${CommunicationEventAndProduct.entryDate?substring(0,16)}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.ProjApplyContent}</td>
										<td>${CommunicationEventAndProduct.content!}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.NoteContact}</td>
										<td>${CommunicationEventAndProduct.note!}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.Applystatus}</td>
										<td>
											<span class="label label-warning">${uiLabelMap.UnderReview}</span>
											<#if HasSignup?? && HasSignup = "Y">
												<span class="label label-success">${uiLabelMap.HasPay}</span>
											<#else>
												<span class="label label-warning">${uiLabelMap.UnPay}</span>
											</#if>
										</td>
									</tr>
								</tbody>
							</table>
						</#if>
						<#if CommunicationEventAndProduct.statusId = "COM_CANCELLED">
							<div class="alert error">
								<i class="fa fa-lg  fa-times-circle"></i> ${uiLabelMap.ApplyCancelled}
							</div>
							<#assign userLogoUrl = "/images/winfirms/user.png">
							<#list teamList as teamList>
								<#if CommunicationEventAndProduct.partyIdFrom = teamList.partyId>
									<#if teamList.nickname??>
										<#assign userName = teamList.nickname />
									<#else>
										<#assign userName = teamList.partyId />
									</#if>
								</#if>
							</#list>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th colspan="2" class="text-center">${uiLabelMap.Applyinfo}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${uiLabelMap.Applyperson}</td>
										<td>${userName}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.Applydate}</td>
										<td>${CommunicationEventAndProduct.entryDate?substring(0,16)}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.ProjApplyContent}</td>
										<td>${CommunicationEventAndProduct.content!}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.NoteContact}</td>
										<td>${CommunicationEventAndProduct.note!}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.Applystatus}</td>
										<td>
											<span class="label label-warning">${uiLabelMap.Refused}</span>
											<#if HasSignup?? && HasSignup = "Y">
												<span class="label label-success">${uiLabelMap.HasPay}[${uiLabelMap.RefundInDays}]</span>
											<#else>
												<span class="label label-warning">${uiLabelMap.UnPay}</span>
											</#if>
										</td>
									</tr>
								</tbody>
							</table>
						</#if>
					</#list>
					</#if>
					<#else>
					<!--发起评论时提交的表单-->
					<form class="form" method="post" action="<@ofbizUrl secure="true">createApplyProjCommunicationEvent?detailId=team</@ofbizUrl>" name="CreateTopicEvent">
						<input name="action" type="hidden"/>
					  	<input name="my" type="hidden"/>
					  	<input name="messageId" type="hidden"/>
					  	<input name="productId" value="${product.productId}" type="hidden"/>
					  	<input name="parentCommEventId" value="" type="hidden"/>
					  	<input name="communicationEventTypeId" value="PROJECT_APPLY_JOIN" type="hidden"/>
					  	<input name="statusId" value="COM_IN_PROGRESS" type="hidden"/>
					  	<input name="partyIdFrom" value="${userPartyId}" type="hidden"/>
					  	<input name="partyIdTo" value="${partyId}" type="hidden"/>
					  	<input name="contactMechTypeId" type="hidden"/>
					  	<input name="contactMechIdFrom" autocomplete="off" type="hidden"/>
					  	<input name="contactMechIdTo" autocomplete="off" type="hidden"/>
					  	<input name="roleTypeIdFrom" value="_NA_" type="hidden"/>
					  	<input name="roleTypeIdTo" value="_NA_" type="hidden"/>
					  	<input name="contactListId" type="hidden"/>
					  	<input name="datetimeStarted" type="hidden"/>
					  	<input name="datetimeEnded" type="hidden"/>
					  	<input name="reasonEnumId" type="hidden"/>
					  	<input name="contentMimeTypeId" value="text/plain" type="hidden"/>
					  	<input name="note" required="required" class="input-md form-control" type="text" placeholder="${uiLabelMap.NoteContact}"/>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<input type="hidden" class="form-control" name="subject" id="exampleInputName" require="" value="${productContentWrapper.get("PRODUCT_NAME", "html")!}"/>
								</div>
								<div class="form-group textarea-message ">
									<textarea required="required" name="content" class="input-md form-control" placeholder="${uiLabelMap.SchoolAndInfo}" rows="8" id="url3"></textarea>
								</div>
								<button type="submit" class="button btn-md btn-radius btn-center color2 btn-radius">${uiLabelMap.EcommerceBlogPostedOn}</button>
							</div><!-- Column -->
						</div><!-- Row -->
					</form><!-- Post Comment Form -->
				</#if>
			<#else>
				<p class="uppercase text-center space30">${uiLabelMap.OrderYouMust}<a href="<@ofbizUrl>checkLogin</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonLogin}</a>(<a href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.EcommerceRegister}</a>)${uiLabelMap.LoggedToApplyActivity}</p>
			</#if>
			<#if downloadProductContentAndInfoList?has_content>
			<div class="col-md-12 space40" id="FileDownload">
				<h3 class="uppercase text-center space30">${uiLabelMap.FileDownload}</h3>
		        <table class="table table-bordered">
		        	<tbody>
			     	<#if userLogin?has_content && userLogin.userLoginId != "anonymous">
						<#list downloadProductContentAndInfoList as downloadProductContentAndInfo>
				            <tr>
								<td>
									${downloadProductContentAndInfo.contentName!}
									<#if downloadProductContentAndInfo.description?has_content>
					            		 - ${downloadProductContentAndInfo.description}
					            	</#if>
								</td>
								<td>
									<#if downloadProductContentAndInfo.contentName?has_content>
					                    <a href="/partymgr/control/img/${downloadProductContentAndInfo.contentName}?imgId=${(downloadProductContentAndInfo.dataResourceId)!}" target="_blank">${uiLabelMap.CommonDownload}</a>
					                </#if>
								</td>
							</tr>
			        	</#list>
			        	<#if ProductContentUpload?has_content>
							<tr>
								<td colspan="2" style="text-align: center;"><span class="label label-success">${uiLabelMap.CommonUpload}</span></td>
							</tr>
						</#if>
			        	<#list ProductContentUpload as ProductContentUpload>
							<tr>
								<td>${ProductContentUpload.contentName!}</td>
								<form method="post" action="<@ofbizUrl>removeFileUploads</@ofbizUrl>" onsubmit="javascript:submitFormDisableSubmits(this)" name="removeFileUploads_${ProductContentUpload_index}">
									<input name="fromDate" value="${ProductContentUpload.fromDate}" type="hidden">
									<input name="productId" value="${ProductContentUpload.productId}" type="hidden">
									<input name="contentId" value="${ProductContentUpload.contentId}" type="hidden">
									<input name="productContentTypeId" value="${ProductContentUpload.productContentTypeId}" type="hidden">
								</form>
								<td>
									<a href="javascript:document.removeFileUploads_${ProductContentUpload_index}.submit()">
										${uiLabelMap.CommonDelete}
									</a>
								</td>
							</tr>
						</#list>
						<tr>
							<form  id="uploadParentPartyContent" method="post" enctype="multipart/form-data" action="<@ofbizUrl>createUploadContentForProduct</@ofbizUrl>">
					        	<input name="productId" value="${product.productId}" id="EditProductContentDownload_productId" type="hidden">
					        	<input name="productContentTypeId" value="DIGITAL_UPLOAD" id="EditProductContentDownload_productContentTypeId" type="hidden">
								<td><input type="file" required="required" name="imageData" class="required valid" size="25"/></td>
					        	<td><input type="submit"  value="${uiLabelMap.CommonUpload}"/></td>
							</form>
						</tr>
					<#else>
						<tr>
							<td colspan="2">
							 ${uiLabelMap.OrderYouMust}<a href="<@ofbizUrl>checkLogin</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonLogin}</a>(<a href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.EcommerceRegister}</a>)${uiLabelMap.DownloadFile} 
							</td>
						</tr>
					</#if>
					</tbody>
				</table>
		    </div>
			</#if>
		</#if>
		<div class="row" style="padding: 30px;">
		<#if price?has_content>
			<!--是否付款-->
			<#list OrderItemAndProduct as OrderItemAndProduct>
	          <#list OrderHeader as OrderHeader>
	            <#if OrderHeader.orderId = OrderItemAndProduct.orderId>
	            	<#assign HasSignup = "Y"/>
	            </#if>
	          </#list>
	        </#list>
			<div class="col-md-12 text-center space40">
				<div class="dm-wrap" style="height: 2px;"><span style="width:100%;height: 2px;"></span></div>
			</div>
	        <#if HasSignup?? && HasSignup = "Y">
	        	<div>
	        		<div class="p-price text-center">
						<span class="button btn-small btn-center">${uiLabelMap.HasPay}</span>
					</div>
	        	</div>
	        <#else>
				<div class="col-md-8 col-md-offset-2 text-center">
					<#if shoppingCartHas??>
						<a href="<@ofbizUrl>showcart</@ofbizUrl>" id="addToCart" name="addToCart" class="button btn-small btn-center">${uiLabelMap.CompleteSignup}</a>
					<#else>
						<form method="post" action="<@ofbizUrl>additem</@ofbizUrl>" name="addform" style="margin: 0;">
							<fieldset>
								<input type="hidden" name="add_product_id" value="${product.productId}"/>
								<a href="javascript:addItem()" id="addToCart" name="addToCart" class="button btn-small btn-center">${uiLabelMap.SignupAndPay}</a>
							</fieldset>
					  	</form>
					</#if>
				</div>
			</#if>
		</#if>
		</div>
	</div>
</div>
</div>