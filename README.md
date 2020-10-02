# shop テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| shopkeeper      | references | null: false, foreign_key: true |

belongs_to :shopkeeper
has_many :items
has_many :tweets
has_one_

# shopkeeper テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| family_name     | string     | null: false                    |
| first_name      | string     | null: false                    |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| birthday        | date       | null: false                    |

has_one :shop
has_many :tweets
has_many :comments
has_one :address

# tweet テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| text            | text       | null: false                    |
| shopkeeper      | references | null: false, foreign_key: true |
| shop            | references | null: false, foreign_key: true |

belongs_to :shopkeeper
belongs_to :shop
has_many :comments

# comment テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| tweet           | references | null: false, foreign_key: true |
| shopkeeper      | references | null: false, foreign_key: true |
| customer        | references | null: false, foreign_key: true |

belongs_to :tweet
belongs_to :shopkeeper
belongs_to :customer

# itemcomment テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| item            | references | null: false, foreign_key: true |
| shopkeeper      | references | null: false, foreign_key: true |
| customer        | references | null: false, foreign_key: true |

belongs_to :item
belongs_to :shopkeeper
belongs_to :customer

# item テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | text       | null: false                    |
| text            | references | null: false, foreign_key: true |
| itemcategory_id     | integer    | null: false                    |
| shipfrom_id     | integer    | null: false                    |
| price           | integer    | null: false                    |
| shop            | references | null: false, foreign_key: true |
| shopkeeper        | references | null: false, foreign_key: true |

belongs_to :shop
belongs_to :customer
has_one :purchase


# purchase テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| customer        | references | null: false, foreign_key: true |

belongs_to :item
belongs_to :customer

# customer テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickame         | string     | null: false                    |
| family_name     | string     | null: false                    |
| first_name      | string     | null: false                    |
| email           | string     | null: false                    |
| phone_num       | integer    | null: false                    |
| birthday        | integer    | null: false                    |
| password        | string     | null: false                    |

has_many :item
has_many :comments
has_one :address
has_one :card

# address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_num        | string     | null: false                    |
| building_name    | string     |                                |
| customer         | references | optional: true                 |
| shopkeeper       | references | optional: true                 |

belongs_to :customer
belongs_to :shopkeeper

# card テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_token       | string     | null: false                    |
| customer_token   | string     | null: false                    |
| customer         | references | null: false, foreign_key: true |

belongs_to :customer


