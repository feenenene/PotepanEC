# frozen_string_literal: true

class Potepan::ProductsController < ApplicationController
  def show
    @product = Spree::Product.find(params[:id])
  end
end
