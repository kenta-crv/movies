class TotalsController < ApplicationController
    before_action :load_company
    before_action :load_total, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @total = Total.new
    end
  
    def load_total
      @total = Total.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @total = @company.totals.new(total_params)
      if @total.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @total = @company.totals.find(params[:id])
      @total.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @total = Total.find(params[:company_id])
      @total = @company.totals.find(params[:id])
      if @total.update(total_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def total_params
       params.require(:total).permit(
        :body
      )
     end
  
  end
  