<div class="border-top padding50" id="4">
	<div class="col-md-8 col-md-offset-2 text-center space40">
		<#list ProductCategory as ProductCategory><h3 class="uppercase">${ProductCategory.categoryName}</h3>
		<p class="">${ProductCategory.description}</p></#list>
	</div>
	<div class="team-home">
		<div class="team-box">
			<div class="container">
				<div id="home-team" class="owl-carousel owl-theme">
					<#list ProductAndCategoryMemberChild as ProductAndCategoryMemberChild>
					<div class="item">
						<div class="staff-img">
							<img src="${ProductAndCategoryMemberChild.largeImageUrl!}" class="img-responsive" alt="">
						</div>
						<h2><a href="/store/products/p_${ProductAndCategoryMemberChild.productId}">${ProductAndCategoryMemberChild.productName!}</a></h2>
						<span>${ProductAndCategoryMemberChild.description!}</span>	
					</div>
					</#list>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="parallax-bg3 padding70" style="background: url(/images/winfirms/3.jpg) no-repeat center center fixed !important;background-size: cover !important;">
	<div class="container home-testimonials ">
		<div id="home-quote" class="owl-carousel owl-three owl-theme">
			
			<#list ProductAndCategoryMember as ProductAndCategoryMember>
				<#assign personLogoUrl = "/images/winfirms/user.png">
				<#list ProductAndRole as ProductAndRole>
				<#if ProductAndRole.productId = ProductAndCategoryMember.productId>
					<#list RoleType as RoleType>
					<#if RoleType.roleTypeId = ProductAndRole.roleTypeId>
						<#assign RoleTypeId = RoleType.roleTypeId!>
						<#assign RoleTypeDescription = RoleType.description!>
					</#if>
					</#list>
					<#list PartyContent?sort_by('fromDate') as PartyContent>
						<#if PartyContent.partyId = ProductAndRole.partyId>
							<#assign personContentId = PartyContent.contentId!/>
							<#if personContentId?has_content>
								<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
							</#if>
						</#if>
					</#list>
					<#list PersonList as PersonList>
						<#if PersonList.partyId = ProductAndRole.partyId>
							<#assign comments = PersonList.comments!/>
						</#if>
					</#list>
				</#if>
				</#list>
				<div class="quote-info">
					<img src="${personLogoUrl}" class="img-responsive" alt="">
					<p class="white">${ProductAndCategoryMember.description!}</p>
					<h2>
						<a href="/store/products/p_${ProductAndCategoryMember.productId}">${ProductAndCategoryMember.productName!}</a>
						<#if RoleTypeId?? && RoleTypeId = "BUSINESSMAN">
						<span class="businessman">${RoleTypeDescription}</span>
						<#elseif RoleTypeId?? && RoleTypeId = "SUBSCRIBER">
						<span class="subscriber">${RoleTypeDescription}</span>
						<#elseif RoleTypeId?? && RoleTypeId = "INVESTORS">
						<span class="investors">${RoleTypeDescription}</span>
						<#elseif RoleTypeId?? && RoleTypeId = "COMPANY">
						<span class="company">${RoleTypeDescription}</span>
						<#elseif RoleTypeId?? && RoleTypeId = "INCUBATOR">
						<span class="incubator">${RoleTypeDescription}</span>
						<#else>
						<span class="unverified">${uiLabelMap.Unverified}</span>
						</#if>
					</h2>
				</div>
			</#list>
		</div>
	</div>
</div>
