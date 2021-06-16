
## DB設計

### shopkeeper テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| family_name     | string     | null: false                    |
| first_name      | string     | null: false                    |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| phone_num       | string     | null: false                    |
| birthday        | date       | null: false                    |

has_one :shop, dependent: :destroy  
has_one :address, dependent: :destroy  
has_many :tweets, dependent: :destroy  
has_many :itemcomments, dependent: :destroy  
has_many: tweets, dependent: :destroy  
has_many :tweetcomments, dependent: :destroy  

### address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_num        | string     | null: false                    |
| building_name    | string     |                                |
| shopkeeper       | references |                                |

belongs_to :shopkeeper,  optional: true  
belongs_to_active_hash, :prefecture  

### shop テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| text                | text       | null: false                    |
| itemcategory_id     | bigint     | null: false, foreign_key: true |
| shopkeeper          | references | null: false, foreign_key: true |

belongs_to :shopkeeper  
belongs_to :itemcategory  
has_many :items, dependent: :destroy  
has_many :tweets, dependent: :destroy  
has_many:favorites, dependent: :destroy  
has_many: customers, trhough: :favorites  
has_one_attached :image  

### customer テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickame         | string     | null: false                    |
| family_name     | string     | null: false                    |
| first_name      | string     | null: false                    |
| email           | string     | null: false                    |
| phone_num       | integer    | null: false                    |
| birthday        | integer    | null: false                    |
| password        | string     | null: false                    |

has_many :itemcomments, dependent: :destroy  
has_many :tweetcomments, dependent: :destroy  
has_many :purchases  
has_many :favorites, dependent: :destroy  
has_one :residence, dependent: :destroy  
has_one :card, dependent: :destroy  

### address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_num        | string     | null: false                    |
| building_name    | string     |                                |
| customer         | references |                                |

belongs_to :customer, optional: true  
belongs_to_active_hash, :prefecture  

### card テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_token       | string     | null: false                    |
| customer_token   | string     | null: false                    |
| customer         | references | null: false, foreign_key: true |

belongs_to :customer  

### item テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | text       | null: false                    |
| price           | integer    | null :false                    |
| text            | references | null: false                    |
| itemcategory_id | bigint     | null: false,foreign_key: true  |
| size            | text       | null: false                    |
| shipfrom_id     | integer    | null: false                    |
| shipday_id      | integer    | null: false                    |
| information     | text       | null: false                    |
| shop            | references | null: false, foreign_key: true |
| shopkeeper      | references | null: false, foreign_key: true |

belongs_to :shop  
belongs_to :shopkeeper  
belongs_to :itemcategory  
has_one :purchase  
has_one :itemcomments  
has_one_attached :image  
belongs_to_active_hash :shipday  
belongs_to_active_hash :shipfrom  

### purchase テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| customer        | references | null: false, foreign_key: true |

belongs_to :item  
belongs_to :customer  

### itemcomment テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| item            | references | null: false, foreign_key: true |
| shopkeeper      | references | foreign_key: true              |
| customer        | references | foreign_key: true              |

belongs_to :item  
belongs_to :shopkeeper, optional :true  
belongs_to :customer, optional :true  

### itemcategory テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| ancestry        | string     |                                |

has_many :items  
has_ancestry  

### tweet テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| text            | text       | null: false                    |
| shopkeeper      | references | null: false, foreign_key: true |
| shop            | references | null: false, foreign_key: true |

belongs_to :shopkeeper  
belongs_to :shop  
has_many :tweetcomments  
has_one_attached :image  

### tweetcomment テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| item            | references | null: false, foreign_key: true |
| shopkeeper      | references | foreign_key: true              |
| customer        | references | foreign_key: true              |

belongs_to :item  
belongs_to :shopkeeper, optional :true  
belongs_to :customer, optional :true  

### favorite テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| customer        | references | null: false, foreign_key: true |
| shop            | references | null: false, foreign_key: true |

belongs_to :customer  
belongs_to :shop  
