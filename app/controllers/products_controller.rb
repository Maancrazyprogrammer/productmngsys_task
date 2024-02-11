class ProductsController < ApplicationController

  before_action :authenticate_user!
  def index

    @products=Product.all


  end
  def destroy
    @product = Product.find(params[:id])
    authorize! :destroy, Product

    if @product.destroy
      redirect_to products_path, notice: 'Product successfully deleted.'
    end
  end

  def show

    authorize! :read, Product
    @product=Product.find(params[:id])


    @user = current_user
  end
  def edit
    @product = Product.find(params[:id])
    authorize! :edit, Product


  end

  def update
    @product = Product.find(params[:id])
    # authorize! :update, Product


    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def new
    @product=Product.new
    authorize! :new, Product


  end

  def create
    @product=Product.new(product_params)
    # authorize! :create, Product

    if @product.save
      redirect_to products_path
    else
      render :new, status:
    end
  end
  private
    def product_params
      params.require(:product).permit(:p_Name,:p_price,:p_photo)
    end
end
