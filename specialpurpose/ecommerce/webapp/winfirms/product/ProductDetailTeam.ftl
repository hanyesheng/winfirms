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
<#assign personLogoUrl = "/images/winfirms/headdefault.png">
<#list partyContentList?sort_by('fromDate') as personContent>
	<#if personContent.partyId = partyId >
		<#assign personContentId = personContent.contentId! />
	</#if>
	<#if personContentId?has_content>
		<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"! />
	<#else>
		<#assign personLogoUrl = "/images/winfirms/headdefault.png"! />
	</#if>
</#list>
<#if userPartyId??>
	<#if partyId = userPartyId>
		<#assign iam = "1">
	</#if>
</#if>
<#list ProductContentAndInfo as ProductContentAndInfo>
	<#if ProductContentAndInfo.productId = product.productId>
		<#assign rrcruitCol = 1>
	</#if>
</#list>
<div class="container space30">
<div class="tab-content project-tab-content">
	<div class="tab-pane active">
		<div class="quote-info space50">
			<h3 class="uppercase text-center space30">${uiLabelMap.ProjectCreatedby}</h3>
			<img src="${personLogoUrl}" class="img-responsive" alt="">
			<p>${partyComments}</p>
			<h2>${partyName}</h2>
		</div>
		<div class="col-md-12 text-center space40">
			<div class="dm-wrap"><span style="width:100%;"></span></div>
		</div>
		<div>
			<h3 class="uppercase text-center space30">${uiLabelMap.Teammates}</h3>
			<div class="comment-list row padding30">
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
							<div class="col-md-4">
							<li>
								<a class="pull-left" href="#"><img class="comment-avatar" src="${teamLogoUrl}" alt="" width="50" height="50"></a>
								<div class="comment-meta">
									<a href="#">${teamName}</a>
									<span>
									<em>${fromDate?substring(0,16)}</em>
									</span>
								</div>
								<p>
									${teamComments}
								</p>
							</li>
							</div>
						</#if>
					</#list>
				</#list>
			</div>
		</div>
		<div class="col-md-12 text-center space40">
			<div class="dm-wrap"><span style="width:100%;"></span></div>
		</div>
		<#if rrcruitCol??>
			<div class="col-md-12 space40">
				<h3 class="uppercase text-center space30">${uiLabelMap.RecruitInfo}</h3>
				<div class="panel panel-default">
	  				<div class="panel-body">
					<#list dataText as dataText>
					<#if dataText.dataResourceId = ProductContentRecruitId>
						<#assign textData = dataText.textData>
					</#if>
					</#list>
					${StringUtil.wrapString(textData!)}
					</div> 
				</div>
			</div>
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
									<a href="<@ofbizUrl>ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${downloadProductContentAndInfo.contentId}</@ofbizUrl>">
										${uiLabelMap.CommonDownload}
									</a>
								</td>
							</tr>
			        	</#list>
					<#else>
						<tr>
							<td colspan="2">
							( ${uiLabelMap.OrderYouMust}<a href="<@ofbizUrl>checkLogin</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonLogin}</a>${uiLabelMap.DownloadFile} )
							</td>
						</tr>
					</#if>
					</tbody>
				</table>
		    </div>
			</#if>
			<!-- comment -->
			<h3 class="uppercase text-center space30">${uiLabelMap.ApplyProject}</h3>
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
							<div class="alert info text-center">
								<i class="fa fa-lg fa-comments-o"></i>${uiLabelMap.ApplyWaiting}
							</div>
							<#assign userLogoUrl = "/images/winfirms/headdefault.png">
							<#list teamContentList?sort_by('fromDate') as teamContentList>
								<#if teamContentList.partyId = CommunicationEventAndProduct.partyIdFrom>
									<#assign teamContentId = teamContentList.contentId! />
									<#if teamContentId?has_content>
										<#assign userLogoUrl = "/content/control/stream?contentId=${teamContentId}"! />
									<#else>
										<#assign userLogoUrl = "/images/winfirms/headdefault.png"! />
									</#if>
								</#if>
							</#list>
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
										<th class="text-center">${uiLabelMap.Applyperson}</th>
										<th colspan="2" class="text-center">${uiLabelMap.Applyinfo}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="0">
											<div class="quote-info">
												<img src="${userLogoUrl}" class="img-responsive" alt="">
												<h2>${userName}</h2>
											</div>
										</td>
										<td>${uiLabelMap.Applydate}</td>
										<td>${CommunicationEventAndProduct.entryDate?substring(0,16)}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.ProjApplyContent}</td>
										<td>${CommunicationEventAndProduct.content}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.NoteContact}</td>
										<td>${CommunicationEventAndProduct.note}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.Applystatus}</td>
										<td>${CommunicationEventAndProduct.statusId}</td>
									</tr>
									<#if ProductContentUpload?has_content>
										<tr>
											<td colspan="2" style="text-align: center;"><span class="label label-success">${uiLabelMap.CommonUpload}</span></td>
										</tr>
									</#if>
									<#list ProductContentUpload as ProductContentUpload>
										<tr>
											<td>${ProductContentUpload.contentName!}</td>
											<td>
												<a href="<@ofbizUrl>ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${ProductContentUpload.contentId}</@ofbizUrl>">
													${uiLabelMap.CommonDownload}
												</a>
											</td>
										</tr>
									</#list>
									<tr>
										<form  id="uploadParentPartyContent" method="post" enctype="multipart/form-data" action="<@ofbizUrl>createUploadContentForProduct</@ofbizUrl>">
								        	<input name="productId" value="${product.productId}" id="EditProductContentDownload_productId" type="hidden">
								        	<input name="productContentTypeId" value="DIGITAL_UPLOAD" id="EditProductContentDownload_productContentTypeId" type="hidden">
											<td><input type="file" name="imageData" class="required valid" size="25"/></td>
								        	<td><input type="submit"  value="${uiLabelMap.CommonUpload}"/></td>
										</form>
									</tr>
								</tbody>
							</table>
						</#if>
						<#if CommunicationEventAndProduct.statusId = "COM_CANCELLED">
							<div class="alert error">
								<i class="fa fa-lg  fa-times-circle"></i> ${uiLabelMap.ApplyCancelled}
							</div>
							<#assign userLogoUrl = "/images/winfirms/headdefault.png">
							<#list teamContentList?sort_by('fromDate') as teamContentList>
								<#if teamContentList.partyId = CommunicationEventAndProduct.partyIdFrom>
									<#assign teamContentId = teamContentList.contentId! />
									<#if teamContentId?has_content>
										<#assign userLogoUrl = "/content/control/stream?contentId=${teamContentId}"! />
									<#else>
										<#assign userLogoUrl = "/images/winfirms/headdefault.png"! />
									</#if>
								</#if>
							</#list>
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
										<th class="text-center">${uiLabelMap.Applyperson}</th>
										<th colspan="2" class="text-center">${uiLabelMap.Applyinfo}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="0">
											<div class="quote-info">
												<img src="${userLogoUrl}" class="img-responsive" alt="">
												<h2>${userName}</h2>
											</div>
										</td>
										<td>${uiLabelMap.Applydate}</td>
										<td>${CommunicationEventAndProduct.entryDate?substring(0,16)}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.ProjApplyContent}</td>
										<td>${CommunicationEventAndProduct.content}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.NoteContact}</td>
										<td>${CommunicationEventAndProduct.note}</td>
									</tr>
									<tr>
										<td>${uiLabelMap.Applystatus}</td>
										<td>${CommunicationEventAndProduct.statusId}</td>
									</tr>
									<#list ProductContentUpload as ProductContentUpload>
										<tr>
											<td>${ProductContentUpload.contentName!}</td>
											<td>
												<a href="<@ofbizUrl>ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${ProductContentUpload.contentId}</@ofbizUrl>">
													${uiLabelMap.CommonDownload}
												</a>
											</td>
										</tr>
									</#list>
									<tr>
										<form  id="uploadParentPartyContent" method="post" enctype="multipart/form-data" action="<@ofbizUrl>createUploadContentForProduct</@ofbizUrl>">
								        	<input name="productId" value="${product.productId}" id="EditProductContentDownload_productId" type="hidden">
								        	<input name="productContentTypeId" value="DIGITAL_UPLOAD" id="EditProductContentDownload_productContentTypeId" type="hidden">
											<td><input type="file" name="imageData" class="required valid" size="25"/></td>
								        	<td><input type="submit"  value="${uiLabelMap.CommonUpload}"/></td>
										</form>
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
					  	<input name="note" class="input-md form-control" type="text" placeholder="${uiLabelMap.NoteContact}"/>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<input type="hidden" class="form-control" name="subject" id="exampleInputName" require="" value="${productContentWrapper.get("PRODUCT_NAME", "html")!}"/>
								</div>
								<div class="form-group textarea-message ">
									<textarea name="content" class="input-md form-control" placeholder="${uiLabelMap.ProjApplyContent}" rows="8" id="url3"></textarea>
								</div>
								<button type="submit" class="button btn-md btn-radius btn-center color2 btn-radius">${uiLabelMap.EcommerceBlogPostedOn}</button>
							</div><!-- Column -->
						</div><!-- Row -->
					</form><!-- Post Comment Form -->
				</#if>
			<#else>
				<h3 class="uppercase text-center space30">${uiLabelMap.EcommerceLoggedToApply}</h3>
			</#if>
		<#else><h3 class="uppercase text-center space30">${uiLabelMap.NoRecruiting}</h3></#if>
	</div>
</div>
</div>