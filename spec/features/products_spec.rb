require 'rails_helper'

RSpec.feature "Products", type: :feature do
  describe "display product details" do
    given(:product) { create(:product) }

    background { visit potepan_product_path(product.id) }

    scenario "display each product details" do
      expect(page).to have_title "#{product.name} - Potepan Store"
      expect(page).to have_selector '.page-title h2', text: product.name
      expect(page).to have_selector '.col-xs-6 li', text: product.name
      expect(page).to have_selector '.media-body h2', text: product.name
      expect(page).to have_selector 'h3', text: product.display_price
      expect(page).to have_content product.description
    end

    scenario 'move to cart page' do
      click_link 'カートへ入れる'
      expect(page).to have_current_path potepan_cart_page_path
    end
  end
end
