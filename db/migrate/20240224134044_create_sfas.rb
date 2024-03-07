class CreateSfas < ActiveRecord::Migration[5.2]
  def change
    create_table :sfas do |t|
      t.string :co #会社名
      t.string :name  #担当者
      t.string :tel #電話番号
      t.string :address #ご住所住所
      t.string :email #メールアドレス
      t.string :url #会社HP
      t.string :recruit_url #採用ページ
      t.string :business #業種
      t.string :first_question #質問1
      t.string :second_question #その他要望
      t.string :third_question  #採用担当姓
      t.string :remarks #備考
      t.datetime :meeting_day  #商談日時
      t.timestamps
    end
  end
end
