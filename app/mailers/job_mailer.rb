class JobMailer < ActionMailer::Base
  default from: "movies@factoru.jp"
  def received_email(job)
    @job = job
    mail to: "movies@factoru.jp"
    mail(subject: '介護転職の『ケアリンク』にお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def send_email(job)
    @job = job
    mail to: job.email
    mail(subject: '介護転職の『ケアリンク』にお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

end
