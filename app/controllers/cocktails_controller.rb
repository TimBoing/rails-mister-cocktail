class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @img_placeholder = "https://library.kissclipart.com/20180830/ike/kissclipart-cocktail-png-clipart-cocktail-martini-screwdriver-0320b7841261c238.jpg"
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render new_cocktail_path
    end
  end

  def edit
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktails_path
    else
      render edit_cocktail_path(@cocktail)
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :image, :photo)
  end
end
