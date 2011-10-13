CruxReviews
===========

CruxReviews is an extension for Spree Commerce. It is mandatory that Spree has to be installed in the system
to add this extension. CruxReviews enables display of user reviews and user ratings for individual products. 
The reviews get placed on individual product pages itself thereby helps drive more SEO tags.

Installation
===========
It is mandatory that Spree has to be installed prior to the inclusion of the Extension.

Start by adding the gem to your existing Rails 3.x application's Gemfile

gem 'crux_reviews',:git=>'git@github.com:railsfactory/crux_reviews.git'

Now bundle up with:

bundle install

Next, run the rake task that copies the necessary migrations and assets to your project:

rake spree_core:install

rake crux:install

rake crux_reviews:install

And finish with a migrate:

rake db:migrate

Now you should be able to boot up your server with:

rails s  

Usage
===========

Use 'write your review' button on product page to submit your review

Login to your store adminstration console 

Store admin can edit or approve or delete the reviews by using the review management.

Config your review settings


