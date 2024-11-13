class EstimateMailer < ActionMailer::Base
  default from: "movies@factoru.jp"
  def received_email(estimate)
    @estimate = estimate
    mail to: "movies@factoru.jp"
    mail(subject: '映像制作・編集一括見積サイト『ムービーズ』にお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def send_email(estimate)
    @estimate = estimate
    mail to: estimate.email
    mail(subject: '映像制作・編集一括見積サイト『ムービーズ』にお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

end
