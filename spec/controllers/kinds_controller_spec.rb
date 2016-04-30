require 'rails_helper'

RSpec.describe KindsController, type: :controller do

  describe "#index" do

    it "assigns an instance variable to all campaigns in the DB" do
      c  = FactoryGirl.create(:kind)
      c1 = FactoryGirl.create(:kind)

      get :index

      expect(assigns(:kinds)).to eq([c, c1])
    end

  end

  describe "#show" do
    let(:kind) { FactoryGirl.create(:kind) }
    before {get :show, id: kind.id }

    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "sets a kind instance variable" do
      expect(assigns(:kind)).to eq(kind)
    end

  end


end
