class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  before_action :only => [:new, :edit] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end


  def index
    if current_order.status == "Paid"
      session[:order_id] = nil
    end
    @products = Product.all
    @order_item = current_order.order_items.new

  end

  def show
    @order = current_order
    @order_items = current_order.order_items.new
    @product = Product.find(params[:id])
      respond_to do |format|
      format.html { redirect_to products_path}
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end


  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        if params[:product][:image]
          params[:product][:image].each { |image|
            @product.images.create(image: image)
          }
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :category, :image)
    end
end
