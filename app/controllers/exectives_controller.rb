class ExectivesController < ApplicationController
    before_action :load_company
    before_action :load_exective, only: [:edit,:update,:show,:destroy]
  
    def load_company
      @company = Company.find(params[:company_id])
      @exective = Exective.new
    end
  
    def load_exective
      @exective = Exective.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @exective = @company.exectives.new(exective_params)
      if @exective.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @exective = @company.exectives.find(params[:id])
      @exective.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @exective = Exective.find(params[:company_id])
      @exective = @company.exectives.find(params[:id])
      if @exective.update(exective_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def exective_params
       params.require(:exective).permit(
        :position,
        :name
      )
     end
  
  end
  