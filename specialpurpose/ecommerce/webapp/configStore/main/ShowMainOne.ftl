<section id="portfolio-section_2" class="border-top padding50" >
	<div class="container">
		<#list ProductCategory as ProductCategory>
		<h3 class="uppercase text-center">${ProductCategory.categoryName}</h3>
		</#list>
		<ul class="filter" data-option-key="filter">
			<#list ProductCategoryRollupAndChildChild as ProductCategoryRollupAndChildChild>
				<#list ProductCategoryChild as ProductCategoryChild>
				<#if ProductCategoryRollupAndChildChild.productCategoryId = ProductCategoryChild.productCategoryId>
					<li><a href="#" data-option-value=".${ProductCategoryChild.productCategoryId}">${ProductCategoryChild.categoryName!}</a></li>
				</#if>
				</#list>
			</#list>
		</ul>
		<div id="portfolio-home_2" class="isotope gutter folio-boxed-3col">
			<#list ProductAndCategoryMember as ProductAndCategoryMember>
			<div class="project-item ${ProductAndCategoryMember.primaryProductCategoryId!}">
				<a href="/store/products/p_${ProductAndCategoryMember.productId}">
					<div class="project-gal">
						<img src="${ProductAndCategoryMember.largeImageUrl!}" class="img-responsive" alt="">
						<div class="overlay-folio2">
							<div class="project-info">
								<h2>${ProductAndCategoryMember.productName!}</h2>
								<p>${ProductAndCategoryMember.description!}</p>
							</div>
						</div>
					</div>
				</a>
			</div>
			</#list>
		</div>
	</div>
</section>
