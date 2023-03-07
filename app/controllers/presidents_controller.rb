class PresidentsController < ApplicationController
    before_action :load_company
    before_action :load_president, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @president = President.new
    end
  
    def load_president
      @president = President.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @president = @company.presidents.new(president_params)
      if @president.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @president = @company.presidents.find(params[:id])
      @president.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @president = President.find(params[:company_id])
      @president = @company.presidents.find(params[:id])
      if @president.update(president_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def president_params
       params.require(:president).permit(
        :body
      )
     end
  
  end
  