#===============#
# update navbar #
#===============#
# reduce logo col-span
Deface::Override.new(virtual_path: 'spree/shared/_header',
	name: 'reduce_logo_col_span',
	set_attributes: 'div#spree-header figure#logo',
	attributes: {
		class: 'col-md-3 col-sm-2'
	}
)

# reduce navbar col-span
Deface::Override.new(virtual_path: 'spree/shared/_nav_bar',
	name: 'reduce_navbar_col_span',
	set_attributes: 'nav#top-nav-bar',
	attributes: {
		class: 'col-md-6 col-sm-7'
	}
)

# create dropdown for user login
Deface::Override.new(virtual_path: 'spree/shared/_link_to_account',
	name: 'dropdown_login',
	surround: 'erb[silent]:contains(\'if\')',
	partial: 'theme/user_login'
)

# create dropdown for search bar
Deface::Override.new(virtual_path: 'spree/shared/_nav_bar',
	name: 'dropdown_search',
	surround_contents: 'li#search-bar',
	partial: 'theme/search'
)

#===================#
# update sub header #
#===================#
# reduce col-span
Deface::Override.new(virtual_path: 'spree/shared/_main_nav_bar',
	name: 'reduce_main_navbar_col_span',
	set_attributes: 'nav',
	attributes: {
		class: 'col-md-3 col-sm-3'
	}
)

# move original sub header to navbar
Deface::Override.new(virtual_path: 'spree/shared/_nav_bar',
	name: 'move_sub_header_navbar',
	insert_before: 'nav#top-nav-bar',
	partial: 'spree/shared/main_nav_bar'
)

# remove original sub header
Deface::Override.new(virtual_path: 'spree/shared/_header',
	name: 'remove_sub_header_navbar',
	remove: 'div#spree-header > div.container'
)