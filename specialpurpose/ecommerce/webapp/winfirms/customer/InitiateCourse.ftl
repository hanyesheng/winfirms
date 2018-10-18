<#list RoleTypeAndParty as RoleTypeAndParty>
	<#assign bus = RoleTypeAndParty.roleTypeId>
</#list>
<#list ProductCategory as ProductCategory>
	<#assign categorySeedId = ProductCategory.productCategoryId>
</#list>
<#list Person as Person>
	<#assign nickname = Person.nickname!/>
</#list> 
<script type="text/javascript" src="<@ofbizContentUrl>/images/winfirms/js/laydate/laydate.js</@ofbizContentUrl>"></script>
<div class="md-card">
	<#if bus?? && bus = "TEACHER">
		<div class="md-card-toolbar">
	    	<h3 class="md-card-toolbar-heading-text">${uiLabelMap.InitiateCourse}</h3>
	   	</div>
	   	<div class="md-card-content">
		<#if categorySeedId?has_content>
			<form method="post" action="<@ofbizUrl>createCourse</@ofbizUrl>">
			<table class="uk-table uk-table-hover uk-table-bordered">
				<input type="hidden" name="isCreate" id="isCreate" value="true"/>
				<input type="hidden" name="productTypeId" id="productTypeId" value="COURSE"/>
				<input type="hidden" name="internalName" id="internalName" value="${nickname!}"/>
				<tr>
					<td>${uiLabelMap.CourseName}&nbsp;*&nbsp;:</td>
					<td>
						<input required="required" type="text" class="" id="url1" name="productName" id="productName" value="${requestParameters.productName!}" placeholder="${uiLabelMap.NotMoreThan13Words}" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
					</td>
				</tr>
				<tr>
					<td>${uiLabelMap.CourseInfo}&nbsp;*&nbsp;:</td>
					<td>
						<input required="required" type="text" class="" id="url2" name="description" id="description" value="${requestParameters.description!}" placeholder="${uiLabelMap.OneWordInformation1}" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
					</td>
				</tr>
				<tr>
					<td>${uiLabelMap.CommentInformation}:</td>
					<td>
						<input required="required" type="text" class="" id="url3" name="comments"  id="comments" value="${requestParameters.comments!}" placeholder="${uiLabelMap.CreatProjectComments}" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
					</td>
				</tr>
				<tr>
					<td>${uiLabelMap.ProductSupportThruDate}:</td>
					<td>
						<input type="text" id="supportDiscontinuationDate" name="supportDiscontinuationDate" id="supportDiscontinuationDate" value="${requestParameters.supportDiscontinuationDate!}" placeholder="${uiLabelMap.ProductSupportThruDate}" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
					</td>
				</tr>
			</table>
			<div class="alert info"><button type="submit" class="md-btn md-btn-block md-btn-flat md-btn-flat-primary">${uiLabelMap.NextPage}</button></div>
			</form>
			<script>
			//执行一个laydate实例
			laydate.render({
			  elem: '#supportDiscontinuationDate',//指定元素
			  type: 'datetime'
			});
			</script>
		<#else/>
			<div class="md-card md-card-danger">
				<div class="md-card-content">
					<a href="javascript: void(0);" class="button btn-border btn-small btn-radius white btn-center" data-container="body" data-toggle="popover" data-placement="top" title="${uiLabelMap.CannotCreatNow}" data-content="${uiLabelMap.CannotCreatNow}">
					  ${uiLabelMap.CannotCreatNow}
					</a>
				</div>
			</div>
		</#if>	
		</div>
	<#else>
		<div class="md-card md-card-danger">
			<div class="md-card-content">
				<p>${uiLabelMap.NoRoleToOperate}</p>
				<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.CommonGoBack}</a>
			</div>
		</div>
	</#if>
</div>