require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "AnyValue", description: "AnyValue", price: 10, image_url: "AnyValue") }
    let(:user) { User.create!(email: "test@example.com", password: "123456") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Ugly Picture")
      product.comments.create!(rating: 3, user: user, body: "Okay Picture")
      product.comments.create!(rating: 5, user: user, body: "Beautiful Picture")
    end

    it "returns average comments rating" do
      expect(product.average_rating).to eq 3
    end
  end

  context "when product created" do
    let(:product) { Product.new(name: "AnyValue", description: "AnyValue", price: 10, image_url: "AnyValue") }

    it "is new record with valid attributes" do
      expect(Product.new).to be_new_record
    end
  end

  context "when product created" do
    let(:product) { Product.new(name: nil, description: "AnyValue",  price: 10, image_url: "AnyValue") }

    it "is not valid without a name" do
      expect(Product.new).not_to be_valid
    end
  end

  context "when product created" do
    let(:product) { Product.new(name: "AnyValue", description: nil,  price: 10, image_url: "AnyValue") }

    it "is not valid without a description" do
      expect(Product.new).not_to be_valid
    end
  end

  context "when product gets created" do
    let(:product) { Product.new(name: "AnyValue", description: "AnyValue", price: nil, image_url: "AnyValue") }

    it "is not valid without price" do
      expect(Product.new).not_to be_valid
    end
  end

  context "when product gets created" do
    let(:product) { Product.new(name: "AnyValue", description: "AnyValue", price: 10, image_url: nil) }

    it "is not valid without image_url" do
      expect(Product.new).not_to be_valid
    end
  end

end
