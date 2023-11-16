class ProgressesController < ApplicationController
    before_action :load_contract
    before_action :load_progress, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!

    def load_contract
      @contract = Contract.find(params[:contract_id])
      @progress = Progress.new
    end

    def load_progress
      @progress = Progress.find(params[:id])
    end

    def edit
    end

    def create
      @progress = @contract.progresses.new(progress_params)
      if @progress.save
  			redirect_to contract_path(@contract)
  		end
    end

  	def destroy
  		@contract = Contract.find(params[:contract_id])
  		@progress = @contract.progresses.find(params[:id])
  		@progress.destroy
  		redirect_to contract_path(@contract)
  	end

  	 def update
      @progress = Progress.find(params[:contract_id])
      @progress = @contract.progresses.find(params[:id])
      if @progress.update(progress_params)
         redirect_to contract_path(@contract)
      else
          render 'edit'
      end
    end

    private
   	def progress_params
   		params.require(:progress).permit(
       :status,
       :next,
       :body,
      )
   	end

end
