class ContractMailer < ActionMailer::Base
  default from: "info@sale-s.pro"
  def received_email(contract)
    @contract = contract
    mail to: "info@sale-s.pro"
    mail(subject: 'セールスプロ約款へ同意いただきありがとうございました。') do |format|
      format.text
    end
  end

  def send_email(contract)
    @contract = contract
    mail to: contract.email
    mail(subject: 'セールスプロ約款へ同意いただきありがとうございました。') do |format|
      format.text
    end
  end

  def client_email(contract)
    @contract = contract
    mail bcc: Company.all.map{|company| company.mail}
    mail(subject: 'セールスプロ') do |format|
      format.text
    end
  end

end
