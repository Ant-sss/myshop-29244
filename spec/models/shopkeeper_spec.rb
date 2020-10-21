require 'rails_helper'

RSpec.describe Shopkeeper, type: :model do
  before do
    @shopkeeper = FactoryBot.build(:shopkeeper)
  end

  describe '店主の新規登録' do
    context '新規登録がうまくいくとき' do
      it '全てが正しく入力されていれば保存できる' do
        expect(@shopkeeper).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '苗字が空だと保存できない' do
        @shopkeeper.family_name = ""
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("苗字を入力してください")
      end
      it '苗字が半角だと保存できない' do
        @shopkeeper.family_name = "a"
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("苗字が正しくありません")
      end
      it '名前が空だと保存できない' do
        @shopkeeper.first_name = ""
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("名前を入力してください")
      end
      it '名前が半角だと保存できない' do
        @shopkeeper.first_name = "a"
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("名前が正しくありません")
      end
      it 'emailが空だと保存できない' do
        @shopkeeper.email = ""
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'emailに@がないと保存できない' do
        @shopkeeper.email = "a"
        @shopkeeper.valid?
      end
      it 'emailが重複していると保存できない' do
        @shopkeeper.save
        other_shopkeeper = FactoryBot.build(:shopkeeper)
        other_shopkeeper.email = @shopkeeper.email
        other_shopkeeper.valid?
        expect(other_shopkeeper.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it 'パスワードが6文字以下だと保存できない' do
        @shopkeeper.password = "aaa00"
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードが空だと保存できない' do
        @shopkeeper.password = ""
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが半角英数字でないと保存できない' do
        @shopkeeper.password = "ああああああ"
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("パスワードが正しくありません")
      end
      it 'パスワード存在しても確認用のパスワードが空だと保存できない' do
        @shopkeeper.password_confirmation = ""
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it '電話番号が空だと保存できない' do
        @shopkeeper.phone_num = ""
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が10桁以下だと保存できない' do
        @shopkeeper.phone_num = "0901234567"
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("電話番号が正しくありません")
      end
      it '電話番号にハイフンがあると' do
        @shopkeeper.phone_num = "090-1234-56"
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("電話番号が正しくありません")
      end
      it '生年月日が空だと保存できない' do
        @shopkeeper.birthday = ""
        @shopkeeper.valid?
        expect(@shopkeeper.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
