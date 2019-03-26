<!--判断是否发布-->
<#assign IfRelease = "0">
<#list ProductCategory as ProductCategory>
	<#list ProductCategoryMemberRelease as ProductCategoryMemberRelease>
		<#if ProductCategory.primaryProductCategoryId = ProductCategoryMemberRelease.productCategoryId>
		<#assign IfRelease = "1">
		</#if>
	</#list>
</#list>
<!--判断是否公开-->
<#assign IfPublic = "0">
<#if ProductCategoryMemberPublic?has_content>
	<#assign IfPublic = "1">
	<#list ProductCategoryMemberPublic as ProductCategoryMemberPublic>
		<#assign PublicFromDate = ProductCategoryMemberPublic.fromDate>
	</#list>
</#if>
<div class="md-card">
    <div class="md-card-content">
        <table cellspacing="0" class="basic-table uk-table">
        	<tr class="header-row">
	          <td><b>${uiLabelMap.ProjectName}</b></td>
	          <td><b>${uiLabelMap.StatusRelease}</b></td>
	          <td><b>${uiLabelMap.IsPublic}</b></td>
	          <td></td>
	          <td></td>
	          <td></td>
	        </tr>
	        <tr>
	          <td>${product.productName!}[${product.productId!}]</td>
	          <td>
	          	<#if (IfPublic?? && IfPublic = "1") && (IfRelease?? && IfRelease = "1")>
	          		<span class="uk-badge uk-badge-success">${uiLabelMap.HaveReleased}</span>
	          	<#elseif (IfPublic?? && IfPublic = "0") && (IfRelease?? && IfRelease = "1")>
	          		<span class="uk-badge uk-badge-warning">${uiLabelMap.UnPublicReleased}</span>
	          	<#else>
	          		<span class="uk-badge uk-badge-warning">${uiLabelMap.UnReleased}</span>
	          	</#if>
	          </td>
	          <td><#if IfPublic?? && IfPublic = "1"><span class="uk-badge uk-badge-success">${uiLabelMap.OnPublic}</span><#else><span class="uk-badge uk-badge-warning">${uiLabelMap.UnPublic}</span></#if></td>
	          <td>
	            <#if IfPublic?? && IfPublic = "1">
	            	<form method="post" action="<@ofbizUrl>removePublicProject</@ofbizUrl>" id="removePublicProject">
			            <input type="hidden" name="productId" value="${product.productId}" />
			            <input type="hidden" name="fromDate" value="${PublicFromDate}" />
			            <input type="hidden" name="productCategoryId" value="${ProductCategoryPublicId}" />
						<a href="javascript:document.getElementById('removePublicProject').submit();" class="button btn-border color3 btn-xs btn-radius" type="submit"><i class="fa fa-trash"></i>&nbsp;${uiLabelMap.Hide}</a>
					</form>
	            <#else>
	            	<form method="post" action="<@ofbizUrl>addPublicProject</@ofbizUrl>" id="addPublicProject">
			            <input type="hidden" name="productId" value="${product.productId}" />
			            <input type="hidden" name="fromDate" value="${nowTimestamp}" />
			            <input type="hidden" name="productCategoryId" value="${ProductCategoryPublicId}" />
						<a href="javascript:document.getElementById('addPublicProject').submit();" class="button btn-border color3 btn-xs btn-radius" type="submit"><i class="fa "></i>&nbsp;${uiLabelMap.Public}</a>
					</form>
	            </#if>
	          </td>
	          <td>
	          	<#if IfRelease?? && IfRelease = "1">
	          		<#list ProductCategory as ProductCategory>
						<#list ProductCategoryMemberRelease as ProductCategoryMemberRelease>
						<#if ProductCategory.primaryProductCategoryId = ProductCategoryMemberRelease.productCategoryId>
		            	<div><span class="uk-badge uk-badge-success">${ProductCategory.productName}-[${ProductCategory.primaryProductCategoryId}]</span>
		            	<form style="display: inline-block;" method="post" action="<@ofbizUrl>removeReleaseProject</@ofbizUrl>" id="removeReleaseProject_${ProductCategoryMemberRelease.productCategoryId}">
				            <input type="hidden" name="productId" value="${product.productId}" />
				            <input type="hidden" name="fromDate" value="${ProductCategoryMemberRelease.fromDate}" />
				            <input type="hidden" name="productCategoryId" value="${ProductCategoryMemberRelease.productCategoryId}" />
							<a href="javascript:document.getElementById('removeReleaseProject_${ProductCategoryMemberRelease.productCategoryId}').submit();" class="button btn-border color3 btn-xs btn-radius" type="submit"><i class="fa fa-trash"></i>&nbsp;${uiLabelMap.Offtheshelf}</a>
						</form></div>
						</#if>
						</#list>
					</#list>
	            </#if>
	            </td>
	            <td>	
	            	<form method="post" action="<@ofbizUrl>addReleaseProject</@ofbizUrl>" id="addReleaseProject">
			            <input type="hidden" name="productId" value="${product.productId}" />
			            <input type="hidden" name="fromDate" value="${nowTimestamp}" />
			            <select name="productCategoryId" class="uk-form">
		            	<#list ProductCategory as ProductCategory>
							<option value="${ProductCategory.primaryProductCategoryId}">${ProductCategory.productName}-[${ProductCategory.primaryProductCategoryId}]</option>
						</#list> 
			            </select>
						<a href="javascript:document.getElementById('addReleaseProject').submit();" class="button btn-border color3 btn-xs btn-radius" type="submit"><i class="fa "></i>&nbsp;${uiLabelMap.Realease}</a>
					</form>
	            </td>
	        </tr>
        </table>
    </div>
</div>
