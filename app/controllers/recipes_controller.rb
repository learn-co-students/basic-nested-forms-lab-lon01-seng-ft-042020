class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "First Ingredient")
    @recipe.ingredients.build(name: "second")
  end

  def create
    r = Recipe.new(recipe_params)
    
    redirect_to recipe_path(r.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
      :ingredient_1,
      :ingredient_2
      ]
    )
  
  end
end
