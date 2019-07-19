require 'rails_helper'

describe Comment do
  context "when comment is created" do
    let(:product) { Product.create!(name: "AnyValue", description: "AnynValue", price: 10, image_url: "AnyValue") }
    let(:user) { User.create!(email: "qwerty.wla@gmail.com", password: "123456") }

    before do
      product.comments.create!(rating: 3, user: user, body: "comment")
    end

    it "comment not valid without user" do
      expect(Comment.new(user_id: nil, body: "Beautiful Picture")).not_to be_valid
    end

    it "comment not valid without a text" do
      expect(Comment.new(body: "", user: user, product: product, rating: 2 )).not_to be_valid
    end

    it "comment not valid without a rating" do
      expect(Comment.new(body: "Beautiful Picture", user: user, product: product, rating: nil )).not_to be_valid
    end

    it "is not valid without product_id" do
      expect(Comment.new(product_id: nil)).to_not be_valid
    end

  end

end
