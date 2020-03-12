require 'rails_helper'
describe User do
  describe '#create' do

    it "正常に登録されるか" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "苗字は、空では通らない" do
      user = build(:user, first_name: "" )
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください", "は不正な値です")
    end

    it "苗字は、全角漢字でないと通らない" do
      user = build(:user, first_name: "kana" )
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "名前は、空では通らない" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください", "は不正な値です")
    end

    it "名前は、全角漢字でないと通らない" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end

    it "苗字カナは空では通らない" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "苗字カナは全角カナではないと通らない" do
      user = build(:user, first_name_kana: "kana")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "名前カナは空では通らない" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "名前カナは全角カナではないと通らない" do
      user = build(:user, last_name_kana: "aaa")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end

    it "メールは空では通らない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください", "は不正な値です")
    end

    
    it "メールに＠ドメインではないと通らない" do
      user = build(:user, email: "aaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "パスワードは空だと通らない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください", "は不正な値です")
    end

    it "パスワードは半角英数字７文字以上ではないと通らない" do
      user = build(:user, password: "aaa")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    


    it "苗字は、全角漢字で通る" do
      user = build(:user, first_name: "金子")
      expect(user).to be_valid
    end

    it "名前は、全角漢字で通る" do
      user = build(:user, last_name: "真也")
      expect(user).to be_valid
    end

    it "苗字カナは全角カナで通る" do
      user = build(:user, first_name_kana: "カネコ")
      expect(user).to be_valid
    end

    it "名前カナは全角カナで通る" do
      user = build(:user, last_name_kana: "シンヤ")
      expect(user).to be_valid
    end

    it "メールに＠ドメインが入っているで通る" do
      user = build(:user, email: "aaa@kkk.com")
      expect(user).to be_valid
    end

    it "パスワードは半角英数字７文字以上で通る" do
      user = build(:user, password: "aaaa0000")
      expect(user).to be_valid
    end

  end
end
