<div class="md-card">
	<div class="md-card-toolbar">
    	<h3 class="md-card-toolbar-heading-text">${uiLabelMap.CourseCategoryProjects}</h3>
   	</div>
   	<div class="md-card-content uk-overflow-container">
	 	<div class="dt_colVis_buttons"></div>
	    <table id="dt_tableExport"  class="uk-table uk-table-bordered uk-table-hover">
	      	<thead>
	          	<tr>
		            <th>${uiLabelMap.ProjectId}</th>
		            <th>${uiLabelMap.ProjectName}</th>
		            <th>${uiLabelMap.ProjectCreatedby}</th>
		            <th>${uiLabelMap.Teammates}</th>
		            <th>${uiLabelMap.ProjectCreatedDate}</th>
		            <th> </th>
	          	</tr>
	        </thead>
	        <tbody>
	      	<#list ProductAndCategoryMember as ProductAndCategoryMember>
          	<form name="deleteProjectFromCourseCategory_${ProductAndCategoryMember_index}" method="post" action="<@ofbizUrl>deleteProjectFromCourseCategory</@ofbizUrl>">
              <input type="hidden" name="productCategoryId" value="${productCategoryId}">
              <input type="hidden" name="fromDate" value="${ProductAndCategoryMember.fromDate}">
	          	<tr>
		            <td valign="center">
		            	${ProductAndCategoryMember.productId}
		            	<input type="hidden" name="productId" value="${ProductAndCategoryMember.productId}">
		            </td>
		            <td valign="center">
		            	<#if ProductAndCategoryMember.largeImageUrl??>
		            	<img src="${ProductAndCategoryMember.largeImageUrl!}" width="100px"/>
	            		</#if>
	              	<a href="/products/p_${ProductAndCategoryMember.productId}" target="_blank" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;">
	              		${ProductAndCategoryMember.productName!}
	              	</a>
		            </td>
		            <td valign="center">
		            	<#if ProductAndCategoryMember.createdByUserLogin??>
		            	<#list UserLoginAndPartyDetails as UserLoginAndPartyDetails>
		            		<#if UserLoginAndPartyDetails.userLoginId = ProductAndCategoryMember.createdByUserLogin>
	          	 				${UserLoginAndPartyDetails.nickname!}-[${UserLoginAndPartyDetails.userLoginId!}]
		            		</#if>
		            	</#list>
		            	</#if>
		            </td>
		            <td valign="center">
	              		<#list ProductAndRole as ProductAndRole>
	              			<#if ProductAndRole.productId = ProductAndCategoryMember.productId>
	              				<#if ProductAndRole.partyId??>
		              				<#list UserLoginAndPartyDetails as UserLoginAndPartyDetails>
										<#if UserLoginAndPartyDetails.partyId?? && UserLoginAndPartyDetails.partyId = ProductAndRole.partyId>
											<#assign UserLogin = UserLoginAndPartyDetails.userLoginId!/>
										</#if>
									</#list>
								</#if>
								<#if ProductAndRole.roleTypeId = "_NA_"><span class="uk-badge"><i class="material-icons md-color-light-green-50">people</i>&nbsp;${uiLabelMap.Teammates}[${uiLabelMap.CommonNormal}]</span></#if>
                        		<#if ProductAndRole.roleTypeId = "BUSINESSMAN"><span class="uk-badge uk-badge-primary"><i class="material-icons md-color-light-green-50">person</i>&nbsp;${uiLabelMap.Teammates}[${uiLabelMap.CommonManager}]</span></#if>
                        		${ProductAndRole.nickname!}-[${UserLogin!}]-[${uiLabelMap.PartyId}:${ProductAndRole.partyId!}]
	              				<br/>
	              			</#if>
	              		</#list>
		            </td>
		            <td valign="center">
	              	${ProductAndCategoryMember.createdDate!}
		            </td>
		            <td valign="center">
		              	<a href="javascript:document.deleteProjectFromCourseCategory_${ProductAndCategoryMember_index}.submit()" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;"><i class="fa fa-edit"></i>&nbsp;${uiLabelMap.CommonDelete}</a>
		            </td>
		          </tr>
		        </form>
	      	</#list>
	      </tbody>
	    </table>
	</div>
</div>