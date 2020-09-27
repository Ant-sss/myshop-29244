class Categorydetail < ActiveHash::Base
  self.data = [
    { id: 1, name: "ネックレス" }, { id: 2, name: "チョーカー" },
    { id: 3, name: "ペンダント" }, { id: 4, name: "ピアス" },
    { id: 5, name: "イヤリング" }, { id: 6, name: "イヤーカフ" },
    { id: 7, name: "リング・指輪" }, { id: 8, name: "ピンキーリング" },
    { id: 9, name: "ファランジリング" }, { id: 10, name: "ブレスレット・バングル" },
    { id: 11, name: "ボディピアス" }, { id: 12, name: "ブローチ・コサージュ" },
    { id: 13, name: "スカーフ" }, { id: 14, name: "ヘアアクセサリー" },
    { id: 15, name: "その他" },
    
    # 洋服
    
    { id: 16, name: "トップス" }, { id: 17, name: "パンツ" },
    { id: 18, name: "スカート" }, { id: 19, name: "ワンピース" },
    { id: 20, name: "ジャケット" }, { id: 21, name: "コート" },
    { id: 22, name: "ベビー用品" }, { id: 23, name: "靴下" },
    { id: 24, name: "その他" },
    
    # 雑貨
    { id: 25, name: "手鏡・卓上ミラー" }, { id: 26, name: "フォトフレーム・フォトスタンド" },
    { id: 27, name: "オーナメント・置物" }, { id: 28, name: "ぬいぐるみ・人形" },
    { id: 29, name: "ティッシュケース" }, { id: 30, name: "アロマグッズ・香炉" },
    { id: 31, name: "ルームフレグランス" }, { id: 32, name: "植物" },
    { id: 33, ame: "文具" }, { id: 34, name: "その他" },
    
    # 家具
    { id: 35, name: "ソファ" }, { id: 36, name: "チェア・椅子" },
    { id: 37, name: "テーブル・デスク" }, { id: 38, name: "収納家具" },
    { id: 39, name: "ラグ・カーペット" }, { id: 40, ame: "子供家具" },
    { id: 41, name: "ペット家具" }, { id: 42, name: "時計" },
    { id: 43, name: "観葉植物" }, { id: 44, name: "その他" },
    
    # 食べ物
    { id: 45, name: "野菜" }, { id: 46, name: "果物" },
    { id: 47, name: "飲み物" }, { id: 48, name: "おやつ" },
    { id: 49, name: "その他" },
    
    # 写真
    { id: 50, name: "自然写真" }, { id: 51, name: "人物写真" },
    { id: 52, name: "人工物写真" }, { id: 53, name: "その他" },
    
    # 絵
    { id: 54, name: "水彩画・アクリル画" }, { id: 55, name: "油絵・版画" },
    { id: 56, name: "パステル画" }, { id: 57, name: "色鉛筆画" },
    { id: 58, name: "鉛筆画" }, { id: 59, name: "その他" },

  ]
end
