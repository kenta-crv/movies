class HistoriesController < ApplicationController
    before_action :load_company
    before_action :load_history, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @history = History.new
    end
  
    def load_history
      @history = History.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @history = @company.histories.new(history_params)
      if @history.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @history = @company.histories.find(params[:id])
      @history.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @history = History.find(params[:company_id])
      @history = @company.histories.find(params[:id])
      if @history.update(history_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def history_params
       params.require(:history).permit(
        :year,
        :body
      )
     end
  
  end
  