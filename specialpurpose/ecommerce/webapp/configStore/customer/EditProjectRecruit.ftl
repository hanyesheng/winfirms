<script type="text/javascript" src="<@ofbizContentUrl>/images/winfirms/js/laydate/laydate.js</@ofbizContentUrl>"></script>

<div class="screenlet md-card" id="screenlet_1">
	<div class="screenlet-title-bar md-card-toolbar"><ul><li class="h3">${uiLabelMap.CommonEdit}${uiLabelMap.RecruitInfo}</li></ul><br class="clear"></div>
		<div id="screenlet_1_col" class="screenlet-body md-card-content uk-overflow-container">
    	<#if dataResourceId??>
    	<form method="post" action="<@ofbizUrl>updateProductRecruitInfos</@ofbizUrl>" id="EditProductRecruitInfos" class="basic-form" onsubmit="javascript:submitFormDisableSubmits(this)" name="EditProductRecruitInfos">
  		<#else>
  		<form method="post" action="<@ofbizUrl>createProductRecruitInfos</@ofbizUrl>" id="EditProductRecruitInfos" class="basic-form" onsubmit="javascript:submitFormDisableSubmits(this)" name="EditProductRecruitInfos">
  		</#if>
  			<input type="hidden" name="productId" value="${product.productId!}" id="EditProductRecruitInfos_productId">
  			<input type="hidden" name="contentId" value="${productContent.contentId!}" id="EditProductRecruitInfos_contentId">
  			<input type="hidden" name="productContentTypeId" value="${productContent.productContentTypeId!}" id="EditProductRecruitInfos_productContentTypeId">
  			<input type="hidden" name="fromDate" value="${productContent.fromDate!}" id="EditProductRecruitInfos_fromDate">
  			<input type="hidden" name="purchaseFromDate" id="EditProductRecruitInfos_purchaseFromDate">
  			<input type="hidden" name="purchaseThruDate" id="EditProductRecruitInfos_purchaseThruDate">
  			<input type="hidden" name="useCountLimit" id="EditProductRecruitInfos_useCountLimit">
  			<input type="hidden" name="useTime" id="EditProductRecruitInfos_useTime">
  			<input type="hidden" name="useTimeUomId" id="EditProductRecruitInfos_useTimeUomId">
  			<input type="hidden" name="useRoleTypeId" id="EditProductRecruitInfos_useRoleTypeId">
  			<input type="hidden" name="sequenceNum" id="EditProductRecruitInfos_sequenceNum">
  			<input type="hidden" name="textDataResourceId" value="${dataResourceId!}" id="EditProductRecruitInfos_textDataResourceId">
  			<input type="hidden" class="" name="thruDate_i18n" title="" size="25" maxlength="30" value="" id="EditProductRecruitInfos_thruDate_i18n">
  			<table cellspacing="0" class="basic-table  uk-table ">
	  			<tbody>
	  				<#if dataResourceId??>
	  				<tr>
		  				<td class="label">
							<label for="EditProductRecruitInfos_contentId" id="EditProductRecruitInfos_contentId_title">${uiLabelMap.ProductContentId}</label>  
		  				</td>
						<td>
							${productContent.contentId!}&nbsp;&nbsp;<span class="tooltip">${uiLabelMap.ProductNotModificationRecrationProductContentAssociation}</span>
		  				</td>
	  				</tr>
	  				</#if>
	  				<tr>
				  		<td class="label">
							<label for="EditProductRecruitInfos_productContentTypeId" id="EditProductRecruitInfos_productContentTypeId_title">${uiLabelMap.ProductProductContentTypeId}</label>  
				  		</td>
					  	<td>
							${uiLabelMap.RecruitInfo}  
					  	</td>
				  	</tr>
				  	<#if dataResourceId??>
				  	<tr>
					  	<td class="label">
							<label for="EditProductRecruitInfos_fromDate" id="EditProductRecruitInfos_fromDate_title">${uiLabelMap.CommonFromDate}</label>  
					  	</td>
				  		<td>
							${(productContent.fromDate?substring(0,19))!}
					  	</td>
				  	</tr>
				  	<#else>
				  	<tr>
			  			<td class="label">
							<label for="EditProductRecruitInfos_thruDate" id="EditProductRecruitInfos_thruDate_title">${uiLabelMap.CommonFromDate}</label>  
			  			</td>
					  	<td>
	  						<input type="text" class="" name="thruDate_i18n" title="" size="25" maxlength="30" value="" id="EditProductRecruitInfos_Date">    
						</td>
	  				</tr>
				  	</#if>
				  	<#if dataResourceId??>
				  	<tr>
					  	<td class="label">
							<label for="wysiwyg_ckeditor" id="EditProductRecruitInfos_text_title">${uiLabelMap.ProductText}*</label>  
					  	</td>
					  	<#list dataText as dataText>
							<#if dataText.dataResourceId = dataResourceId>
								<#assign textData = dataText.textData! />
							</#if>
						</#list>
					  	<td>
							<textarea id="wysiwyg_ckeditor" name="text" class="dojo-ResizableTextArea" cols="60" rows="7">${StringUtil.wrapString(textData!)}</textarea>
					  	</td>
				  	</tr>
				  	<#else>
			  		<tr>
					  	<td class="label">
							<label for="wysiwyg_ckeditor" id="EditProductRecruitInfos_text_title">${uiLabelMap.ProductText}*</label>  
					  	</td>
					  	<td>
							<textarea id="wysiwyg_ckeditor" name="text" class="dojo-ResizableTextArea" cols="60" rows="7"></textarea>
					  	</td>
				  	</tr>
				  	</#if>
	  				<tr>
					  	<td class="label">&nbsp;</td>
					  	<td>
					    	<input type="submit" class="smallSubmit" name="submitButton" value="<#if dataResourceId??>${uiLabelMap.CommonUpdate}<#else>${uiLabelMap.CommonCreate}</#if>">
					  	</td>
				  	</tr>
	  			</tbody>
	  		</table>
        </form>
    </div>
</div>
<script>
	//执行一个laydate实例
	laydate.render({
	  elem: '#EditProductRecruitInfos_Date',//指定元素
	  type: 'datetime'
	});
</script>
