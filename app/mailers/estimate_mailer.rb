class EstimateMailer < ActionMailer::Base
  default from: "info@engist.jp"
  def received_email(estimate)
    @estimate = estimate
    mail to: "info@engist.jp"
    mail(subject: 'ENGISTにお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def send_email(estimate)
    @estimate = estimate
    mail to: estimate.email
    mail(subject: 'ENGISTにお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def client_email(estimate)
    @estimate = estimate
    mail bcc: Company.all.map{|company| company.mail}
    mail(subject: 'ENGIST') do |format|
      format.text
    end
  end

end
