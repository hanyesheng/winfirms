	<div class="slider-wrap">
		<div class="tp-banner-container">
			<div class="tp-banner" >
				<ul>
					<#list ProductAndCategoryMember as ProductAndCategoryMember>
					<#if ProductAndCategoryMember.detailImageUrl??>
					<!-- SLIDE  -->
					<li data-transition="fade" data-slotamount="1" data-masterspeed="1500" data-thumb="" data-delay="13000"  data-saveperformance="off"  data-title="Our Workplace">
						<img src="${ProductAndCategoryMember.detailImageUrl}"  alt="kenburns1"  data-bgposition="left center" data-kenburns="on" data-duration="14000" data-ease="Linear.easeNone" data-bgfit="100" data-bgfitend="130" data-bgpositionend="right center">
						<div class="tp-caption customin customout tp-resizeme"
							data-x="left" data-hoffset="60"
							data-y="170"
							data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
							data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
							data-speed="1000"
							data-start="500"
							data-easing="Back.easeInOut"
							data-endspeed="300"
							style="font-size:80px;color:#fff;text-transform:uppercase;font-weight: 800 !important;letter-spacing: 0px;line-height: 120% !important;"
							><br>${ProductAndCategoryMember.productName!}
						</div>
						<div class="tp-caption light_title customin customout tp-resizeme"
							data-x="left" data-hoffset="60"
							data-y="370"
							data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
							data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
							data-speed="1000"
							data-start="700"
							data-easing="Back.easeInOut"
							data-endspeed="300" 
							style="font-size:18px;color:#fff;"
							>${ProductAndCategoryMember.description!}
						</div>
						<!--<a href="#" class="tp-caption small_title  customin customout tp-resizeme"
							data-x="left" data-hoffset="60"
							data-y="450"
							data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
							data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
							data-speed="1600"
							data-start="900"
							data-easing="Back.easeInOut"
							data-endspeed="300" style="	background: #000;
							padding:18px 28px;
							color: #fff;
							text-transform: uppercase;
							border: none;
							font-size: 13px;
							letter-spacing: 2px;
							border-radius: 0px;
							display: table;
							transition: .4s;
							border-radius:5px;
							">Buy now</a>-->
					</li>
					</#if>
					</#list>
					<!-- SLIDE  -->
				</ul>
				<div class="tp-bannertimer"></div>
			</div>
		</div>
	</div>
