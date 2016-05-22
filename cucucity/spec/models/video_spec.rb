require 'rails_helper'

RSpec.describe Video, type: :model do
  context "uploading video"
	it "is invalid without a title" do
      v = build(:video, title: nil)
      expect(v).to be_invalid
    end

    it "is invalid without a uploader" do
      v = build(:video, uploader: nil)
      expect(v).to be_invalid
    end

    it "is invalid without a url" do
      v = build(:video, url: nil)
      expect(v).to be_invalid
    end

    context "if it is in the competition" do
	    it "is invalid without a competition_id" do
	      v = build(:video, title: nil)
	      expect(v).to be_invalid
	    end
	end
  end
end
