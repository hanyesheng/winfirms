<div class="screenlet md-card" id="screenlet_1">
	<div class="screenlet-title-bar md-card-toolbar">
		<ul><li class="h3">${uiLabelMap.Teammates}${uiLabelMap.CommonUpload}</li></ul><br class="clear">
	</div>
	<div id="screenlet_1_col" class="screenlet-body md-card-content uk-overflow-container">
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
			  		<label for="ListProjectVideoIntro_fromDate" id="ListProjectVideoIntro_fromDate_title">${uiLabelMap.Teammates}</label>  
			  	</td>
			  	<td>
					<label for="ListProjectVideoIntro_fromDate" id="ListProjectVideoIntro_fromDate_title">${uiLabelMap.ProjectCreatedDate}</label>  
			  	</td>
			  	<td>&nbsp;</td>
			  	</tr>
	  	</thead>
	  	<tbody>
			<#list ProductContentAndInfoUpload as ProductContentAndInfoUpload>
			<#assign Uploader = null!/>
	  		<tr>
	  			<td>
	    			${ProductContentAndInfoUpload.contentName!}
	  			</td>
		  		<td>
					${uiLabelMap.FileManager}
			  	</td>
			  	<td>
			  		<#list UserLoginAndPartyDetails as UserLoginAndPartyDetails>
			  			<#if UserLoginAndPartyDetails.userLoginId = ProductContentAndInfoUpload.createdByUserLogin>
			  				<#assign Uploader = UserLoginAndPartyDetails.nickname!/>
			  			</#if>
			  		</#list>
					${Uploader!}-[${ProductContentAndInfoUpload.createdByUserLogin!}]
			  	</td>
		  		<td>
					${ProductContentAndInfoUpload.fromDate!} 
			  	</td>
			  	<td>
					<a href="/partymgr/control/img/${Uploader!}-[${ProductContentAndInfoUpload.createdByUserLogin!}]-${ProductContentAndInfoUpload.contentName}?imgId=${(ProductContentAndInfoUpload.dataResourceId)!}">
						${uiLabelMap.CommonDownload}
					</a>
	  			</td>
	  		</tr>
			</#list>
		</tbody>
	</table>
	</div>
</div>