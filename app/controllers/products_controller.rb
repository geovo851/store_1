class ProductsController < ApplicationController
  filter_resource_access

  def index
    @products = Product.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
   
    if @product.save
      redirect_to products_path
    else
      @categories = Category.all
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
   
    if @product.update(product_params)
      redirect_to products_path
    else
      @categories = Category.all
      render 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
 
    redirect_to products_path
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :photo, :description, :category_id, 
                                   :price, :available)
    end
end
