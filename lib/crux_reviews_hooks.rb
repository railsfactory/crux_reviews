
class CruxReviewsHooks < Spree::ThemeSupport::HookListener
	
  insert_after :inside_head do
    %( <%= stylesheet_link_tag('reviews.css') %> )
  end
  
  insert_after :footer_right do
    %(
<%= javascript_include_tag("jquery.rating.js") %>
<%= javascript_tag("$(document).ready(function(){$('.stars').rating({required:true});});") %>
)
  end
	
	insert_after :product_properties, 'shared/reviews'

  insert_after :admin_product_sub_tabs do
    %(
<%= tab(:reviews, :label => 'review_management') %>
)
  end

  insert_after :admin_configurations_menu do
    %(<%= configurations_menu_item(I18n.t('reviews.review_settings'), admin_review_settings_path, I18n.t('reviews.manage_review_settings')) %>)
  end
	

end