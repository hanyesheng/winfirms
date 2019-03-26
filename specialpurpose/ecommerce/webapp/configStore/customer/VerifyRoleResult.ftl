<#list ProductCategoryList as ProductCategoryList>
	<#assign categoryid = ProductCategoryList.productCategoryId!/>
	<#assign categoryImageUrl = ProductCategoryList.categoryImageUrl!/>
	<#if categoryImageUrl?has_content>
		<#else/>
		<#assign categoryImageUrl = "/service/images/project/bg2.jpg"/>
	</#if>
</#list>
<#if categoryid?has_content>
<script type="text/javascript" src="<@ofbizContentUrl>/service/images/laydate.js</@ofbizContentUrl>"></script>
<div class="md-card">
	<div class="space30"></div>
	<#list UserLoginList as UserLoginList>
	<#if UserLoginList.userLoginId = product.createdByUserLogin>
		<#list personList as personList>
			<#if personList.partyId = UserLoginList.partyId>
				<#assign partyid = personList.partyId>
				<#if personList.nickname??>
				<#assign nickname = personList.nickname>
				<#else>
				<#assign nickname = personList.partyId>
				</#if>
			</#if>
		</#list>
	</#if>
	</#list>
	<div id="main-container">
		<div>
			<div class="panel panel-success margin-top-30">
				<div class="panel-heading">
					<h6 class="panel-title">${uiLabelMap.StatusRelease}</h3>
				</div>
				<div class="panel-body">
					<#list ProductCategoryMemberList as ProductCategoryMemberList>
						<#if ProductCategoryMemberList.productCategoryId = categoryid && ProductCategoryMemberList.productId = productId>
							<#assign fromDate = ProductCategoryMemberList.fromDate />
						</#if>
					</#list>
					<#if fromDate??>
					    <#list productList as product>
					    <#if product.productId = productId>
							<table class="table table-bordered">
								<thead>
									<tr>
										<td colspan="6">${uiLabelMap.ProjectInformation}&nbsp;:&nbsp;${uiLabelMap.InfRelease}</td>
									</tr>
								</thead>
								<tbody>
									<tr>
									<td>
										${uiLabelMap.ProjectPic}
									</td>
									<td>
										${uiLabelMap.ProjectName}
									</td>
									<td>
										${uiLabelMap.ProjectDescription}
									</td>
									<td>
										${uiLabelMap.ProjectCreatedDate}
									</td>
									<td>
										${uiLabelMap.ProjectSupportDate}
									</td>
									<td>
										${uiLabelMap.ProjectCreatedby}
									</td>
								  	</tr>
								  	<tr>
									<td>
										<#if product.smallImageUrl?has_content>
											<img width="100px" alt="Related Progect" class="img-responsive" src="${product.largeImageUrl}">
										<#else>
											<img width="100px" alt="Related Progect" class="img-responsive" src="/service/images/default.jpg">
										</#if>
									</td>
									<td>
										<#if product.productName??><a href="<@ofbizUrl>profileInitiateprojsecond?productId=${productId}</@ofbizUrl>">${(product.productName)!}</a><#else><a href="<@ofbizUrl>profileInitiateprojsecond?productId=${productId}</@ofbizUrl>">----</a></#if>
									</td>
									<td>
										<#if product.description??>${(product.description)!}<#else>----</#if>
									</td>
									<td>
										<#if product.createdDate??>${(product.createdDate?substring(0,16))!}<#else>----</#if>
									</td>
									<td>
										<#if product.supportDiscontinuationDate??>${(product.supportDiscontinuationDate?substring(0,16))!}<#else>----</#if>
									</td>
									<td>
										<a class="createdby" target="_blank" href="#">${nickname}</a>
									</td>
								  	</tr>
								  	<tr>
										<td colspan="6">
											<div style="text-align: center;">
											<form method="post" action="<@ofbizUrl secure="true">profileRemoveProductFromCategory</@ofbizUrl>">
									            <input type="hidden" name="productId" value="${productId}" />
									            <input type="hidden" name="fromDate" value="${fromDate}" />
									            <input type="hidden" name="productCategoryId" value="${categoryid}" />
												<button class="button btn-small btn-center btn-radius" type="submit">${uiLabelMap.DeleteRelease}</button>
							   				</form>
							   				</div>
										</td>
									</tr>
								</tbody>
							</table>
						</#if>
					    </#list>
					<#else>
						<div>${uiLabelMap.NoRelease}</div>
				    </#if>
				</div>
			</div>
			<div class="panel panel-info margin-top-30">
				<div class="panel-heading">
					<h6 class="panel-title">${uiLabelMap.RealRelease}</h3>
				</div>
				<div class="panel-body">
					<#if !fromDate??>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td colspan="6">${uiLabelMap.ProjectInformation}&nbsp;:&nbsp;${uiLabelMap.ReadyRelease}<a href="<@ofbizUrl>initiatesharesecond?productId=${productId}</@ofbizUrl>">${uiLabelMap.Editproject}</a></td>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td>
								${uiLabelMap.ProjectPic}
							</td>
							<td>
								${uiLabelMap.ProjectName}
							</td>
							<td>
								${uiLabelMap.ProjectDescription}
							</td>
							<td>
								${uiLabelMap.ProjectCreatedDate}
							</td>
							<td>
								${uiLabelMap.ProjectSupportDate}
							</td>
							<td>
								${uiLabelMap.ProjectCreatedby}
							</td>
						  	</tr>
						  	<tr>
							<td>
								<#if product.smallImageUrl?has_content>
									<img width="100px" alt="Related Progect" class="img-responsive" src="${product.largeImageUrl}">
								<#else>
									<img width="100px" alt="Related Progect" class="img-responsive" src="/service/images/default.jpg">
								</#if>
							</td>
							<td>
								<#if product.productName??><a href="<@ofbizUrl>profileInitiateprojsecond?productId=${productId}</@ofbizUrl>">${(product.productName)!}</a><#else><a href="<@ofbizUrl>profileInitiateprojsecond?productId=${productId}</@ofbizUrl>">----</a></#if>
							</td>
							<td>
								<#if product.description??>${(product.description)!}<#else>----</#if>
							</td>
							<td>
								<#if product.createdDate??>${(product.createdDate?substring(0,16))!}<#else>----</#if>
							</td>
							<td>
								<#if product.supportDiscontinuationDate??>${(product.supportDiscontinuationDate?substring(0,16))!}<#else>----</#if>
							</td>
							<td>
								<a class="createdby" target="_blank" href="<@ofbizUrl>readpersoninfo?partyId=${partyid}</@ofbizUrl>">${nickname}</a>
							</td>
						  	</tr>
						  	<tr>
								<td colspan="6">
									<div style="text-align: center;">
									<form method="post" action="<@ofbizUrl>profileAddProductToCategory</@ofbizUrl>">
							            <input type="hidden" name="productId" value="${productId}" />
							            <input type="hidden" name="productCategoryId" value="${categoryid}" />
										<div style="text-align: center;">
											<input type="text" style="height: 35px;" class="laydate-icon" name="fromDate" placeholder="${uiLabelMap.CommonFromDate}*(${uiLabelMap.MustWrite})" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'});"/>
										</div>
							            <div style="text-align: center; padding-top: 10px;">
							            	<button class="button btn-small btn-center btn-radius" type="submit">${uiLabelMap.RealRelease}</button>
							            </div>
							   		</form>
					   				</div>
								</td>
							</tr>
						</tbody>
					</table>
					<#else>
						<div>${uiLabelMap.InfRelease}</div>
				    </#if>
				</div>
			</div>
		</div>
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