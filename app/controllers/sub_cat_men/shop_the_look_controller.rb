class SubCatMen::ShopTheLookController < MenController

  def shop_the_look
    @shop_the_look_mens = @shop_look_images.shop_the_look_men
  end

  def other
    @shop_the_look_mens = @shop_look_images.find_sub_category_mens("Other")
  end

  def going_out
    @shop_the_look_mens = @shop_look_images.find_sub_category_mens("Going")
  end

  def working_out
    @shop_the_look_mens = @shop_look_images.find_sub_category_mens("Working")
  end

  def casual
    @shop_the_look_mens = @shop_look_images.find_sub_category_mens("Casual")
  end
end