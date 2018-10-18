<#list RoleTypeAndParty as RoleTypeAndParty>
	<#assign bus = RoleTypeAndParty.roleTypeId>
</#list>
<div class="md-card">
	<#if bus?? && bus = "SUBSCRIBER">
	<div class="space30"></div>
	<blockquote class="style1">
		<p>${uiLabelMap.HasRoleNoOperate}</p>
	</blockquote>
	<div class="alert info align-center">
		<div class="row">
			<div class="col-md-12">
				<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.CommonGoBack}</a>
			</div>
		</div>
	</div>
	<#else>
	<div class="space30"></div>
	<#list Person as Person>
		<#assign nickname = Person.nickname!/>
	</#list> 
	<form method="post" action="<@ofbizUrl>addRoleShowFirSub</@ofbizUrl>">
	<table class="table table-bordered margin-top-50">
		<thead>
		<tr>
			<td colspan="3" style="text-align: center;">${uiLabelMap.RoleVerify}--${uiLabelMap.VerifyStepOne}</td>
		</tr>
		</thead>
		<input type="hidden" name="isCreate" id="isCreate" value="true"/>
		<input type="hidden" name="productTypeId" id="productTypeId" value="PERSON"/>
		<input type="hidden" name="internalName" id="internalName" value="${nickname!}"/>
		<tr style="line-height: 37px;">
			<td rowspan="4">${uiLabelMap.VerifyInfo}</td>
			<td style="padding-left:20px">${uiLabelMap.YourTrueName}&nbsp;*&nbsp;:</td>
			<td>
				<input type="text" class="" id="url1" required="required" name="productName" id="productName" placeholder="${uiLabelMap.PleaseWriteYourTrueName}" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
			</td>
		</tr>
		<tr style="line-height: 37px;">
			<td style="padding-left:20px">${uiLabelMap.PartyRole}&nbsp;*&nbsp;:</td>
			<td>
				<#list RoleType as RoleType>
					<input type="text" class="" disabled="disabled" id="url1" value="${RoleType.description!}" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
				</#list>
			</td>
		</tr>
		<tr style="line-height: 37px;">
			<td style="padding-left:20px">${uiLabelMap.OneWordInformation}&nbsp;*&nbsp;:</td>
			<td>
				<input type="text" class="" id="url2" required="required" name="description" id="description" placeholder="${uiLabelMap.RoleOneWordInformation}" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
			</td>
		</tr>
		<tr style="line-height: 37px;">
			<td style="padding-left:20px">${uiLabelMap.CommentInformation}:</td>
			<td>
				<input type="text" class="" id="url3" name="comments"  id="comments" placeholder="${uiLabelMap.RoleCommentsAbout}" style="width: 530px; border: 1px solid rgb(204, 204, 204);padding-left:5px;font-size: 14px;height: 30px;"/>
			</td>
		</tr>
	</table>
	<div class="alert info"><button type="submit" class="button btn-border btn-small btn-radius white btn-center">${uiLabelMap.NextPage}</button></div>
	</form>
	</#if>
</div>