require 'rails_helper'

RSpec.describe Potepan::CategoriesController, type: :controller do
  describe "#show" do
    let!(:taxonomy) { create(:taxonomy) }
    let!(:taxon) { create(:taxon, taxonomy: taxonomy, parent: taxonomy.root) }
    let!(:taxon_child) { create(:taxon, taxonomy: taxonomy, parent: taxon) }
    let!(:product1) { create(:product, name: "correct product", taxons: [taxon_child]) }
    let!(:product2) { create(:product, name: "incorrect product") }

    before do
      get :show, params: { id: taxon_child.id }
    end

    scenario "responds successfully" do
      expect(response).to be_successful
      expect(response).to have_http_status 200
    end

    scenario "render show page" do
      expect(response).to render_template :show
    end

    scenario "assigns taxonomies" do
      expect(assigns(:taxonomies)).to match_array(taxonomy)
    end

    scenario "assigns taxon" do
      expect(assigns(:taxon)).to eq(taxon_child)
    end

    scenario "assigns correct product" do
      expect(assigns(:products)).to match_array(product1)
    end

    scenario "assigns incorrect product" do
      expect(assigns(:products)).not_to include(product2)
    end

    scenario "send invalid params" do
      expect { get :show, params: { id: '' } }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
