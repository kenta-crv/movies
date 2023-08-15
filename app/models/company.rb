class Company < ApplicationRecord
    mount_uploader :rogo, ImagesUploader
    has_many :introductions #概要
    has_many :branches #支店
    has_many :histories #沿革
    has_many :presidents #代表歴
    has_many :businesses #事業内容
    has_many :executives #役員一覧
    has_many :cultures #社風
    has_many :recruits #求人
    has_many :awards #表彰
    has_many :achivements #実績
    has_many :reviews #レビュー
    has_many :deaths #ブラック
    has_many :pressreleases #プレスリリース
    has_many :prospects #未来図
    has_many :totals #まとめ

    #company_import
    def self.import(file)
      save_cont = 0
      CSV.foreach(file.path, headers:true) do |row|
       company = find_by(id: row["id"]) || new
       company.attributes = row.to_hash.slice(*updatable_attributes)
       next if self.where(co: company.co).count > 0
       company.save!
       save_cont += 1
      end
      save_cont
    end

    def self.import(file)
      save_count = 0
      CSV.foreach(file.path, headers:true) do |row|
        # coが重複している場合はスキップ
        next if exists?(co: row["co"])
        company = find_by(id: row["id"]) || new
        company.attributes = row.to_hash.slice(*updatable_attributes)
        company.save!
        save_count += 1
      end
      save_count
    end

    #update_import
    def self.update_import(update_file)
      save_cnt = 0
      CSV.foreach(update_file.path, headers: true) do |row|
        company = find_by(id: row["id"]) || new
        company.attributes = row.to_hash.slice(*updatable_attributes)
        next if company.co == nil
        company.save!
        save_cnt += 1
      end
      save_cnt
    end

    #company_export
  def self.generate_csv
    CSV.generate(headers:true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{|attr| task.send(attr)}
      end
    end
  end
  def self.csv_attributes
    [
    "co", #会社名
    "concept", #コンセプト
    "rogo", #ロゴ
    "tel", #電話番号
    "postnumber", #郵便番号
    "address", #住所
    "mail", #メールアドレス
    "url", #URL
    "caption", #資本金
    "people", #従業員数
    "foundation", #設立日
    "industry", #業種
    "business", #事業内容
    "settlement", #決算日
    "sales",
    "contact"
  ]
  end

      # 更新を許可するカラムを定義
    def self.updatable_attributes
      [
        "co", #会社名
        "concept", #コンセプト
        "rogo", #ロゴ
        "tel", #電話番号
        "postnumber", #郵便番号
        "address", #住所
        "mail", #メールアドレス
        "url", #URL
        "caption", #資本金
        "people", #従業員数
        "foundation", #設立日
        "industry", #業種
        "business", #事業内容
        "settlement", #決算日
        "sales",
        "contact"
      ]    
    end

end
