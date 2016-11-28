Rails.application.routes.draw do

  resources :shop_the_look_items
  resources :shop_the_look_images
  get 'client/all'
  # delete 'session' => 'sessions#destroy'

  resources :client

  devise_for :admins
  resources :admin do
    collection do
      get 'shop_look_image'
    end
  end


  get 'blog/index'
  get 'blog/blog_women'
  get 'blog/mvp_blog'
  get 'blog/jaf_blog'
  get 'blog/retromarine_blog'
  get 'blog/auguste_blog'
  get 'blog/showpo_blog'


  get 'admin/shop_look_image'

  post 'admin/:id/update_staff_true' => 'admin#update_staff_true'
  post 'admin/:id/update_featured_true' => 'admin#update_featured_true'
  post 'admin/:id/update_staff_false' => 'admin#update_staff_false'
  post 'admin/:id/update_featured_false' => 'admin#update_featured_false'

  post 'admin/:id/update_shop_staff_true' => 'admin#update_shop_staff_true'
  post 'admin/:id/update_shop_featured_true' => 'admin#update_shop_featured_true'
  post 'admin/:id/update_shop_staff_false' => 'admin#update_shop_staff_false'
  post 'admin/:id/update_shop_featured_false' => 'admin#update_shop_featured_false'

  # post 'admin/featured_item'
  # post 'admin/update_staff'

  # post 'men_brand/search' => 'men_brand#search', as: 'men_search_brand'
  post 'men_brand/side_search' => 'men_brand#side_search', as: 'men_side_search_brand'

  get 'men_brand/mobile_men_search'
  get 'men_brand/leo_joseph'
  get 'men_brand/windsor_smith'
  get 'men_brand/bronze_snake'
  get 'men_brand/adidas'
  get 'men_brand/mj_bale'
  get 'men_brand/the_modest_vintage_player'
  get 'men_brand/new_balance'
  get 'men_brand/daniel_wellington'
  get 'men_brand/just_another_fisherman'
  get 'men_brand/mvmt'
  get 'men_brand/morepork'
  get 'men_brand/retro_marine'
  get 'men_brand/sunday_somewhere'
  get 'men_brand/i_love_ugly'
  get 'men_brand/nike'

  # post 'women_brand/search' => 'women_brand#search', as: 'women_search_brand'
  post 'women_brand/side_search' => 'women_brand#side_search', as: 'women_side_search_brand'

  # post 'women_brand/side_search' => 'women_brand#side_search', as: 'mobile_women_search'

  get 'women_brand/mobile_women_search'
  get 'women_brand/lorna_jane'
  get 'women_brand/windsor_smith'
  get 'women_brand/bronze_snake'
  get 'women_brand/coopers_st'
  get 'women_brand/new_balance'
  get 'women_brand/tony_bianco'
  get 'women_brand/sunday_somewhere'
  get 'women_brand/showpo'
  get 'women_brand/mura'
  get 'women_brand/esther'
  get 'women_brand/senso'
  get 'women_brand/samantha_wills'
  get 'women_brand/princess_polly'
  get 'women_brand/jo_mercer'
  get 'women_brand/daniel_wellington'
  get 'women_brand/alice_mccall'
  get 'women_brand/auguste'
  get 'women_brand/sea_folly'
  # get 'women_brand/top_shop'
  # get 'women_brand/victorias_secret'


  post 'brand/search_men' => 'brand#search_men', as: 'search_brand_men'

  get 'site/about'
  get 'site/contact'


  devise_for :users

  resources :item
  get 'site/sale_mens'
  get 'site/sale_womens'

  root "site#index"

  get 'women' => 'women#index'
  get 'women/shop_the_look'
  get 'women/all'
  get 'women/accessorie'
  get 'women/dress'
  get 'women/jean_legging'
  get 'women/lifestyle'
  get 'women/shoe'
  get 'women/short_skirt'
  get 'women/sunglass_watch'
  get 'women/swim_beachwear'
  get 'women/top'
  get 'women/about'
  get 'women/contact'
  get 'women/brand'


  get 'men' => 'men#index'
  get 'men/shop_the_look'
  get 'men/brand'
  get 'men/all'
  get 'men/formal'
  get 'men/lifestyle'
  get 'men/long'
  get 'men/shoe'
  get 'men/top'
  get 'men/short_swimwear'
  get 'men/sunglass_watch'
  get 'men/accessorie'
  get 'men/about'
  get 'men/contact'
end
