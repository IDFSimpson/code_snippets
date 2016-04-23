require 'rails_helper'

RSpec.describe Kind, type: :model do
  describe "validations" do

    def valid_attributes
      {name: "Visual Basic"}
    end

    it "has a name" do
      k = Kind.new(valid_attributes.merge(name: nil))
      k.valid?
      expect(k.errors).to have_key(:name)
    end

    it "has a unique name" do
      Kind.create(valid_attributes)
      k = Kind.new(valid_attributes)
      expect(k).to be_invalid
    end

    it "has a unique name regardless of case"

    it "has a titleized name"

  end
end
