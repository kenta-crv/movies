class BranchsController < ApplicationController
    before_action :load_company
    before_action :load_branch, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @branch = Branch.new
    end
  
    def load_branch
      @branch = Branch.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @branch = @company.branchs.new(branch_params)
      if @branch.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @branch = @company.branchs.find(params[:id])
      @branch.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @branch = Branch.find(params[:company_id])
      @branch = @company.branchs.find(params[:id])
      if @branch.update(branch_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def branch_params
       params.require(:branch).permit(
        :name, #支店名
        :tel, #電話番号
        :address #住所
      )
     end
  
  end
  