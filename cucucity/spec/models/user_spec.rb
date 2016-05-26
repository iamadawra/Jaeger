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
    it "is invalid without a username" do
      skip("pending")
      u = build(:user, username: nil)
      expect(u).to be_invalid
    end

    it "is invalid without a role" do
      skip("pending")
      u = build(:user, role: nil)
      expect(u).to be_invalid
    end

    it "is invalid if no activation code is generated" do
      skip("pending")
      u = create(:user)
      expect(u.activation_code).to_not be_nil 
    end
  end

  context 'email validation' do
    it "is invalid without an email" do
      skip("pending")
      u = build(:user, email: nil)
      expect(u).to be_invalid
    end

    it "does not allow duplicate email (case insentive)" do
      skip("pending")
      create(:user, email: "test@example.com".downcase)
      contact2 = build(:user, email: "TEst@example.com".downcase)
      expect(contact2).not_to be_valid
    end
  end

  context 'username validation' do
    it "is invalid without an username" do
      skip("pending")
      u = build(:user, username: nil)
      expect(u).to be_invalid
    end

    it "does not allow duplicate username (case insentive)" do
      skip("pending")
      create(:user, username: "test".downcase)
      contact2 = build(:user, username: "TEst".downcase)
      expect(contact2).not_to be_valid
    end
  end

  context 'password validation' do
    it "is invalid without a password" do
      skip("pending")
      u = build(:user, password: nil)
      expect(u).to be_invalid
    end

    it "is invalid if passwords don't match" do
      skip("pending")
      u = build(:user, password: "pw1", password_confirmation: "wp1")
      expect(u).to be_invalid
    end
  end

  it "sends a confirmation email after sign up" do
    skip("pending")
    u = create(:user)
    open_last_email.should be_delivered_to u.email
  end
end
