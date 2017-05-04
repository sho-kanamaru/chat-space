require 'rails_helper'

describe Message do

  let(:message) { build(:message) }

  describe '#create' do
    it "is valid with a body, group_id, user_id" do
      expect(message).to be_valid
    end

    it "is invalid without a body" do
      message.body = ""
      message.valid?
      expect(message.errors[:body]).to include("を入力してください。")
    end

  end
end
