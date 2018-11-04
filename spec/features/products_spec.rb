require 'rails_helper'
RSpec.feature "Products", :type => :feature do
  describe "display product details" do
    let(:product) { create(:product) }

    it "display each product details" do
      visit "potepan/products/#{product.id}"
      expect(page).to have_content "#{product.name}"
      expect(page).to have_content "#{product.display_price}"
      expect(page).to have_content "#{product.description}"
    end
  end
end
