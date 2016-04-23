require 'rails_helper'

RSpec.describe Snippet, type: :model do
  describe "validations" do

    def valid_attributes
      {title: "My awesome code Snippet", work: "a = c"}
    end

    it "must have a title" do
      s = Snippet.new(valid_attributes.merge(title: nil))
      expect(s).to be_invalid
    end

    it "must have a unique title" do
      Snippet.create(valid_attributes)
      s = Snippet.new(valid_attributes)
      expect(s).to be_invalid
    end

    it "must have a body(work)" do
      s = Snippet.new(valid_attributes.merge(work: nil))
      expect(s).to be_invalid
    end

  end
end
