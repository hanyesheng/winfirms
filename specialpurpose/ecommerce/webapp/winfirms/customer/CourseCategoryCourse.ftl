<script language="JavaScript" type="text/javascript">
function insertImageName(type,nameValue) {
  eval('document.productCategoryForm.' + type + 'ImageUrl.value=nameValue;');
};
</script>
<div class="screenlet md-card">
	<div class="screenlet-title-bar md-card-toolbar">
	  <ul>
	    <li class="h3">${uiLabelMap.CourseCategoryCourse}</li>
	  </ul>
	  <br class="clear" />
	</div>
	<div class="screenlet-body md-card-content uk-overflow-container">
	    <form action="<@ofbizUrl>courseCategoryToCourse</@ofbizUrl>" method="post" style="margin: 0;" name="courseCategoryToCourse">
	    	<table cellspacing="0" class="basic-table uk-table">
	        <#list Product as Product>
	        	<#assign productId = Product.productId>
	        	<#assign productName = Product.productName>
	        </#list>
	        <#if productId??>
	        <tr>
	            <td align="right" class="label">${uiLabelMap.NowCourseCategoryCourse}</td>
	            <td>&nbsp;</td>
	            <td>
	                <input type="text" disabled="disabled" size="20" maxlength="40" value="[${productId}]-${productName}"/>
	                <a href="<@ofbizUrl>courseInfo?productId=${productId}</@ofbizUrl>" target="_blank" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;"><i class="fa fa-edit"></i>&nbsp;${uiLabelMap.CommonEdit}${uiLabelMap.Course}</a>
	            </td>
	        </tr>
	        </#if>
	        <tr>
	            <td width="26%" align="right" class="label">${uiLabelMap.EidtCourseCategoryCourse}</td>
	            <td>&nbsp;</td>
	            <td width="74%">
	            	<select class="" name="productId" id="productId" >      
		            	<option value=""></option>
		          		<#list ProductSelect as ProductSelect>
		          			<option value="${ProductSelect.productId}">[${ProductSelect.productId}]-${ProductSelect.productName}</option>     
		          		</#list>
		            </select>
	            </td>
	        </tr>
	        <input type="hidden" name="primaryProductCategoryId" value="${productCategoryId}" />
	        <input type="hidden" name="productCategoryId" value="${productCategoryId}" />
	        <tr>
	            <td colspan="2">&nbsp;</td>
	            <td><input type="submit" name="Update" value="${uiLabelMap.CommonSave}"/></td>
	        </tr>
	    	</table>
		</form>
	</div>
</div>