class ContractsController < ApplicationController
    before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy, :send_mail]
  
    def index
      @contracts = Contract.order(created_at: "DESC").page(params[:page])
    end
  
    def new
      @contract = Contract.new
    end
  
    def confirm
      @contract = Contract.new(contract_params)
    end
  
    def thanks
      @contract = Contract.new(contract_params)
      @contract.save
      ContractMailer.received_email(@contract).deliver # 管理者に通知
      ContractMailer.send_email(@contract).deliver # 送信者に通知
    end
  
    def create
      @contract = Contract.new(contract_params)
      @contract.save
      redirect_to thanks_contracts_path
    end
  
    def show
      @contract = Contract.find_by(params[:id])
      #send_file @contract.pdf.path, type: 'application/pdf', disposition: 'inline'
      @progress = Progress.new
    end
  
    def edit
      @contract = Contract.find(params[:id])
    end
  
    def destroy
      @contract = Contract.find(params[:id])
      @contract.destroy
      redirect_to contracts_path, alert:"削除しました"
    end
  
    def update
      @contract = Contract.find(params[:id])
      if @contract.update(contract_params)
        redirect_to contracts_path(@contract), alert: "更新しました"
      else
        render 'edit'
      end
    end
  
    private
    def contract_params
      params.require(:contract).permit(
        :agree, #同意
        :co, #会社名
        :president_first,  #代表者姓
        :president_last,  #代表者名
        :tel, #電話番号
        :address, #ご住所住所
        :email, #メールアドレス
        :url, #会社HP
        :recruit_url, #採用ページ
        :recruit_url_2, #採用ページ
        :work, #採用予定職種
        :plan, #ご利用プラン選択
        :number, #採用予定人数
        :period, #希望採用予定
        :remarks, #その他要望
        :person_first,  #採用担当姓
        :person_last,  #採用担当名
        :person_tel, #採用担当携帯番号
      )
    end
end
