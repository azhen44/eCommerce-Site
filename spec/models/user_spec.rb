require 'rails_helper'

RSpec.describe @User, type: :model do
  describe 'Validations' do
    #user = User.create!(first_name: "final", last_name: "login", password: "1234567", password_confirmation: "1234567", email:"finallogin@gmail.com")
    before do
      @user = User.create!(first_name: "login52", last_name: "login52", password: "123456", password_confirmation: "123456", email:"test552@gmail.com")
    end
  
    it "is not valid with different password and password confirmation" do
      @user.password_confirmation = "1234" 
      expect(@user).to_not be_valid  
    end

    it "is valid with same password and password confirmation" do
      @user.password_confirmation = "123456" 
      expect(@user).to be_valid  
    end
    it "is not valid if email already exists in database" do
      @user.email = "Test@gmail.com"
      expect(@user).to_not be_valid  
    end
    it "is not valid if email already exists in database (different casing)" do
      @user.email = "test2@gmail.com"
      expect(@user).to_not be_valid  
    end
    it "is  valid if email is unique" do
      @user.email = "tes2222t@gmail.com"
      expect(@user).to be_valid  
    end

    it "is not valid without a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid  
    end

    it "is not valid without a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid  
    end
    
    it "is not valid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid  
    end

    it "is not valid if password is not at least length of 5" do
      @user.password = "123"
      @user.password_confirmation = "123"
      expect(@user).to_not be_valid  
    end
  end
  describe 'Validations' do
    it "is valid if email and pass is correct" do
      expect(User.authenticate_with_credentials('finallogin@gmail.com','1234567').first_name).to eq("final")
    end
    
    it "is not valid if email and pass is correct" do
      expect(User.authenticate_with_credentials('finallogin@gmail.com','12345678')).to eq(nil)
    end

    it "is valid if email and pass is correct even with white spaces" do
      expect(User.authenticate_with_credentials('  finallogin@gmail.com  ','1234567').first_name).to eq("final")
    end

    it "is valid if email and pass is correct even with wrong cases" do
      expect(User.authenticate_with_credentials('FINaLLOGIN@gmail.com','1234567').first_name).to eq("final")
    end
  end
end


