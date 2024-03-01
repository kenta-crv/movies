class SfaMailer < ActionMailer::Base
  default from: "info@c-are.link"
  def received_email(sfa)
    @sfa = sfa
    mail to: "info@c-are.link"
    mail(subject: '商談日時決定') do |format|
      format.text
    end
  end

  def send_email(sfa)
    @sfa = sfa
    mail to: sfa.email
    mail(subject: '商談日時とオンラインURLのご案内') do |format|
      format.text
    end
  end
end
