class SimplePagesController < ApplicationController
  def index
    @products = Product.limit(3)
    @featured_product = Product.first
  end

  def landing_page
    @products = Product.limit(3)
    @featured_product = Product.first
  end
end
