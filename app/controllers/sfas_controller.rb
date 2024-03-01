class SfasController < ApplicationController
    before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy, :send_mail]
  
    def index
      @sfas = Sfa.order(created_at: "DESC").page(params[:page])
    end
  
    def new
      @sfa = Sfa.new
    end
  
    def confirm
      @sfa = Sfa.new(sfa_params)
    end
  
    def thanks
      @sfa = Sfa.new(sfa_params)
      @sfa.save
      SfaMailer.received_email(@sfa).deliver # 管理者に通知
      SfaMailer.send_email(@sfa).deliver # 先方に通知
    end
  
    def create
      @sfa = Sfa.new(sfa_params)
      @sfa.save
      redirect_to thanks_sfas_path
    end
  
    def show
      @sfa = Sfa.find(params[:id])
      @progress = Progress.new
    end
  
    def edit
      @sfa = Sfa.find(params[:id])
    end
  
    def destroy
      @sfa = Sfa.find(params[:id])
      @sfa.destroy
      redirect_to sfas_path, alert:"削除しました"
    end
  
    def update
      @sfa = Sfa.find(params[:id])
      if @sfa.update(sfa_params)
        redirect_to sfas_path(@sfa), alert: "更新しました"
      else
        render 'edit'
      end
    end
  
    private
    def sfa_params
      params.require(:sfa).permit(
        :co, #会社名
        :name,  #担当者
        :tel, #電話番号
        :address, #ご住所住所
        :email, #メールアドレス
        :url, #会社HP
        :recruit_url, #採用ページ
        :business, #業種
        :first_question, #質問1
        :second_question, #質問2
        :third_question,  #質問3
        :remarks, #備考
        :meeting_day,  #商談日時
      )
    end
end
