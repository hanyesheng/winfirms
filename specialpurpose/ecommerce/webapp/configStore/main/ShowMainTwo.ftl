<div class="border-top padding50" style="background: url(/images/winfirms/6.jpg) no-repeat center center fixed !important;background-size: cover !important;">
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
				</div>
				<h4><a class="white" href="/store/products/p_${ProductAndCategoryMember.productId}">${ProductAndCategoryMember.productName!}</a></h4>
				<p class="white">${ProductAndCategoryMember.description!}</p>
			</div>
		</div>
		</#list>
	</div>
</div>
</div>