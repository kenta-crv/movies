class BusinessesController < ApplicationController
    before_action :load_company
    before_action :load_business, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @business = Business.new
    end
  
    def load_business
      @business = Business.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @business = @company.businesses.new(business_params)
      if @business.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @business = @company.businesses.find(params[:id])
      @business.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @business = Business.find(params[:company_id])
      @business = @company.businesses.find(params[:id])
      if @business.update(business_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def business_params
       params.require(:business).permit(
        :title,
        :body
      )
     end
  
  end
  