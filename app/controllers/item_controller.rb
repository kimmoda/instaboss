class ItemController < ApplicationController
  before_action :find_item, only: [:destroy, :show, :edit, :update]
  before_action :all_items, only: [:show]
  before_action :require_permission, only: [:edit]
  before_action :authenticate_user!, only: [:destroy, :edit, :update, :create]
  helper_method :sort_column, :sort_direction

  def save_my_previous_url
  end

  def index
    if !current_user
      redirect_to root_path
    else
      @all_items = current_user.fashion_items.paginate(:page => params[:page], :per_page => 20).all.order(sort_column + ' ' + sort_direction)
    end
  end

  def new
    @item = current_user.fashion_items.build
  end

  def create
    @item = current_user.fashion_items.build(fashion_item_params)
    if @item.save
      redirect_to item_index_path
    else
      render 'new'
    end
  end

  def edit
  end


  def destroy
    @item.destroy
    redirect_to item_index_path
  end

  def update
   if @item.update_attributes(fashion_item_params)
    redirect_to item_index_path
   else
    redirect_to item_path
   end
  end

  def show
    session[:my_previous_url] = URI(request.referer || '').path
    @back_url = session[:my_previous_url]
    if @item.sex == "Mens"
      @more_you_might_like = @all.more_you_might_like(@item.category, @item.sex)
    elsif @item.sex == "Womens"
      @more_you_might_like = @all.more_you_might_like(@item.category, @item.sex)
    end
  end

  private

    def all_items
      @all = FashionItem.all
    end

    def require_permission
      if current_user != FashionItem.find(params[:id]).user
        redirect_to root_path
      end
    end

    def find_item
      @item = FashionItem.find(params[:id])
    end

    def fashion_item_params
      params.require(:FashionItem).permit(:sex, :brand, :description, :category, :sub_category, :price, :sale, :item_image, :duration, :shipped_from, :user_id, :sale_price, :short_description, :wwshipping, :unique_affiliate_url)
    end

    def sort_column
      FashionItem.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end
end

