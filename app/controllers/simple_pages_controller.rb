class SimplePagesController < ApplicationController
  def index
    @feautured_product = Product.first
    @products = Product.limit(3)
  end

  def landing_page
    @feautured_product = Product.first
    @products = Product.limit(3)
  end
end
