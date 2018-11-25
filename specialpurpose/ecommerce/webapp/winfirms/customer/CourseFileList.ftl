<table cellspacing="0" class="basic-table uk-table">
  	<thead>
	  	<tr class="header-row">
		  	<td>
				<label for="ListCourseVideoIntro_editProductContentInfo" id="ListCourseVideoIntro_editProductContentInfo_title">${uiLabelMap.ProductContent}</label>  
		  	</td>
		  	<td>
				<label for="ListCourseVideoIntro_productContentTypeId" id="ListCourseVideoIntro_productContentTypeId_title">${uiLabelMap.ProductContentType}</label>  
		  	</td>
		  	<td>
				<label for="ListCourseVideoIntro_fromDate" id="ListCourseVideoIntro_fromDate_title">${uiLabelMap.ProjectCreatedDate}</label>  
		  	</td>
		  	<td>&nbsp;</td>
		  	<td>&nbsp;</td>
		  	</tr>
  	</thead>
  	<tbody>
		<#list productContent as productContent>
  		<tr>
  			<td>
    			${productContent.contentName!}[${productContent.contentId!}]
    			<a class="buttontext" href="<@ofbizUrl>updateCourseVideo?fromDate=${productContent.fromDate!}&productId=${productContent.productId!}&contentId=${productContent.contentId!}&productContentTypeId=${productContent.productContentTypeId!}</@ofbizUrl>" title="${uiLabelMap.ProductContent}">
      			${uiLabelMap.CommonEdit}
    			</a>
  			</td>
	  		<td>
				${uiLabelMap.FileManager}
		  	</td>
	  		<td>
				${productContent.fromDate!} 
		  	</td>
		  	<td>
				<a href="/partymgr/control/img/${productContent.contentName}?imgId=${(productContent.dataResourceId)!}">
					${uiLabelMap.CommonDownload}
				</a>
  			</td>
  			<td>
				<form method="post" action="<@ofbizUrl>removeCourseFile</@ofbizUrl>" onsubmit="javascript:submitFormDisableSubmits(this)" name="ListCourseVideoIntro_${productContent_index}_removeContent">
					<input name="fromDate" value="${productContent.fromDate!}" type="hidden">
					<input name="productId" value="${productContent.productId!}" type="hidden">
					<input name="contentId" value="${productContent.contentId!}" type="hidden">
					<input name="productContentTypeId" value="${productContent.productContentTypeId!}" type="hidden">
				</form>
				<a class="buttontext" href="javascript:document.ListCourseVideoIntro_${productContent_index}_removeContent.submit()">${uiLabelMap.CommonDelete}</a>  
  			</td>
  		</tr>
		</#list>
	</tbody>
</table>