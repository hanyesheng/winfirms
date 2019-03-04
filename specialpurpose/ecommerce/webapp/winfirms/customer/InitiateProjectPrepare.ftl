<#list RoleTypeAndParty as RoleTypeAndParty>
	<#assign bus = RoleTypeAndParty.roleTypeId>
</#list>

<#if bus?? && bus = "BUSINESSMAN">
	<div class="md-card md-card-primary" style="margin-top: 15px;">
		<div class="md-card-content">
			<p>${uiLabelMap.InitiateProject2}</p>
			<small><b><input checked="checked" name="ReadMe" type="checkbox" value="" />&nbsp;&nbsp;${uiLabelMap.InitiateProject3}<a href="#">${uiLabelMap.InitiateProject4}</a>&nbsp;&nbsp;<a href="#">${uiLabelMap.InitiateProject5}</a></b></small>
			<br>
			<a style="margin-top: 10px;" href="<@ofbizUrl>initiateProject</@ofbizUrl>" class="md-btn md-btn-block md-btn-flat md-btn-flat-primary">${uiLabelMap.CreatSeedProj}</a>
		</div>
	</div>
<#else>
	<div class="md-card md-card-danger" style="margin-top: 15px;">
		<div class="md-card-content">
			<p>${uiLabelMap.NoRoleToOperate}</p>
			<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.CommonGoBack}</a>
		</div>
	</div>
</#if>