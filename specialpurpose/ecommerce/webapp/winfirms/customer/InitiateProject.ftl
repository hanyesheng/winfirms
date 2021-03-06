<#list RoleTypeAndParty as RoleTypeAndParty>
	<#assign bus = RoleTypeAndParty.roleTypeId>
</#list>
<#list Person as Person>
	<#assign nickname = Person.nickname!/>
</#list> 
<script type="text/javascript" src="<@ofbizContentUrl>/images/winfirms/js/laydate/laydate.js</@ofbizContentUrl>"></script>
<div class="md-card"  style="margin-top: 15px;">
	<#if bus?? && bus = "BUSINESSMAN">
		<div class="md-card-toolbar">
	    	<h3 class="md-card-toolbar-heading-text">${uiLabelMap.CreatSeedProj}</h3>
	   	</div>
	   	<div class="md-card-content">
			<form method="post" action="<@ofbizUrl>createProject</@ofbizUrl>">
			<table class="uk-table uk-table-hover uk-table-bordered">
				<input type="hidden" name="isCreate" id="isCreate" value="true"/>
				<input type="hidden" name="productTypeId" id="productTypeId" value="PROJECT"/>
				<input type="hidden" name="internalName" id="internalName" value="${nickname!}"/>
				<tr>
					<td>${uiLabelMap.ProjectName}&nbsp;*&nbsp;:</td>
					<td>
						<input required="required" type="text" class="" id="url1" name="productName" id="productName" value="${requestParameters.productName!}" placeholder="${uiLabelMap.NotMoreThan13Words}" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
					</td>
				</tr>
				<tr>
					<td>${uiLabelMap.OneWordInformation}&nbsp;*&nbsp;:</td>
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