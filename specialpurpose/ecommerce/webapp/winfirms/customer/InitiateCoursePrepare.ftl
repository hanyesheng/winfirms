<#list RoleTypeAndParty as RoleTypeAndParty>
	<#assign bus = RoleTypeAndParty.roleTypeId>
</#list>

<#if bus?? && bus = "TEACHER">
	<div class="md-card md-card-primary">
		<div class="md-card-content">
			<p>${uiLabelMap.InitiateProject2}</p>
			<small><b><input checked="checked" name="ReadMe" type="checkbox" value="" />&nbsp;&nbsp;${uiLabelMap.InitiateProject3}<a href="#">${uiLabelMap.InitiateProject4}</a>&nbsp;&nbsp;<a href="#">${uiLabelMap.InitiateProject5}</a></b></small>
			<br>
			<a style="margin-top: 10px;" href="<@ofbizUrl>initiateCourse</@ofbizUrl>" class="md-btn md-btn-block md-btn-flat md-btn-flat-primary">${uiLabelMap.InitiateCourse}</a>
		</div>
	</div>
<#else>
	<div class="md-card md-card-danger">
		<div class="md-card-content">
			<p>${uiLabelMap.NoRoleToOperate}</p>
			<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.CommonGoBack}</a>
		</div>
	</div>
</#if>