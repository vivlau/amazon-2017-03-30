class ProductsController < ApplicationController
  def new
    @product = Product.new
    # render :index
  end

  def create
    # params is a big hash, it takes the product key
    # inside the product key, it takes the three values inside it
    product_params = params.require(:product).permit([:title, :description, :price])
    @product = Product.new product_params
    if @product.save
      redirect_to product_path(@product)
      # can also do redirect_to @product <-- better to do longer version
    else
      render :new
    end
  end

  def show
    @products = Product.find params[:id]
  end

  def index
    @products = Product.offset(20).limit(20)
  end

  def destroy
    product = Product.find params[:id]
    product.destroy
    redirect_to products_path
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    product_params = params.require(:product).permit([:title, :description, :price])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

end
