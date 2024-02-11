class CartsController < ApplicationController

  def index
    authorize! :read, Cart

  end

  def show
    authorize! :read, Cart
    @user = current_user
    @cart= @user.carts.includes(:product)
    @total_bill = calculate_total_bill(@cart)
  end



  def new
    authorize! :new, Cart
    @cart = @user.carts.build(cart_params)

  end

  def create
    @user = current_user
    @product = Product.find(params[:cart][:product_id])
    existing_cart = @user.carts.find_by(product: @product)

    if existing_cart
      existing_cart.update(quantities: existing_cart.quantities + params[:cart][:quantities].to_i)
      redirect_to cart_path(@user), notice: 'Quantity updated successfully.'
    else
      @cart = @user.carts.build(cart_params)
      authorize! :create, Cart

      if @cart.save
        redirect_to @cart, notice: 'Item added to cart successfully.'
      else
        redirect_to @product, alert: 'Failed to add item to cart.'
      end
    end
  end

  def confirm_order
    @user = current_user
    @cart = @user.carts.includes(:product)
    @total_bill = calculate_total_bill(@cart)

    # Send confirmation email using Sidekiq
    OrderConfirmationMailer.order_confirmation(@user, @cart, @total_bill).deliver_now

    # Clear the user's cart
    @user.carts.destroy_all

    redirect_to products_path, notice: 'Order confirmation email sent | Please check email | Please confirm the order'
  end

  def edit
  end
  private

  def cart_params
    params.require(:cart).permit(:product_id, :user_id, :quantities)
  end

  private

  def calculate_total_bill(cart)
    cart.sum { |cart| cart.quantities * cart.product.p_price.to_i }
  end
end
