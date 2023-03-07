class CompaniesController < ApplicationController
    before_action :authenticate_admin!, except: [:index, :show]
      def index
        @companies = Company.all
      end
    
      def show
        @company = Company.find(params[:id])
      end
    
      def new
        @company = Company.new
      end
    
      def create
        @company = Company.new(company_params)
        if @company.save
          redirect_to companies_path
        else
          render 'new'
        end
      end
    
      def edit
        @company = Company.find(params[:id])
        @award = Award.new
        @branch = Branch.new
        @business = Business.new
        @achivement = Achivement.new
        @history = History.new
        @introduction = Introduction.new
        @president = President.new
        @pressrelease = Pressrelease.new
        @prospect = Prospect.new
        @recruit = Recruit.new
        @total = Total.new
        render :layout => "froala"
      end
    
      def destroy
        @company = Company.find(params[:id])
        @company.destroy
         redirect_to companies_path
      end
    
      def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
          redirect_to companies_path
        else
          render 'edit'
        end
      end
    
      private
      def company_params
        params.require(:company).permit(
          :co, #会社名
          :concept, #コンセプト
          :rogo, #ロゴ
          :tel, #電話番号
          :postnumber, #郵便番号
          :address, #住所
          :mail, #メールアドレス
          :url, #URL
          :caption, #資本金
          :people, #従業員数
          :foundation, #設立日
          :industry, #業種
          :business, #事業内容
          :market, #上場可否
          )
      end
    end
    