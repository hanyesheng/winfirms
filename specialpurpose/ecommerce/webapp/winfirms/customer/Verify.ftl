
<div class="md-card">
<div class="space30"></div>
	<blockquote class="style1">
		<p>${uiLabelMap.InitiateProject2}</p>
		<small>
			<b>
			<label class="checkbox-inline">
			<input type="checkbox" checked="checked" id="inlineCheckbox3" value="option3">
			&nbsp;&nbsp;${uiLabelMap.InitiateProject3}
			<a href="#">${uiLabelMap.InitiateProject4}</a>
			&nbsp;&nbsp;
			<a href="#">${uiLabelMap.InitiateProject5}</a>
			</label>
			</b>
		</small>
		<div class="space30"></div>
		<h4 class="uppercase">${uiLabelMap.ChooseRole}</h4>
	</blockquote>
	<div class="alert info align-center">
		<div class="row">
			<div class="col-md-12">
				<#list RoleTypeAndParty as RoleTypeAndParty>
					<#if RoleTypeAndParty.roleTypeId = "BUSINESSMAN">
						<#assign bus = "1">
					<#elseif RoleTypeAndParty.roleTypeId = "INCUBATOR">
						<#assign inc = "1">
					<#elseif RoleTypeAndParty.roleTypeId = "SUBSCRIBER">
						<#assign sub = "1">
					<#elseif RoleTypeAndParty.roleTypeId = "COMPANY">
						<#assign com = "1">
					<#elseif RoleTypeAndParty.roleTypeId = "INCUBATOR">
						<#assign inc = "1">
					</#if>
				</#list>
				<#if sub??>
					<div class="col-md-2 col-sm-2">
						<button disabled="disabled" class="button btn-small btn-radius btn-center">${uiLabelMap.VerifiedSub}</button>
					</div>
				<#else>
					<div class="col-md-2 col-sm-2">
						<a href="<@ofbizUrl>addRoleShowSub</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.VerifySub}</a>
					</div>
				</#if>
				<#if bus??>
					<div class="col-md-2 col-sm-2">
						<button disabled="disabled" class="button btn-small btn-radius btn-center">${uiLabelMap.VerifiedCk}</button>
					</div>
				<#else>
					<div class="col-md-2 col-sm-2">
						<a href="<@ofbizUrl>addRoleShowCk</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.VerifyCk}</a>
					</div>
				</#if>
				<!--<#if inv??>
					<div class="col-md-2 col-sm-2"> 
						<button disabled="disabled" class="button btn-small btn-radius btn-center">${uiLabelMap.VerifiedTzr}</button>
					</div>
				<#else>
					<div class="col-md-2 col-sm-2"> 
						<a href="<@ofbizUrl>addRoleShowTzr</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.VerifyTzr}</a>
					</div>
				</#if>
				<#if com??>
					<div class="col-md-2 col-sm-2"> 
						<button disabled="disabled" class="button btn-small btn-radius btn-center">${uiLabelMap.VerifiedGs}</button>
					</div>
				<#else>
					<div class="col-md-2 col-sm-2"> 
						<a href="<@ofbizUrl>addRoleShowGs</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.VerifyGs}</a>
					</div>
				</#if>
				<#if inc??>
					<div class="col-md-2 col-sm-2"> 
						<button disabled="disabled" class="button btn-small btn-radius btn-center">${uiLabelMap.VerifiedFhq}</button>
					</div>
				<#else>
					<div class="col-md-2 col-sm-2"> 
						<a href="<@ofbizUrl>addRoleShowFhq</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.VerifyFhq}</a>
					</div>
				</#if>-->
				<div class="col-md-2 col-sm-2">
					<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="button btn-border white btn-small btn-radius btn-center">${uiLabelMap.CommonGoBack}</a>
				</div>
			</div>
		</div>
	</div>
</div>