class ExecutivesController < ApplicationController
    before_action :load_company
    before_action :load_executive, only: [:edit,:update,:show,:destroy]
  
    def load_company
      @company = Company.find(params[:company_id])
      @executive = Executive.new
    end
  
    def load_executive
      @executive = Executive.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @executive = @company.executives.new(executive_params)
      if @executive.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @executive = @company.executives.find(params[:id])
      @executive.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @executive = Executive.find(params[:company_id])
      @executive = @company.executives.find(params[:id])
      if @executive.update(executive_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def executive_params
       params.require(:executive).permit(
        :position,
        :name
      )
     end
  
  end
  