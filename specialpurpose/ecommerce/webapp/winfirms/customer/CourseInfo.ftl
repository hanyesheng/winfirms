<#if product??>
<script type="text/javascript" src="<@ofbizContentUrl>/images/winfirms/js/laydate/laydate.js</@ofbizContentUrl>"></script>
<script language="JavaScript" type="text/javascript">
    function insertNowTimestamp(field) {
        eval('document.productForm.' + field + '.value="${nowTimestampString}";');
    };
    function insertImageName(type,nameValue) {
        eval('document.productForm.' + type + 'ImageUrl.value=nameValue;');
    };
</script>
    <#if fileType?has_content>
<h3>${uiLabelMap.ProductResultOfImageUpload}</h3>
        <#if !(clientFileName?has_content)>
    <div>${uiLabelMap.ProductNoFileSpecifiedForUpload}.</div>
        <#else>
    <div>${uiLabelMap.ProductTheFileOnYourComputer}: <b>${clientFileName!}</b></div>
    <div>${uiLabelMap.ProductServerFileName}: <b>${fileNameToUse!}</b></div>
    <div>${uiLabelMap.ProductServerDirectory}: <b>${imageServerPath!}</b></div>
    <div>${uiLabelMap.ProductTheUrlOfYourUploadedFile}: <b><a href="<@ofbizContentUrl>${imageUrl!}</@ofbizContentUrl>">${imageUrl!}</a></b></div>
        </#if>
    <br />
    </#if>
    <form action="<@ofbizUrl>updateCourseInfo</@ofbizUrl>" method="post" style="margin: 0;" name="productForm">
        <input type="hidden" name="productId" value="${productId!}"/>
        <table cellspacing="0" class="basic-table uk-table">
            <tr>
                <td align="right" valign="top"><b>${uiLabelMap.CourseName}</b></td>
                <td>&nbsp;</td>
                <td colspan="4" valign="top">
                    <input type="text" name="productName" value="${product.productName!}" size="30" maxlength="60"/>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top"><b>${uiLabelMap.CourseInfo}</b></td>
                <td>&nbsp;</td>
                <td colspan="4" valign="top">
                    <textarea name="description" cols="60" rows="2" maxlength="255">${(product.description)!}</textarea>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top"><b>${uiLabelMap.CommentInformation}</b></td>
                <td>&nbsp;</td>
                <td colspan="4" valign="top">
                    <textarea name="comments" cols="60" rows="2" maxlength="255">${(product.comments)!}</textarea>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top"><b>${uiLabelMap.CourseProjectCategory}</b></td>
                <td>&nbsp;</td>
                <td colspan="4" valign="top">
		            <select class="" name="primaryProductCategoryId" id="EditProduct_primaryProductCategoryId" >              
		            	<option value="">${(product.primaryProductCategoryId)!}</option>
		            	<option value=""></option>
		          		<#list ProductCategory as ProductCategory>
		          			<option value="${ProductCategory.productCategoryId}">[${ProductCategory.productCategoryId}]-${ProductCategory.categoryName}</option>     
		          		</#list>
		            </select>
	            </td>
            </tr>
            <tr>
                <td align="right" valign="top"><b>${uiLabelMap.ProductLongDescription}</b></td>
                <td>&nbsp;</td>
                <td colspan="4" valign="top">
                    <textarea id="wysiwyg_ckeditor" class="dojo-ResizableTextArea" name="longDescription" cols="60" rows="7">${(product.longDescription)!}</textarea>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top"><b>${uiLabelMap.ProjectCreatedDate}</b></td>
                <td>&nbsp;</td>
                <td colspan="4" valign="top">
                    <input type="text" id="releaseDate" name="releaseDate" value="${(product.releaseDate?substring(0,19))!}"/>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top"><b>${uiLabelMap.ProjectSupportDate}</b></td>
                <td>&nbsp;</td>
                <td colspan="4" valign="top">
                    <input type="text" name="supportDiscontinuationDate" id="supportDiscontinuationDate" value="${(product.supportDiscontinuationDate?substring(0,19))!}"/>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    <div><b>${uiLabelMap.ProductLargeImage}</b></div>
    				<#if (product.largeImageUrl)??>
                    <a href="<@ofbizContentUrl>${product.largeImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Large Image" src="<@ofbizContentUrl>${product.largeImageUrl}</@ofbizContentUrl>" style="width: 100px;" class="cssImgSmall"/></a>
    				</#if>
               	</td>
                <td>&nbsp;</td>
                <td colspan="4" valign="top">
                    <input type="text" name="largeImageUrl" value="${(product.largeImageUrl)?default('')}" size="60" maxlength="255"/>
    			</td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
                <td><input type="submit" name="Update" value="${uiLabelMap.CommonUpdate}" class="smallSubmit"/></td>
                <td colspan="3">&nbsp;</td>
            </tr>
        </table>
    </form>
    <script language="JavaScript" type="text/javascript">
        function setUploadUrl(newUrl) {
            var toExec = 'document.imageUploadForm.action="' + newUrl + '";';
            eval(toExec);
        };
    </script>
    <script>
		//执行一个laydate实例
		laydate.render({
		  elem: '#releaseDate',//指定元素
		  type: 'datetime'
		});
		laydate.render({
		  elem: '#supportDiscontinuationDate',//指定元素
		  type: 'datetime'
		});
	</script>
    <form method="post" enctype="multipart/form-data" action="<@ofbizUrl>uploadCourseImage?productId=${productId}&amp;upload_file_type=large</@ofbizUrl>" name="imageUploadForm">
        <table cellspacing="0" class="basic-table uk-table">
            <tr>
                <td align="right" valign="top">
                    <input type="file" size="50" name="fname"/>
                </td>
                <td>&nbsp;</td>
                <td colspan="4" valign="top">
                    <input type="submit" class="smallSubmit" value="${uiLabelMap.ProductUploadImage}"/>
                </td>
            </tr>
        </table>
    </form>
</#if>
