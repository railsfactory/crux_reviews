class Admin::ReviewSettingsController < Admin::BaseController
	include ReviewsHelper
	before_filter :find_review_preference,:only=>["edit","update","show"]
 def update
  params[:preferences][:include_unapproved_reviews] = false if params[:preferences][:include_unapproved_reviews].blank?
  if @preferences.blank?
    reviews_preference=Preference.create(:name=>"include_unapproved_reviews",:owner_id=>@config.id,:owner_type=>"Configuration",:value=>params[:preferences][      :include_unapproved_reviews],:domain_url=>@domain)
   reviews_preference=Preference.create(:name=>"preview_size",:owner_id=>@config.id,:owner_type=>"Configuration",:value=>params[:preferences][:preview_size],:domain_url=>@domain)
   reviews_preference.save
  else
   @preferences.each do |preference|
   preference.value= params[:preferences][:include_unapproved_reviews] if preference.name=="include_unapproved_reviews"
   preference.value= params[:preferences][:preview_size] if preference.name=="preview_size"
   preference.save
  end
 end
	respond_to do |format|
	format.html {redirect_to admin_review_settings_path}
  end
 end	
 def find_review_preference	
	 @domain=current_user.domain_url
	 @config=Configuration.find_by_name("Reviews configuration")
   @preferences=Preference.where("domain_url=? AND owner_type=? AND owner_id=? ",@domain,"Configuration",@config.id)		
 end
end
