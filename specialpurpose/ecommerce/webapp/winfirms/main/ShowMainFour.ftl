<div class="border-top padding50" style="background: url(/images/winfirms/7.jpg) no-repeat center center fixed !important;background-size: cover !important;">
<div class="container">
	<div class="text-center space40">
		<#list ProductCategory as ProductCategory>
		<h3 class="title white uppercase">${ProductCategory.categoryName!}</h3>
		<p class="white">${ProductCategory.description!}</p>
		</#list>
	</div>
	<div class="row">
		<#list ProductAndCategoryMember as ProductAndCategoryMember>
		<div class="col-md-4">
			<div class="hb-info">
				<div class="hb-thumb">
					<img src="${ProductAndCategoryMember.largeImageUrl!}" class="img-responsive" alt="">
					<div class="date-meta">
						${ProductAndCategoryMember.createdDate?substring(5,7)!}${uiLabelMap.CommonMonth}<span>${ProductAndCategoryMember.createdDate?substring(8,10)!}</span>${ProductAndCategoryMember.createdDate?substring(0,4)!}
					</div>
				</div>
				<h4><a class="white" href="/products/p_${ProductAndCategoryMember.productId}">${ProductAndCategoryMember.productName!}</a></h4>
				<p class="white">${ProductAndCategoryMember.description!}</p>
			</div>
		</div>
		</#list>
	</div>
</div>
</div>