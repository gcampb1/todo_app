require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'has a valid factory' do
    expect(build(:homework)).to be_valid
  end

it 'is valid with required attributes' do
  task = create(:email)

  expect(task).to be_valid
end


it 'will return false on save without a name' do
  task = build(:homework, name: nil)

  expect(task.save).to eq(false)
end

it 'will thorw a "cant be blank" without a priority' do
    task = build(:email, priority: nil)
    task.save

    expect(task.errors[:priority]).to include("can't be blank")
  end

  it 'will return false without a due date' do
    task = build(:email, due_date: nil)

    expect(task.save).to eq(false)
  end

  it 'belongs to a user' do
    expect(Task.reflect_on_association(:user).macro).to eq(:belongs_to)
  end


end
