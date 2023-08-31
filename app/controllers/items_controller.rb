class ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items, include: :user
  end

  def user_items
    user = User.find(params[:user_id])
    items = user.items
    render json: items, include: :user, status: :ok
  end

  def show_user_item
    user = User.find(params[:user_id])
    item = user.items.find(params[:id])
    render json: item, include: :user, status: :ok
  end

  def create_user_item
    user = User.find(params[:user_id])
    item = user.items.build(item_params)
    
    if item.save
      render json: item, include: :user, status: :created
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :description, :price)
  end

end
