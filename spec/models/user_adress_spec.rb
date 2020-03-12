require 'rails_helper'
describe UserAdress do
  describe '#create' do

    it "正常に登録されるか"  do
      user_adress = build(:user_adress)
      expect(user_adress).to be_valid
    end

    it "苗字は、空だと通らない" do
      user_adress = build(:user_adress, first_name: "")
      user_adress.valid?
      expect(user_adress.errors[:first_name]).to include("を入力してください", "は不正な値です")
    end

    it "苗字は、全角漢字ではないと通らない" do
      user_adress = build(:user_adress, first_name: "aaa")
      user_adress.valid?
      expect(user_adress.errors[:first_name]).to include( "は不正な値です")
    end

    it "名前は、空だと通らない" do
      user_adress = build(:user_adress, last_name: "")
      user_adress.valid?
      expect(user_adress.errors[:last_name]).to include("を入力してください", "は不正な値です")
    end

    it "名前は、全角漢字ではないと通らない" do
      user_adress = build(:user_adress, last_name: "aaa")
      user_adress.valid?
      expect(user_adress.errors[:last_name]).to include( "は不正な値です")
    end

    it "苗字カナは空だと通らない" do
      user_adress = build(:user, first_name_kana: "")
      user_adress.valid?
      expect(user_adress.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "苗字カナは全角カナではないと通らない" do
      user_adress = build(:user, first_name_kana: "aaa")
      user_adress.valid?
      expect(user_adress.errors[:first_name_kana]).to include( "は不正な値です")
    end

    it "名前カナは空だと通らない" do
      user_adress = build(:user, last_name_kana: "")
      user_adress.valid?
      expect(user_adress.errors[:last_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "名前カナは全角カナではないと通らない" do
      user_adress = build(:user, last_name_kana: "aaa")
      user_adress.valid?
      expect(user_adress.errors[:last_name_kana]).to include( "は不正な値です")
    end
    
    it "携帯番号は、11桁ではないと通らない" do
      user_adress = build(:user_adress,phone_number: "0000000")
      user_adress.valid?
      expect(user_adress.errors[:phone_number]).to include("は11文字で入力してください")
    end

    it "郵便番号は、空だと通らない" do
      user_adress = build(:user_adress, postal_code: "")
      user_adress.valid?
      expect(user_adress.errors[:postal_code]).to include("を入力してください", "は7文字で入力してください")
    end

    it "郵便番号は、７桁ではないと通らない" do
      user_adress = build(:user_adress, postal_code: "666666")
      user_adress.valid?
      expect(user_adress.errors[:postal_code]).to include("は7文字で入力してください")
    end

    


    it "苗字は、全角漢字で通る" do
      user_adress = build(:user_adress, first_name: "金子")
      expect(user_adress).to be_valid
    end

    it "名前は、全角漢字で通る" do
      user_adress = build(:user_adress, last_name: "真也")
      expect(user_adress).to be_valid
    end

    it "苗字カナは全角カナで通る" do
      user_adress = build(:user_adress, first_name_kana: "カネコ")
      expect(user_adress).to be_valid
    end

    it "名前カナは全角カナで通る" do
      user_adress = build(:user_adress, last_name_kana: "シンヤ")
      expect(user_adress).to be_valid
    end

    it "携帯番号は、11桁で通る" do
      user_adress = build(:user_adress, phone_number: "11111111111")
      expect(user_adress).to be_valid
    end

    it "郵便番号は、７桁で通る" do
      user_adress = build(:user_adress, postal_code: "7777777")
      expect(user_adress).to be_valid
    end

  end
end