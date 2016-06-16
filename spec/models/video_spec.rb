require 'rails_helper'

RSpec.describe Video, type: :model do
  context "uploading video" do
  	context "if it is logged in" do
		it "is invalid without a title" do
		  skip("pending")
	      v = build(:video, title: nil)
	      expect(v).to be_invalid
	    end

	    it "is invalid without a uploader" do
	      skip("pending")
	      v = build(:video, uploader: nil)
	      expect(v).to be_invalid
	    end

	    it "is invalid without a url" do
	      skip("pending")
	      v = build(:video, url: nil)
	      expect(v).to be_invalid
	    end
	end

    context "if it is in the competition" do
	    it "is invalid without a competition_id" do
	      skip("pending")
	      v = build(:video, title: nil)
	      expect(v).to be_invalid
	    end
	end

  end
end