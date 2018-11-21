require 'rails_helper'

RSpec.feature "Products", type: :feature do
  describe "display product details" do
    let(:product) { create(:product) }

    background { visit potepan_product_path(product.id) }

    scenario "display each product details" do
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price
      expect(page).to have_content product.description
    end

    scenario 'move to cart page' do
      click_link 'カートへ入れる'
      expect(page).to have_current_path potepan_cart_page_path
    end
  end
end
