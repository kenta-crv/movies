class EstimateMailer < ActionMailer::Base
  default from: "info@c-are.link"
  def received_email(estimate)
    @estimate = estimate
    mail to: "info@sale-s.pro"
    mail(subject: '転職の『ケアリンク』にお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def send_email(estimate)
    @estimate = estimate
    mail to: estimate.email
    mail(subject: '転職の『ケアリンク』にお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

end
