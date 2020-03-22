require 'rails_helper'
describe Product do
  describe '#create' do

    # it "正常に登録されるか"  do
    #   product = build(:product)
    #   expect(product).to be_valid
    # end


    it "名前は、空だと通らない" do
      product = build(:product,name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "商品説明は、空だと通らない" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "カテゴリーは空だと通らない" do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "商品状態は、空だと通らない" do
      product = build(:product, condition_id: "")
      product.valid?
      expect(product.errors[:condition_id]).to include("を入力してください")
    end

    it "配送料の負担は、空だと通らない" do
      product = build(:product, postage_burden: "")
      product.valid?
      expect(product.errors[:postage_burden]).to include("を入力してください")
    end

    it "配送の方法は、空だと通らない" do
      product = build(:product, sending_method_id: "")
      product.valid?
      expect(product.errors[:sending_method_id]).to include("を入力してください")
    end

    it "発送元は、空だと通らない" do
      product = build(:product, area_id: "")
      product.valid?
      expect(product.errors[:area_id]).to include("を入力してください")
    end

    it "発送までの日数は、空だと通らない" do
      product = build(:product,scheduled_sending_date: "")
      product.valid?
      expect(product.errors[:scheduled_sending_date]).to include("を入力してください")
    end

    it "価格は、空だと通らない" do
      product = build(:product,price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end


  end
end