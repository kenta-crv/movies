class Company < ApplicationRecord
    mount_uploader :rogo, ImagesUploader
    has_many :introductions #概要
    has_many :branchs #支店
    has_many :histories #沿革
    has_many :presidents #代表歴
    has_many :businesses #事業内容
    has_many :cultures #社風
    has_many :recruits #求人
    has_many :awards #表彰
    has_many :achivements #実績
    has_many :reviews #レビュー
    has_many :deaths #ブラック
    has_many :pressreleases #プレスリリース
    has_many :prospects #未来図
    has_many :totals #まとめ
end
