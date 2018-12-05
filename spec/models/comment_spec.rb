# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    create(:valid_user)
    create(:valid_category)
    create(:valid_image)
  end

  let(:comment) { build(:valid_comment) }

  it 'is an instance of Comment' do
    expect(subject).to be_an Comment
  end

  describe 'association tests' do
    it 'should belongs_to user' do
      expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'should belongs_to image' do
      expect(Comment.reflect_on_association(:image).macro).to eq(:belongs_to)
    end
  end

  describe 'validation tests' do
    it 'is invalid without an body' do
      expect(FactoryBot.build(:valid_comment, body: nil).save).to be_falsey
    end

    it 'is invalid without an user' do
      expect(FactoryBot.build(:comment_without_user).save).to be_falsey
    end

    it 'ensures picture present' do
      expect(FactoryBot.build(:comment_without_picture).save).to be_falsey
    end
  end
end
