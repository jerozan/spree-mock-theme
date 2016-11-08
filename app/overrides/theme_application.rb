#===========================#
# update application layout #
#===========================#
# remove sidebar
Deface::Override.new(virtual_path: 'spree/shared/_sidebar',
	name: 'remove_sidebar',
	remove: 'aside#sidebar'
)

# expand col-span of contents
Deface::Override.new(virtual_path: 'spree/layouts/spree_application',
	name: 'expand_content_div',
	set_attributes: 'div#content',
	attributes: {
		class: 'col-sm-12'
	}
)

# insert partial for jumbo slide
# partial contains logic to only render on home page
Deface::Override.new(virtual_path: 'spree/layouts/spree_application',
	name: 'insert_home_jumbo_slide',
	insert_before: 'div.container',
	partial: 'theme/home_jumbo_slide'
)