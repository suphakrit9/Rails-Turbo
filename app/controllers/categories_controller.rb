class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted.'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
