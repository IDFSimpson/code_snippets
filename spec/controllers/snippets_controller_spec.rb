require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new snippet variable" do
      get :new
      expect(assigns(:snippet)).to be_a_new(Snippet)
    end
  end

  describe "#create" do
    context "with valid snippet attributes" do
      def valid_request
        post :create, snippet: FactoryGirl.attributes_for(:snippet)
      end

      it "add a new snippet record to the database" do
        expect { valid_request }.to change { Snippet.count }.by(1)
      end

      it "redirects to the snippet show page" do
        valid_request
        expect(response).to redirect_to(Snippet.last)
      end

    end

    context "with invalid snippet attributes" do
      def invalid_request
        post :create, snippet: FactoryGirl.attributes_for(:snippet).merge(title: nil)
      end

      it "doesn't add a record to the database" do
        expect { invalid_request }.to change { Snippet.count }.by(0)
      end

      it "renders the new template" do
        invalid_request
        expect(response).to render_template(:new)
      end
    end
  end
end
