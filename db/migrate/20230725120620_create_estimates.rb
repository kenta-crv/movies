class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.string :co #会社名
      t.string :name  #名前
      t.string :tel #電話番号
      t.string :email #メールアドレス
      t.string :address #住所
      t.string :url #会社HP
      t.string :contents #発注内容
      t.string :budget #予算
      t.string :important #重視
      t.string :language #希望言語
      t.string :order #発注予定時期
      t.string :period #納品希望期限
      t.string :remarks #開発について
      t.timestamps
    end
  end
end
