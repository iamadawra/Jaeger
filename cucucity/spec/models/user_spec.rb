require 'rails_helper'

describe User, type: :model do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  it "is invalid without an email" do
    u = build(:user, email: nil)
    expect(u).to be_invalid
  end

  it "is invalid without a password" do
    u = build(:user, password: nil)
    expect(u).to be_invalid
  end

  it "is invalid without a first_name" do
    u = build(:user, first_name: nil)
    expect(u).to be_invalid
  end

  it "is invalid without a last_name" do
    u = build(:user, last_name: nil)
    expect(u).to be_invalid
  end

  it "is invalid without a role" do
    u = build(:user, role: nil)
    expect(u).to be_invalid
  end

  it "is invalid if no activation code is generated" do
    u = create(:user)
    expect(u.activation_code).to_not be_nil 
  end

  it "does not allow duplicate phone numbers per contact" do
    contact = create(:user, email: "test@example.com")
    contact2 = build(:user, email: "test@example.com")
    expect(contact2).not_to be_valid
  end

  it "sends a confirmation email after sign up" do
    u = create(:user)
    open_last_email.should be_delivered_to u.email
  end

  it "returns a user's full name as a string" do
    contact = build(:user, first_name: "John", middle_name: "Donald", last_name: "Doe")
    expect(contact.get_name).to eq("John Donald Doe")
  end
end
