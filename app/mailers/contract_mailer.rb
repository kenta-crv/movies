class ContractMailer < ActionMailer::Base
  default from: "movies@factoru.jp"
  def received_email(contract)
    @contract = contract
    mail to: "movies@factoru.jp"
    mail(subject: '【ケアリンク】約款へ同意いただきありがとうございました。') do |format|
      format.text
    end
  end

  def send_email(contract)
    @contract = contract
    mail to: contract.email
    mail(subject: '【ケアリンク】約款へ同意いただきありがとうございました。') do |format|
      format.text
    end
  end

end
