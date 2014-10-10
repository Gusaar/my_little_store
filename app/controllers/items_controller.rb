class ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all

    respond_with(@items) do |format|
      format.json { render json: { items: @items }}
    end
  end

  def show
    @item = Item.find_by_id(params[:id])

    respond_with(@item) do |format|
      format.json { render json: { item: @item }}
    end
  end

  def create
    @item = Item.new(item_params)
    @item.save
    
    respond_with(@item) do |format|
      format.json { render json: { item: @item }}
    end
  end

  def update
    @item = Item.find_by_id(params[:id])
    @item.update_attributes(item_params)
    
    respond_with(@item) do |format|
      format.json { render json: { item: @item }}
    end
  end

  def destroy
    @item = Item.find_by_id(params[:id])
    @item.destroy

    respond_with do |format|
      format.json { render json: { success: true }}
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description)
  end
end
