require 'rails_helper'

RSpec.describe Shopkeeper, type: :model do
  before do
    @shopkeeper = FactoryBot.build(:shopkeeper)
  end

  describe '店主の新規登録' do
    context '新規登録がうまくいくとき' do
      it '全てが正しく入力されていれば保存できる' do
      end
    end

    context '新規登録できないとき' do
      it '苗字が空だと保存できない' do
      end
      it '苗字が半角だと保存できない' do
      end
      it '名前が空だと保存できない' do
      end
      it '名前が半角だと保存できない' do
      end
      it 'emailが空だと保存できない' do
      end
      it 'emailに@がないと保存できない' do
      end
      it 'emailが重複していると保存できない' do
      end
      it 'パスワードが6文字以下だと保存できない' do
      end
      it 'パスワードが空だと保存できない' do
      end
      it 'パスワードが半角英数字でないと保存できない' do
      end
      it 'パスワード存在しても確認用のパスワードが空だと保存できない' do
      end
      it '電話番号が空だと保存できない' do
      end
      it '電話番号が10桁以下だと保存できない' do
      end
      it '電話番号にハイフンがあると' do
      end
      it '生年月日が空だと保存できない' do
      end
    end
  end
end
