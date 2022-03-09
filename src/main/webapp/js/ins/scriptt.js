(function($) {
	
	"use strict";
	
	//Hide Loading Box (Preloader)
	function handlePreloader() {
		if($('.preloader').length){
			$('.preloader').delay(200).fadeOut(500);
		}
	}
	

	//Update Header Style and Scroll to Top
	function headerStyle() {
		if($('.main-header').length){
			var windowpos = $(window).scrollTop();
			var siteHeader = $('.main-header');
			var scrollLink = $('.scroll-to-top');
			if (windowpos >= 1) {
				siteHeader.addClass('fixed-header');
				scrollLink.fadeIn(300);
			} else {
				siteHeader.removeClass('fixed-header');
				scrollLink.fadeOut(300);
			}
		}
	}
	
	headerStyle();
	
	
	
	
	//Hidden Sidebar
	// if ($('.hidden-bar').length) {
	// 	var hiddenBar = $('.sidebar-btn');
	// 	var hiddenBarOpener = $('.sidebar-btn');
	// 	var hiddenBarCloser = $('.hidden-bar-closer');
	// 	var leftBarBtn = $('.left-sidebar-btn.hidden-bar-opener');
	// 	var hiddenBarBtn = $('.hidden-bar');
	// 	$('.hidden-bar-wrapper').mCustomScrollbar();
		
	// 	//Show Sidebar
	// 	hiddenBarOpener.on('click', function () {
	// 		hiddenBar.addClass('visible-sidebar');
	// 	});
		
	// 	//Hide Sidebar
	// 	hiddenBarCloser.on('click', function () {
	// 		hiddenBar.removeClass('visible-sidebar');
	// 	});
	// }
	
	
	
	
	//Event Countdown Timer
	if($('.time-countdown').length){  
		$('.time-countdown').each(function() {
		var $this = $(this), finalDate = $(this).data('countdown');
		$this.countdown(finalDate, function(event) {
			var $this = $(this).html(event.strftime('' + '<div class="counter-column"><span class="count">%D</span>Days</div> ' + '<div class="counter-column"><span class="count">%H</span>Hours</div>  ' + '<div class="counter-column"><span class="count">%M</span>Minutes</div>  ' + '<div class="counter-column"><span class="count">%S</span>Seconds</div>'));
		});
	 });
	}
	
	
	
	//Event Countdown Timer
	if($('.time-countdown-two').length){  
		$('.time-countdown-two').each(function() {
		var $this = $(this), finalDate = $(this).data('countdown');
		$this.countdown(finalDate, function(event) {
			var $this = $(this).html(event.strftime('' + '<div class="counter-column"><span class="count">%M</span></div>  ' + '<div class="counter-column"><span class="count">%S</span></div>'));
		});
	 });
	}
	
	
	
	
	//Mobile Nav Hide Show
	if($('.mobile-menu').length){
		
		$('.mobile-menu .menu-box').mCustomScrollbar();
		
		var mobileMenuContent = $('.main-header .nav-outer .main-menu').html();
		$('.mobile-menu .menu-box .menu-outer').append(mobileMenuContent);
		$('.sticky-header .main-menu').append(mobileMenuContent);
		
		//Dropdown Button
		$('.mobile-menu li.dropdown .dropdown-btn').on('click', function() {
			$(this).toggleClass('open');
			$(this).prev('ul').slideToggle(500);
		});
		
		//Menu Toggle Btn
		$('.mobile-nav-toggler').on('click', function() {
			$('body').addClass('mobile-menu-visible');
		});

		// Menu Toggle Btn
		$('.mobile-menu .menu-backdrop,.mobile-menu .close-btn').on('click', function() {
			$('body').removeClass('mobile-menu-visible');
		});
		
		// Profile Box
		// if($('.profile-box').length){
		// 	$('.profile-box .dropdown-toggle').on('click', function() {
		// 		$('.profile-box').toggleClass('dropdown-active');
		// 	});
		// }
		
		// Featured Dropdown Box
		// if($('.featured-dropdown-box').length){

		// 	$('.featured-dropdown-box .dropdown-toggle').on('click', function() {
		// 		$('.featured-dropdown-box').toggleClass('dropdown-active');
		// 	});
		// }
		
		// Dark Layout Button
		$('.dark-mode .dark-buttons .on').on('click', function() {
			$('.round').addClass('boll-right');
			$('body').addClass('dark_body');
		});
		
		// Dark Layout Button
		$('.dark-mode .dark-buttons .off').on('click', function() {
			$('.round').removeClass('boll-right');
			$('body').removeClass('dark_body');
		});
		
	}
	
	
	
	//Hidden Sidebar
	if ($('.hidden-bar').length) {
		var hiddenBar = $('.hidden-bar');
		var hiddenBarOpener = $('.hidden-bar-opener');
		var hiddenBarCloser = $('.hidden-bar-closer');
		$('.hidden-bar-wrapper').mCustomScrollbar();
		$('.hidden-bar .side-menu ul li.dropdown').append('<div class="dropdown-btn"><span class="arrow_carrot-down"></span></div>');
		
		// //Show Sidebar
		// hiddenBarOpener.on('click', function () {
		// 	hiddenBar.addClass('visible-sidebar');
		// });

		//Hide Sidebar
		hiddenBarCloser.on('click', function () {
			hiddenBar.removeClass('visible-sidebar');
			$('.hidden-bar-opener').removeClass('custom_opener');
			$('.sidenav-list').removeClass('custom_left_sidebar');
		});

		hiddenBarOpener.on('click', function(e){
			console.log('working');
			if(hiddenBarOpener.hasClass('custom_opener')){
				console.log('If');
				hiddenBar.removeClass('visible-sidebar');
				$('.hidden-bar-opener').removeClass('custom_opener');
				$('.sidenav-list').removeClass('custom_left_sidebar');
			}
			else{
				console.log('else');
				hiddenBar.addClass('visible-sidebar');	
				$('.sidenav-list').addClass('custom_left_sidebar');
				$('.hidden-bar-opener').addClass('custom_opener');				
			}
		});

		$('.color-layer').on('click', function(e){
			hiddenBar.removeClass('visible-sidebar');
			$('.hidden-bar-opener').removeClass('custom_opener');
			$('.sidenav-list').removeClass('custom_left_sidebar');
		})
		
	}
	
	
	
	//Parallax Scene for Icons
	if($('.parallax-scene-1').length){
		var scene = $('.parallax-scene-1').get(0);
		var parallaxInstance = new Parallax(scene);
	}
	if($('.parallax-scene-2').length){
		var scene = $('.parallax-scene-2').get(0);
		var parallaxInstance = new Parallax(scene);
	}
	if($('.parallax-scene-3').length){
		var scene = $('.parallax-scene-3').get(0);
		var parallaxInstance = new Parallax(scene);
	}
	if($('.parallax-scene-4').length){
		var scene = $('.parallax-scene-4').get(0);
		var parallaxInstance = new Parallax(scene);
	}
	if($('.parallax-scene-5').length){
		var scene = $('.parallax-scene-5').get(0);
		var parallaxInstance = new Parallax(scene);
	}
	
	
	
	
	// Submenu Dropdown Toggle
	if($('.main-header li.dropdown ul').length){
		$('.main-header li.dropdown').append('<div class="dropdown-btn"><span class="fa fa-angle-down"></span></div>');
		
		//Dropdown Button
		$('.main-header li.dropdown .dropdown-btn').on('click', function() {
			$(this).prev('ul').slideToggle(500);
		});
		
		//Disable dropdown parent link
		$('.main-header .navigation li.dropdown > a,.hidden-bar .side-menu li.dropdown > a').on('click', function(e) {
			e.preventDefault();
		});
		
		//Main Menu Fade Toggle
		$('.main-header .nav-toggler').on('click', function() {
			$('.main-header .main-menu').fadeToggle(300);
		});
	}
	
	
	
	
	//Hidden Sidebar
	// if($('.hidden-bar').length) {
	// 	var hiddenBar = $('.hidden-bar');
	// 	var hiddenBarOpener = $('.info-btn');
	// 	var hiddenBarCloser = $('.hidden-bar-closer');
	// 	$('.hidden-bar-wrapper').mCustomScrollbar();
		
	// 	//Show Sidebar
	// 	hiddenBarOpener.on('click', function () {
	// 		hiddenBar.addClass('visible-sidebar');
	// 	});
		
	// 	//Hide Sidebar
	// 	hiddenBarCloser.on('click', function () {
	// 		hiddenBar.removeClass('visible-sidebar');
	// 	});
	// }
	
	
	
	
	//Accordion Box
	if($('.accordion-box').length){
		$(".accordion-box").on('click', '.acc-btn', function() {
			
			var outerBox = $(this).parents('.accordion-box');
			var target = $(this).parents('.accordion');
			
			if($(this).hasClass('active')!==true){
				$(outerBox).find('.accordion .acc-btn').removeClass('active');
			}
			
			if ($(this).next('.acc-content').is(':visible')){
				return false;
			}else{
				$(this).addClass('active');
				$(outerBox).children('.accordion').removeClass('active-block');
				$(outerBox).find('.accordion').children('.acc-content').slideUp(300);
				target.addClass('active-block');
				$(this).next('.acc-content').slideDown(300);	
			}
		});	
	}
	
	
	
	//Tabs Box
	if($('.tabs-box').length){
		$('.tabs-box .tab-buttons .tab-btn').on('click', function(e) {
			e.preventDefault();
			var target = $($(this).attr('data-tab'));
			
			if ($(target).is(':visible')){
				return false;
			}else{
				target.parents('.tabs-box').find('.tab-buttons').find('.tab-btn').removeClass('active-btn');
				$(this).addClass('active-btn');
				target.parents('.tabs-box').find('.tabs-content').find('.tab').fadeOut(0);
				target.parents('.tabs-box').find('.tabs-content').find('.tab').removeClass('active-tab');
				$(target).fadeIn(300);
				$(target).addClass('active-tab');
			}
		});
	}
	
	
	
	//Progress Bar
	if($('.progress-line').length){
		$('.progress-line').appear(function(){
			var el = $(this);
			var percent = el.data('width');
			$(el).css('width',percent+'%');
		},{accY: 0});
	}
	
	
	
	//Fact Counter + Text Count
	if($('.count-box').length){
		$('.count-box').appear(function(){
	
			var $t = $(this),
				n = $t.find(".count-text").attr("data-stop"),
				r = parseInt($t.find(".count-text").attr("data-speed"), 10);
				
			if (!$t.hasClass("counted")) {
				$t.addClass("counted");
				$({
					countNum: $t.find(".count-text").text()
				}).animate({
					countNum: n
				}, {
					duration: r,
					easing: "linear",
					step: function() {
						$t.find(".count-text").text(Math.floor(this.countNum));
					},
					complete: function() {
						$t.find(".count-text").text(this.countNum);
					}
				});
			}
			
		},{accY: 0});
	}
	
	
	
	
	
	//Custom Seclect Box
	if($('.custom-select-box').length){
		$('.custom-select-box').selectmenu().selectmenu('menuWidget').addClass('overflow');
	}
	
	
	
	
	
	
	// Single Item Carousel
	if ($('.single-item-carousel').length) {
		$('.single-item-carousel').owlCarousel({
			loop:true,
			margin:0,
			nav:true,
			smartSpeed: 500,
			autoplay: 6000,
			navText: [ '<span class="fa fa-angle-left"></span>', '<span class="fa fa-angle-right"></span>' ],
			responsive:{
				0:{
					items:1
				},
				600:{
					items:1
				},
				800:{
					items:1
				},
				1024:{
					items:1
				},
				1200:{
					items:1
				},
				1500:{
					items:1
				}
			}
		});    		
	}
	
	
	
	
	
	// Featured Carousel
	if ($('.featured-carousel').length) {
		$('.featured-carousel').owlCarousel({
			loop:true,
			margin:10,
			nav:true,
			smartSpeed: 500,
			autoplay: 6000,
			navText: [ '<span class="fa fa-angle-left"></span>', '<span class="fa fa-angle-right"></span>' ],
			responsive:{
				0:{
					items:1
				},
				600:{
					items:2
				},
				800:{
					items:2
				},
				1024:{
					items:2
				},
				1200:{
					items:3
				},
				1500:{
					items:3
				}
			}
		});    		
	}
	
	
	
	
	
	// Testimonial Carousel
	if ($('.testimonial-carousel').length) {
		$('.testimonial-carousel').owlCarousel({
			loop:true,
			margin:20,
			nav:true,
			smartSpeed: 500,
			autoplay: 6000,
			navText: [ '<span class="fa fa-angle-left"></span>', '<span class="fa fa-angle-right"></span>' ],
			responsive:{
				0:{
					items:1
				},
				600:{
					items:2
				},
				800:{
					items:2
				},
				1024:{
					items:2
				},
				1200:{
					items:2
				},
				1500:{
					items:2
				}
			}
		});    		
	}
	
	
	
	
	// Three Item Carousel
	if ($('.three-item-carousel').length) {
		$('.three-item-carousel').owlCarousel({
			loop:true,
			margin:20,
			nav:true,
			smartSpeed: 500,
			autoplay: 6000,
			navText: [ '<span class="fa fa-angle-left"></span>', '<span class="fa fa-angle-right"></span>' ],
			responsive:{
				0:{
					items:1
				},
				600:{
					items:2
				},
				800:{
					items:2
				},
				1024:{
					items:2
				},
				1200:{
					items:3
				},
				1500:{
					items:3
				}
			}
		});    		
	}
	
	
	
	
	//LightBox / Fancybox
	if($('.lightbox-image').length) {
		$('.lightbox-image').fancybox({
			openEffect  : 'fade',
			closeEffect : 'fade',
			helpers : {
				media : {}
			}
		});
	}
	
	
	// Scroll to a Specific Div
	if($('.scroll-to-target').length){
		$(".scroll-to-target").on('click', function() {
			var target = $(this).attr('data-target');
		   // animate
		   $('html, body').animate({
			   scrollTop: $(target).offset().top
			 }, 1500);
	
		});
	}
	
	
	// Elements Animation
	if($('.wow').length){
		var wow = new WOW(
		  {
			boxClass:     'wow',      // animated element css class (default is wow)
			animateClass: 'animated', // animation css class (default is animated)
			offset:       0,          // distance to the element when triggering the animation (default is 0)
			mobile:       true,       // trigger animations on mobile devices (default is true)
			live:         true       // act on asynchronously loaded content (default is true)
		  }
		);
		wow.init();
	}


/* ==========================================================================
   When document is Scrollig, do
   ========================================================================== */
	
	$(window).on('scroll', function() {
		headerStyle();
	});
	
/* ==========================================================================
   When document is loading, do
   ========================================================================== */
	
	$(window).on('load', function() {
		handlePreloader();
	});	

})(window.jQuery);

// function featuredfunc(id) {
// 	let lengthofbox = $('.featured-dropdown-box').length;
// 	for (var i = 0; i < lengthofbox; i++){
// 		if(id === 'feature-block' + i){
// 			$('#feature-block' + i).parent().toggleClass('dropdown-active');
// 		}
// 	}
// }
// $(document).on('click', function(e){
// 	console.log('e', e.target.className);
// 	if(e.target.className != 'dots'){
// 		console.log('clicked');
// 		if($('.btn.btn-default.dropdown-toggle').parent().hasClass('dropdown-active')){
// 			console.log('If');
// 			$('.btn.btn-default.dropdown-toggle').parent().removeClass('dropdown-active');
// 		}
// 	}
// });

jQuery(document).on('click', '.btn.btn-default.dropdown-toggle',function(){
	jQuery(this).parent().toggleClass('dropdown-active');
});

var ignoreClickOnMeElement = document.getElementById('someElementID1');
var ignoreClickOnMeElement1 = document.getElementById('someElementID2');
var ignoreClickOnMeElement2 = document.getElementById('someElementID3');
var ignoreClickOnMeElement3 = document.getElementById('someElementID4');
var ignoreClickOnMeElement5 = document.getElementById('someElementID5');



document.addEventListener('click', function(event) {
	var isClickInsideElement = ignoreClickOnMeElement.contains(event.target);
	var isClickInsideElement1 = ignoreClickOnMeElement1.contains(event.target);
	var isClickInsideElement2 = ignoreClickOnMeElement2.contains(event.target);
	var isClickInsideElement3 = ignoreClickOnMeElement3.contains(event.target);
 	var isClickInsideElement5 = ignoreClickOnMeElement5.contains(event.target);
   
    if (!isClickInsideElement && !isClickInsideElement5 && !isClickInsideElement1 && !isClickInsideElement2 && !isClickInsideElement3) {
       $('.btn.btn-default.dropdown-toggle').parent().removeClass('dropdown-active');
    } 
});