class CulturesController < ApplicationController
    before_action :load_company
    before_action :load_culture, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @culture = Culture.new
    end
  
    def load_culture
      @culture = Culture.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @culture = @company.cultures.new(culture_params)
      if @culture.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @culture = @company.cultures.find(params[:id])
      @culture.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @culture = Culture.find(params[:company_id])
      @culture = @company.cultures.find(params[:id])
      if @culture.update(culture_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def culture_params
       params.require(:culture).permit(
        :body
      )
     end
  
  end
  