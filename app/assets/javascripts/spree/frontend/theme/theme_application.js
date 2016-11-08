(function($){

	// ensure document is ready
	$(document).ready(function(){

		/*
		stylize header when window is scrolled
		start with low opacity -> on scroll make opaque
		only needs to happen for home page (with jumbo scroller)
		*/
		// define window and header
		var $window = $(window);
		var $header = $("#spree-header").children("header");

		// check if jumbo scroller is present
		if ($("#home_carousel").length == 0){
			$header.addClass("fill-block");
		}
		else {
			// if present -> listen on window scrolling
			$window.on("scroll", function(){
				if ($window.scrollTop() == 0){
					$header.removeClass("fill-block");
				}
				else {
					$header.addClass("fill-block");
				}
			});	
		}

		/*
		prevent search dropdown from auto closing when using the search form
		prevent propgation from a form click upto the dropdown
		*/
		// define search dropdown and form
		var $search = $("li#search-bar")
		var $searchForm = $search.find("form.navbar-form");

		// listen on form clicks and prevent dropdown from closing
		$searchForm.click(function(ev){
			ev.stopPropagation();
		});

	});
})(jQuery)