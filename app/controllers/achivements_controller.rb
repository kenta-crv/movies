class AchivementsController < ApplicationController
    before_action :load_company
    before_action :load_achivement, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @achivement = Achivement.new
    end
  
    def load_achivement
      @achivement = Achivement.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @achivement = @company.achivements.new(achivement_params)
      if @achivement.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @achivement = @company.achivements.find(params[:id])
      @achivement.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @achivement = Achivement.find(params[:company_id])
      @achivement = @company.achivements.find(params[:id])
      if @achivement.update(achivement_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def achivement_params
       params.require(:achivement).permit(
        :year,
        :body
      )
     end
  
  end
  