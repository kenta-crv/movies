class DeathsController < ApplicationController
    before_action :load_company
    before_action :load_death, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @death = Death.new
    end
  
    def load_death
      @death = Death.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @death = @company.deaths.new(death_params)
      if @death.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @death = @company.deaths.find(params[:id])
      @death.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @death = Death.find(params[:company_id])
      @death = @company.deaths.find(params[:id])
      if @death.update(death_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def death_params
       params.require(:death).permit(
        :year,
        :body
      )
     end
  
  end
  