require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: "baptiste.josse@gmail.com", token: "azerty123456", token_generated_at: Date.today) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without an email address" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
end
