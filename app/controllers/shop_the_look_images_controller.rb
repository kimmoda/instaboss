class ShopTheLookImagesController < ApplicationController
  before_action :find_shop_look_image, only: [:show]

  def index
  end

  def new
    @image_item = current_user.shop_the_look_images.build
    3.times { @image_item.shop_the_look_items.build }
  end

  def create
    @new_shop_the_look_item = current_user.shop_the_look_images.build(shop_look_image_params)
    if @new_shop_the_look_item.save
      redirect_to item_index_path
    else
      render action: 'new'
    end
  end

  def show
  end

  private

    def shop_look_image_params
      params.require(:shop_the_look_image).permit(:gender, :shop_look_image, :ww_shipping, shop_the_look_items_attributes: [:id, :_destroy, :brand, :sub_category, :category, :price, :sale, :unique_affiliate_url, :percentage_off, :shipped_from, :shop_the_look_image_id])
    end

    def find_shop_look_image
      @shop_the_look_image = ShopTheLookImage.find(params[:id])
    end

end
