require 'rails_helper'

RSpec.describe Todo, type: :model do
  subject { Todo.new(title: "Peers&Peers test", description: "Take Peers & Peers technical test (and pass it)", due_date: Date.today, done: false, position: 1) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end
