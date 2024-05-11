class CategoriesController < ApplicationController
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
    @category=Category.find(params[:id])
  end

  def update
    @category=Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category, notice: "Kategori başarıyla güncellendi"
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @category=Category.find(params[:id])
    @category.destroy

    redirect_to products_path, notice: "#{@category.name} adlı kategori başarıyla silindi"
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
