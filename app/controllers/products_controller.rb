class ProductsController < ApplicationController
  def index
    @products=Product.all
  end
  def show
    @product=Product.find(params[:id])
  end
  def new
    @product=Product.new
  end
  def create
    @product=Product.new(product_params)

    if @product.save
      puts "Product created successfully => #{@product}"
      redirect_to products_path, notice: "Ürün başarıyla eklendi"
    else
      render :new, status: :unprocessable_entity

    end
  end
  def edit
    @product=Product.find(params[:id])
  end
  def update
    @product=Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product ,notice:"Ürün başarıyla güncellendi"
    else
      render :edit, status: :unprocessable_entity , notice:"Ürün güncellenirken bir hata oluştu"
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path, notice: "Ürün başarıyla silindi"
  end


  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock)
    end
end
