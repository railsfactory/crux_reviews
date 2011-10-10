module Spree::BaseHelper
def star(the_class) 
    "<span class=\"#{the_class}\"> &#10030; </span>"
  end

  def mk_stars(m)
    (1..5).collect {|n| n <= m ? star("lit") : star("unlit") }.join
  end
  
  def txt_stars(n, show_out_of = true)
    res = I18n.t('star', :count => n)
    res += ' ' + t('out_of_5') if show_out_of
    res
  end
	
	def find_domain_product_review(domain_pref,product)
	approve=domain_pref.count>0 ? (domain_pref.select{|x|x.name=="include_unapproved_reviews"}.map(&:value)[0]) : Spree::Reviews::Config[:include_unapproved_reviews]
	preview_size=domain_pref.count>0 ? (domain_pref.select{|x|x.name=="preview_size"}.map(&:value)[0]) :  Spree::Reviews::Config[:preview_size]
reviews=product.find(:all,:conditions=> ["(? = ?) or (approved = ?)", approve,true, true ],:limit => preview_size, :order=>"created_at desc")
return reviews
 end


end
