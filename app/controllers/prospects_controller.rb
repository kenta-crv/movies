class ProspectsController < ApplicationController
    before_action :load_company
    before_action :load_prospect, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @prospect = Prospect.new
    end
  
    def load_prospect
      @prospect = Prospect.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @prospect = @company.prospects.new(prospect_params)
      if @prospect.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @prospect = @company.prospects.find(params[:id])
      @prospect.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @prospect = Prospect.find(params[:company_id])
      @prospect = @company.prospects.find(params[:id])
      if @prospect.update(prospect_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def prospect_params
       params.require(:prospect).permit(
        :body
      )
     end
  
  end
  