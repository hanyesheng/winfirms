<table cellspacing="0" class="basic-table uk-table">
  	<thead>
	  	<tr class="header-row">
		  	<td>
				<label for="ListProjectVideoIntro_editProductContentInfo" id="ListProjectVideoIntro_editProductContentInfo_title">${uiLabelMap.ProductContent}</label>  
		  	</td>
		  	<td>
				<label for="ListProjectVideoIntro_productContentTypeId" id="ListProjectVideoIntro_productContentTypeId_title">${uiLabelMap.ProductContentType}</label>  
		  	</td>
		  	<td>
				<label for="ListProjectVideoIntro_fromDate" id="ListProjectVideoIntro_fromDate_title">${uiLabelMap.ProjectCreatedDate}</label>  
		  	</td>
		  	<td>&nbsp;</td>
		  	</tr>
  	</thead>
  	<tbody>
		<#list productContent as productContent>
  		<tr>
  			<td>
    			${productContent.contentName!}&nbsp;&nbsp;
    			<a href="/partymgr/control/img/${productContent.contentName}?imgId=${(productContent.dataResourceId)!}" target="_blank">
					${uiLabelMap.CommonDownload}
				</a>
  			</td>
	  		<td>
				${uiLabelMap.FileManager}
		  	</td>
	  		<td>
				${productContent.fromDate!} 
		  	</td>
  			<td>
				<form method="post" action="<@ofbizUrl>removeProjectFile</@ofbizUrl>" onsubmit="javascript:submitFormDisableSubmits(this)" name="ListProjectVideoIntro_${productContent_index}_removeContent">
					<input name="fromDate" value="${productContent.fromDate!}" type="hidden">
					<input name="productId" value="${productContent.productId!}" type="hidden">
					<input name="contentId" value="${productContent.contentId!}" type="hidden">
					<input name="productContentTypeId" value="${productContent.productContentTypeId!}" type="hidden">
				</form>
				<a class="buttontext" href="javascript:document.ListProjectVideoIntro_${productContent_index}_removeContent.submit()">${uiLabelMap.CommonDelete}</a>  
  			</td>
  		</tr>
		</#list>
	</tbody>
</table>