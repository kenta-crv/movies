class Estimate < ApplicationRecord
    belongs_to :company, optional: true
  
    validates :co, {presence: true}
    validates :name, {presence: true}  #名前
    validates :tel, {presence: true} #電話番号
    validates :address, {presence: true} #住所
    validates :email, {presence: true} #メールアドレス
  end
  