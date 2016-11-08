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
		class: 'col-md-3 col-sm-2'
	}
)

# move cart to navbar (originally in sub header)
# on update ensure cart link still works the same as this replaces original
Deface::Override.new(virtual_path: 'spree/shared/_nav_bar',
	name: 'move_cart_to_header',
	insert_after: 'li#search-bar',
	text: '
		<li id="link-to-cart" data-hook>
      <noscript>
        <%= link_to Spree.t(:cart), \'/cart\' %>
      </noscript>
      &nbsp;
    </li>
    <script>Spree.fetch_cart()</script>
	'
)

# remove original cart from sub header
Deface::Override.new(virtual_path: 'spree/shared/_main_nav_bar',
	name: 'remove_cart_sub_header',
	remove: 'li#link-to-cart'
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

# update search bar layout
## remove original select input
## remove original search button
Deface::Override.new(virtual_path: 'spree/shared/_search',
	name: 'remove_original_select_input',
	remove: 'erb[silent]:contains(\'cache\')',
	closing_selector: 'erb[silent]:contains(\'end\')'
)

## remove original search button
Deface::Override.new(virtual_path: 'spree/shared/_search',
	name: 'remove_original_search_button',
	remove: 'erb[loud]:contains(\'submit_tag\')'
)

## move search select and button as input add-ons
## on update ensure search still works the same as originals were copied into partial
Deface::Override.new(virtual_path: 'spree/shared/_search',
	name: 'move_original_search_button',
	surround: 'erb[loud]:contains(\'search_field_tag\')',
	partial: 'theme/search_bar'
)

#===================#
# update sub header #
#===================#
# reduce col-span
Deface::Override.new(virtual_path: 'spree/shared/_main_nav_bar',
	name: 'reduce_main_navbar_col_span',
	set_attributes: 'nav',
	attributes: {
		class: 'col-md-6 col-sm-8'
	}
)

# add taxons to sub header
Deface::Override.new(virtual_path: 'spree/shared/_main_nav_bar',
	name: 'add_taxons_dropdown_menu',
	insert_after: 'li#home-link',
	partial: 'theme/shop_categories'
)

# set taxons into columns
Deface::Override.new(virtual_path: 'spree/shared/_taxonomies',
	name: 'set_taxons_into_columns',
	replace_contents: 'erb[silent]:contains(\'cache\')',
	closing_selector: 'erb[silent]:contains(\'end\')',
	partial: 'theme/shop_categories_dropdown'
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