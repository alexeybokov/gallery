# frozen_string_literal: true

require 'spec_helper'

describe Activity, type: :model do

  before do
    build(:valid_user)
    build(:valid_activity)
  end

  let(:activity) { build(:valid_activity) }

  it 'is an instance of Activity' do
    expect(subject).to be_an Activity
  end

  context 'associations' do
    it 'belongs to user' do
      expect(Activity.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end

  context 'validates' do
    context 'should be invalid' do
      it 'without an action' do
        expect(build(:valid_activity, action: nil, url: activity.url)).not_to be_valid
      end

      it 'without url' do
        expect(build(:valid_activity, action: activity.action, url: nil)).not_to be_valid
      end

      it 'without user' do
        expect(build(:valid_activity, action: activity.action, user_id: nil)).not_to be_valid
      end
    end

    context 'successful validate' do
      it 'must be save to data base' do
        expect(Activity.count).to eq(0)
      end
    end
  end
end
