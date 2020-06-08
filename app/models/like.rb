class Like < ApplicationRecord
  # ポリモーフィック関連づけ
  belongs_to :likeable, polymorphic: true
end
