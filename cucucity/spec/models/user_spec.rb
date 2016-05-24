require 'rails_helper'

# TODO
# 1. validate email format
# 2. password should ont contains blank
# 3. validate length of username, email, password

describe User, type: :model do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end
  
  context 'null validation' do
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
  end

  context 'email validation' do
    it "is invalid without an email" do
      u = build(:user, email: nil)
      expect(u).to be_invalid
    end

    it "does not allow duplicate email (case insentive)" do
      contact = create(:user, email: "test@example.com".downcase)
      contact2 = build(:user, email: "TEst@example.com".downcase)
      expect(contact2).not_to be_valid
    end
  end

  context 'username validation' do
    it "is invalid without an username" do
      u = build(:user, username: nil)
      expect(u).to be_invalid
    end

    it "does not allow duplicate username (case insentive)" do
      contact = create(:user, username: "test".downcase)
      contact2 = build(:user, username: "TEst".downcase)
      expect(contact2).not_to be_valid
    end
  end

  context 'password validation' do
    it "is invalid without a password" do
      u = build(:user, password: nil)
      expect(u).to be_invalid
    end

    it "is invalid if passwords don't match" do
      u = build(:user, password: "pw1", password_confirmation: "wp1")
      expect(u).to be_invalid
    end
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
