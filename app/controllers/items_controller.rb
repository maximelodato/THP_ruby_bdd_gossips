class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
  
    def edit
      # L'action 'edit' reste généralement vide, elle prépare simplement la vue pour la modification
    end
  
    def update
      if @item.update(item_params)
        redirect_to @item, notice: 'Item was successfully updated.'
      else
        render :edit
      end
    end
  
    private
  
    def set_item
      @item = Item.find(params[:id])
    end
  
    def item_params
      params.require(:item).permit(:name, :description)  # Adaptez les attributs à ceux de votre modèle
    end
  end
  