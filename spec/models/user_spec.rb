require 'spec_helper'

RSpec.describe User, type: :model do 
  context "attributes" do
    let(:user) {User.new(username: "sophia", email: "sophia@email.com", password: "password")}
    it "has a username" do
      expect(user.username).to eq("sophia")
    end

    it "has an email" do
      expect(user.email).to eq("sophia@email.com")
    end

    it "has a password" do
      expect(user.password).to eq("password")
    end
  end

  context "validations" do
    it "is invalid without a username" do
      expect(User.create(username: nil, email: "sophia@email.com", password: "password")).to_not be_valid
    end

    it "is invalid without an email" do
      expect(User.create(username: "sophia", email: nil, password: "password")).to_not be_valid
    end

    it "is invalid without a password" do
      expect(User.create(username: "sophia", email: "sophia@email.com", password: nil)).to_not be_valid
    end

    it "is invalid if username is taken" do
      user = User.create(username: "sophia", email: "sophia@email.com", password: "password")

      expect(User.create(username: "sophia", email: "sophia2@email.com", password: "password")).to_not be_valid
    end

    it "is invalid if email is taken" do
      user = User.create(username: "sophia", email: "sophia@email.com", password: "password")

      expect(User.create(username: "sophia2", email: "sophia@email.com", password: "password")).to_not be_valid
    end
  end
end