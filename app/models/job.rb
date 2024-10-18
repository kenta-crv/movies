class Job < ApplicationRecord
    validates :tel, presence: true, format: { with: /\A0\d+/, message: 'は0から始めてください' }
  end
  