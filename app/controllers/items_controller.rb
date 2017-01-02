class ItemsController < ApplicationController
  def create
    @user = current_user
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to @user
    else
      flash.now[:alert] = "There was an error saving the item. Please try again."
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
