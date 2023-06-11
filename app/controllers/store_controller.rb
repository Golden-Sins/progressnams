class StoreController < ApplicationController
  skip_before_action :authorize
  include Counter
  include CurrentCart
  before_action :increment_counter, only: [:index]
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale]) 
    else
      @products = Product.order(:title) 
    end
  end
end
