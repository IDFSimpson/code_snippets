require 'rails_helper'

RSpec.describe User, type: :model do

  def valid_attributes
    FactoryGirl.attributes_for(:user)
  end

  it "must have an email" do
    s = User.new(valid_attributes.merge(email: nil))
    expect(s).to be_invalid
  end

  it "must have a unique email" do
    User.create(valid_attributes.merge(email: "email@email.com"))
    e = User.new(valid_attributes.merge(email: "email@email.com"))
    expect(e).to be_invalid
  end

  it "must have a password" do
    s = User.new(valid_attributes.merge(password: nil))
    expect(s).to be_invalid
  end

end
