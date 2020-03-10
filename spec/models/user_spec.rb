require 'rails_helper'
describe User do
  describe '#create' do

    it "正常に登録されるか" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "苗字は、全角漢字ではないと通らない" do
      user = build(:user, first_name: "kana" )
      user.valid?
      expect(user.errors[:first_name]).to include("無効な苗字です")
    end

    it "名前は、全角漢字ではないと通らない" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("無効な名前です")
    end

    it "苗字カナは全角カナではないと通らない" do
      user = build(:user, first_name: "kana")
      user.valid?
      expect(user.errors[:first_name]).to include("無効な苗字です")
    end

    it "名前カナは全角カナではないと通らない" do
      user = build(:user, last_name_kana: "aaa")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("無効な名前です")
    end
    
    it "メールに＠ドメインではないと通らない" do
      user = build(:user, email: "aaa")
      user.valid?
      expect(user.errors[:email]).to include("無効なメールです")
    end

    it "パスワードは半角英数字７文字以上ではないと通らない" do
      user = build(:user, password: "aaa")
      user.valid?
      expect(user.errors[:password]).to include("無効なパスワードです")
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
