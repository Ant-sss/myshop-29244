class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: 'アクセサリー' },
    { id: 3, name: '洋服' }, { id: 4, name: '雑貨' },
    { id: 5, name: '家具' }, { id: 6, name: '食べ物' },
    { id: 7, name: '写真' }, { id: 8, name: '絵' }
  ]
end
