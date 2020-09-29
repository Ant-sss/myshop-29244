class Shipday < ActiveHash::Base
  self.data = [
    { id: 1, name: "選択してください"}, { id: 2, :name: "１〜２日で発送"},
    { id: 3, :name: "２〜３日で発送"}, { id: 4, :name: "４〜７日で発送"}, 
    { id: 5, :name: "7日以上"},
  ]
end
