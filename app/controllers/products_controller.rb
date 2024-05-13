class ProductsController < ApplicationController

  before_action :set_product, only: %i[show edit update destroy]
  #after_action methodu da yazabilirsin

  def index
    @products=Product.all
  end

  def show
    #before action ile veri alınıyor -- çalışma mantığı için before_action metoduna bak
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
    #before action ile çalışıyor
  end

  def update
    if @product.update(product_params)
      redirect_to @product ,notice:"Ürün başarıyla güncellendi"
    else
      render :edit, status: :unprocessable_entity , notice:"Ürün güncellenirken bir hata oluştu"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Ürün başarıyla silindi"
  end


  private
    def set_product
      @product=Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock)
    end
end
