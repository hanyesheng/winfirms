<script language="JavaScript" type="text/javascript">
function insertImageName(type,nameValue) {
  eval('document.productCategoryForm.' + type + 'ImageUrl.value=nameValue;');
};
</script>
<#if fileType?has_content>
    <div class="screenlet md-card">
        <div class="screenlet-title-bar md-card-toolbar">
            <h3>${uiLabelMap.ProductResultOfImageUpload}</h3>
        </div>
        <div class="screenlet-body md-card-content uk-overflow-container">
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
<div class="screenlet md-card">
<#if ! productCategory?has_content>
    <#if productCategoryId?has_content>
        <div class="screenlet-title-bar md-card-toolbar">
          <ul>
            <li class="h3">${uiLabelMap.ProductCouldNotFindProductCategoryWithId} "${productCategoryId}".</li>
          </ul>
          <br class="clear" />
        </div>
        <div class="screenlet-body md-card-content uk-overflow-container">
            <form action="<@ofbizUrl>createProductCategory</@ofbizUrl>" method="post" style="margin: 0;" name="productCategoryForm">
                <table cellspacing="0" class="basic-table uk-table">
                    <tr>
                        <td align="right" class="label">${uiLabelMap.ProductProductCategoryId}</td>
                        <td>&nbsp;</td>
                        <td>
                            <input type="text" name="productCategoryId" size="20" maxlength="40" value="${productCategoryId}"/>
                        </td>
                    </tr>
    <#else>
        <div class="screenlet-title-bar md-card-toolbar">
          <ul>
            <li class="h3">${uiLabelMap.CreateCategory}</li>
          </ul>
          <br class="clear" />
        </div>
        <div class="screenlet-body md-card-content uk-overflow-container">
            <form action="<@ofbizUrl>createProductCategory</@ofbizUrl>" method="post" style="margin: 0;" name="productCategoryForm">
                <table cellspacing="0" class="basic-table uk-table">
                   
    </#if>
<#else>
		<div class="screenlet-title-bar md-card-toolbar">
      <ul>
        <li class="h3">${uiLabelMap.CategoryInfo}</li>
      </ul>
      <br class="clear" />
   	</div>
    <div class="screenlet-body md-card-content uk-overflow-container">
        <form action="<@ofbizUrl>updateProductCategory</@ofbizUrl>" method="post" style="margin: 0;" name="productCategoryForm">
            <input type="hidden" name="productCategoryId" value="${productCategoryId}"/>
            <table cellspacing="0" class="basic-table uk-table">
                <tr>
                    <td align="right" class="label">${uiLabelMap.ProductProductCategoryId}</td>
                    <td>&nbsp;</td>
                    <td>
                      <b>${productCategoryId}</b> (${uiLabelMap.ProductNotModificationRecreationCategory}.)
                    </td>
                </tr>
</#if>
                
                <tr>
                    <td width="26%" align="right" class="label">${uiLabelMap.CourseCategoryName}</td>
                    <td>&nbsp;</td>
                    <td width="74%"><input type="text" value="${(productCategory.categoryName)!}" name="categoryName" size="60" maxlength="60"/></td>
                </tr>
                <tr>
                    <td width="26%" align="right" class="label">${uiLabelMap.CourseCategoryDescription}</td>
                    <td>&nbsp;</td>
                    <td width="74%"><textarea name="description" cols="60" rows="2"><#if productCategory?has_content>${(productCategory.description)!}</#if></textarea></td>
                </tr>
                <input type="hidden" name="detailScreen" value="component://ecommerce/widget/configStore/CatalogScreens.xml#projectCategorydetail" />
                <input type="hidden" name="productCategoryTypeId" value="COURSE_PROJECT" />
                <input type="hidden" name="createdByUserLogin" value="${userLoginId!}" />
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td><input type="submit" name="Update" value="${uiLabelMap.CommonSave}"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>