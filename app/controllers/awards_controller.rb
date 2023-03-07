class AwardsController < ApplicationController
    before_action :load_company
    before_action :load_award, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @award = Award.new
    end
  
    def load_award
      @award = Award.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @award = @company.awards.new(award_params)
      if @award.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @award = @company.awards.find(params[:id])
      @award.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @award = Award.find(params[:company_id])
      @award = @company.awards.find(params[:id])
      if @award.update(award_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def award_params
       params.require(:award).permit(
        :year,
        :body
      )
     end
  
  end
  