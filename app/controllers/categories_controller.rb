class CategoriesController < ApplicationController

  before_action :set_category, only: %i[show edit update destroy]
  #after_action methodu da yazabilirsin

  def show
    @category=Category.find(params[:id])
  end

  def index
    @categories=Category.all
  end

  def new
    @category=Category.new
  end

  def create
    @category=Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Kategori başarıyla oluşturuldu"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Kategori başarıyla güncellendi"
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @category.destroy

    redirect_to products_path, notice: "#{@category.name} adlı kategori başarıyla silindi"
  end

  private

    def set_category
      @category=Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
