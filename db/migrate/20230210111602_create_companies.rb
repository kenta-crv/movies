class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :co #会社名
      t.string :rogo #ロゴ
      t.string :tel #電話番号
      t.string :mail #メールアドレス
      t.string :postnumber #郵便番号
      t.string :address #住所
      t.string :url #URL
      t.date :foundation #設立日
      t.string :caption #資本金
      t.string :people #従業員数
      t.string :industry #業種
      t.string :business #事業内容
      #t.string :market #上場可否
      t.string :concept #コンセプト
      #給与は1:n/最新給与からランキング化
      t.timestamps
    end
  end
end
