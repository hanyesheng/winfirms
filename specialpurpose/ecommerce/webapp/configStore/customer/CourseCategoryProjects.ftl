<div class="md-card">
	<div class="md-card-toolbar">
    	<h3 class="md-card-toolbar-heading-text">${uiLabelMap.CourseCategoryProjects}</h3>
   	</div>
   	<div class="md-card-content uk-overflow-container">
	    <table class="uk-table uk-table-bordered uk-table-hover">
	      	<thead>
	          	<tr>
		            <th>${uiLabelMap.ProjectId}</th>
		            <th>${uiLabelMap.ProjectName}</th>
		            <th>${uiLabelMap.ProjectCreatedby}</th>
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
	              	<a href="/store/products/p_${ProductAndCategoryMember.productId}" target="_blank" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;">
	              		${ProductAndCategoryMember.productName!}
	              	</a>
		            </td>
		            <td valign="center">
		            	<#if ProductAndCategoryMember.createdByUserLogin??>
		            	<#list UserLoginAndPartyDetails as UserLoginAndPartyDetails>
		            		<#if UserLoginAndPartyDetails.userLoginId = ProductAndCategoryMember.createdByUserLogin>
	          	 				${UserLoginAndPartyDetails.nickname!}-[${UserLoginAndPartyDetails.firstName!}${UserLoginAndPartyDetails.lastName!}]
		            		</#if>
		            	</#list>
		            	</#if>
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