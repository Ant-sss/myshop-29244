require 'rails_helper'

RSpec.describe Residence, type: :model do
  describe 'customer新規登録' do
    before do 
      @residence = FactoryBot.build(:residence)
    end

    context '住所登録がうまくいくとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@residence).to be_valid
      end
      it '建物名が空でも入力できる' do
        @residence.building_name = ""
        expect(@residence).to be_valid
      end
    end

    context '住所登録がうまくいかないとき' do
      it '郵便番号が空だと登録できない' do
        @residence.postal_code = ""
        @residence.valid?
        expect(@residence.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @residence.postal_code = "1234567"
        @residence.valid?
        expect(@residence.errors.full_messages).to include("郵便番号が正しくありません")
      end
      it '郵便番号が正しく入力されていないと登録できない' do
        @residence.postal_code = "1234"
        @residence.valid?
        expect(@residence.errors.full_messages).to include("郵便番号が正しくありません")
      end
      it '都道府県を選択していないと登録できない' do
        @residence.prefecture_id = 1
        @residence.valid?
        expect(@residence.errors.full_messages).to include("都道府県を選択してください")
      end
      it '市町村区が空だと登録できない' do
        @residence.city = ""
        @residence.valid?
        expect(@residence.errors.full_messages).to include("市町村区を入力してください")
      end
      it '番地が空だと登録できない' do
        @residence.house_num = ""
        @residence.valid?
        expect(@residence.errors.full_messages).to include("番地を入力してください")
      end
    end
  end
end
