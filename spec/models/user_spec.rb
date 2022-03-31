require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: "baptiste.josse@gmail.com", token: "azerty123456", token_generated_at: Date.today) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without an email address" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  subject { User.create(email: "baptiste .josse@gmail. com", token: "azerty123456", token_generated_at: Date.today) }
  
  it "removes empty spaces from email address" do
    expect(subject.email).to eq("baptiste.josse@gmail.com")
  end

  subject { User.create(email: "Baptiste.josse@gmail.Com", token: "azerty123456", token_generated_at: Date.today) }

  it "downcases all upcased characters from email address" do
    expect(subject.email).to eq("baptiste.josse@gmail.com")
  end

end
