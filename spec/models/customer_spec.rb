require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'customer新規登録' do
    before do
      @customer = FactoryBot.build(:customer)
    end

      context 'customer登録がうまくいくとき' do
      it "全ての値が正しく入力されていれば保存される" do
        expect(@customer).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ニックネームが空だと登録きでない' do
        @customer.nickname = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("ニックネームを入力してください")
      end
      it '苗字が空だと登録できない' do
        @customer.family_name = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("苗字を入力してください")
      end
      it '苗字が半角だと登録できない' do
        @customer.family_name = "a"
        @customer.valid?
        expect(@customer.errors.full_messages).to include("苗字が正しくありません")
      end
      it '名前が空だと登録できない' do
        @customer.first_name = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("名前を入力してください")
      end
      it '名前が半角だと登録できない' do
        @customer.first_name = "a"
        @customer.valid?
        expect(@customer.errors.full_messages).to include("名前が正しくありません")
      end
      it '電話番号が空だと登録できない' do
        @customer.phone_num = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にハイフンが入っていると登録できない' do
        @customer.phone_num = "090-1234-56"
        @customer.valid?
        expect(@customer.errors.full_messages).to include("電話番号が正しくありません")
      end
      it '電話番号が10桁以下だと登録できない' do
        @customer.phone_num = "0901234567"
        @customer.valid?
        expect(@customer.errors.full_messages).to include("電話番号が正しくありません")
      end
      it 'メールアドレスが空だと登録できない' do
        @customer.email = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'メールアドレスに@がないと登録できない' do
        @customer.email = "a"
        @customer.valid?
      end
      it '誕生日が空だと登録できない' do
        @customer.birthday = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("生年月日を入力してください")
      end
      it 'パスワードが空だと登録できない' do
        @customer.password = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが6文字以下だと登録できない' do
        @customer.password = "aaa00"
        @customer.valid?
        expect(@customer.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードは正しく入力されていても、確認用のパスワードと一致しなければ登録できない' do
        @customer.password_confirmation = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
    end
  end

end
