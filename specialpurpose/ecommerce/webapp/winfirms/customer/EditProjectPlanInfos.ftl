<script type="text/javascript" src="<@ofbizContentUrl>/images/winfirms/js/laydate/laydate.js</@ofbizContentUrl>"></script>

<div class="screenlet md-card" id="screenlet_1">
	<div class="screenlet-title-bar md-card-toolbar"><ul><li class="h3">${uiLabelMap.CommonEdit}${uiLabelMap.BusinessPlan}</li></ul><br class="clear"></div>
		<div id="screenlet_1_col" class="screenlet-body md-card-content uk-overflow-container">
    	<#if dataResourceId??>
    	<form method="post" action="<@ofbizUrl>updateProjectPlanInfos</@ofbizUrl>" id="EditProductPlanInfos" class="basic-form" onsubmit="javascript:submitFormDisableSubmits(this)" name="updateProjectPlanInfos">
  		<#else>
  		<form method="post" action="<@ofbizUrl>createProjectPlanInfos</@ofbizUrl>" id="EditProductPlanInfos" class="basic-form" onsubmit="javascript:submitFormDisableSubmits(this)" name="createProjectPlanInfos">
  		</#if>
  			<input type="hidden" name="productId" value="${product.productId!}" id="EditProductPlanInfos_productId">
  			<input type="hidden" name="contentId" value="${productContent.contentId!}" id="EditProductPlanInfos_contentId">
  			<input type="hidden" name="productContentTypeId" value="${productContent.productContentTypeId!}" id="EditProductPlanInfos_productContentTypeId">
  			<input type="hidden" name="fromDate" value="${productContent.fromDate!}" id="EditProductPlanInfos_fromDate">
  			<input type="hidden" name="purchaseFromDate" id="EditProductPlanInfos_purchaseFromDate">
  			<input type="hidden" name="purchaseThruDate" id="EditProductPlanInfos_purchaseThruDate">
  			<input type="hidden" name="useCountLimit" id="EditProductPlanInfos_useCountLimit">
  			<input type="hidden" name="useTime" id="EditProductPlanInfos_useTime">
  			<input type="hidden" name="useTimeUomId" id="EditProductPlanInfos_useTimeUomId">
  			<input type="hidden" name="useRoleTypeId" id="EditProductPlanInfos_useRoleTypeId">
  			<input type="hidden" name="sequenceNum" id="EditProductPlanInfos_sequenceNum">
  			<input type="hidden" name="textDataResourceId" value="${dataResourceId!}" id="EditProductPlanInfos_textDataResourceId">
  			<input type="hidden" class="" name="thruDate_i18n" title="" size="25" maxlength="30" value="" id="EditProductPlanInfos_thruDate_i18n">
  			<table cellspacing="0" class="basic-table  uk-table ">
	  			<tbody>
	  				<#if dataResourceId??>
	  				<tr>
		  				<td class="label">
							<label for="EditProductPlanInfos_contentId" id="EditProductPlanInfos_contentId_title">${uiLabelMap.ProductContentId}</label>  
		  				</td>
						<td>
							${productContent.contentId!}&nbsp;&nbsp;<span class="tooltip">${uiLabelMap.ProductNotModificationRecrationProductContentAssociation}</span>
		  				</td>
	  				</tr>
	  				</#if>
	  				<tr>
				  		<td class="label">
							<label for="EditProductPlanInfos_productContentTypeId" id="EditProductPlanInfos_productContentTypeId_title">${uiLabelMap.ProductProductContentTypeId}</label>  
				  		</td>
					  	<td>
							<#if PlanTypeDescription??>${PlanTypeDescription!}</#if>
					  	</td>
				  	</tr>
				  	<#if dataResourceId??>
				  	<tr>
					  	<td class="label">
							<label for="EditProductPlanInfos_fromDate" id="EditProductPlanInfos_fromDate_title">${uiLabelMap.CommonFromDate}</label>  
					  	</td>
				  		<td>
							${(productContent.fromDate?substring(0,19))!}
					  	</td>
				  	</tr>
				  	<#else>
				  	<tr>
			  			<td class="label">
							<label for="EditProductPlanInfos_thruDate" id="EditProductPlanInfos_thruDate_title">${uiLabelMap.CommonFromDate}*</label>  
			  			</td>
					  	<td>
	  						<input type="text" class="" name="thruDate_i18n" title="" size="25" maxlength="30" value="" id="EditProductPlanInfos_Date">    
						</td>
	  				</tr>
				  	</#if>
				  	<#if dataResourceId??>
				  	<tr>
					  	<td class="label">
							<label for="wysiwyg_ckeditor" id="EditProductPlanInfos_text_title">${uiLabelMap.ProductText}*</label>  
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
							<label for="wysiwyg_ckeditor" id="EditProductPlanInfos_text_title">${uiLabelMap.ProductText}*</label>  
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
	  elem: '#EditProductPlanInfos_Date',//指定元素
	  type: 'datetime'
	});
</script>
