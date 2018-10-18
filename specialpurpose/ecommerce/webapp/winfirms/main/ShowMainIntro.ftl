<div class="container padding80" id="3">
	<div class="section-about">
		<#list ProductAndCategoryMember as ProductAndCategoryMember>
		<div class="row">
			<div class="col-md-6">
				<div>
					<img src="${ProductAndCategoryMember.detailImageUrl!}" class="img-responsive" alt="">
				</div>
			</div>
			<div class="col-md-6">
				<div>
					<h3>${ProductAndCategoryMember.productName!}</h3>
					<p class="lead">${ProductAndCategoryMember.comments!}</p>
					<p>${ProductAndCategoryMember.description!} </p>
				</div>
				<div class="dual-btns auto-width">
					<a href="/products/p_${ProductAndCategoryMember.productId}?detailId=signup" class="button btn-lg">${uiLabelMap.ActivityJoinWay}</a>
					<a href="/products/p_${ProductAndCategoryMember.productId}" class="button color2 btn-lg">${uiLabelMap.Readmore}</a>
				</div>
			</div>
		</div>
		</#list>
	</div>
</div>
