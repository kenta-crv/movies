class ProgressesController < ApplicationController
    before_action :load_sfa
    before_action :load_progress, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!

    def load_sfa
      @sfa = Sfa.find(params[:sfa_id])
      @progress = Progress.new
    end

    def load_progress
      @progress = Progress.find(params[:id])
    end

    def edit
    end

    def create
      @progress = @sfa.progresses.new(progress_params)
      if @progress.save
        redirect_to sfa_path(@sfa)
      else
        logger.debug @progress.errors.full_messages
        # 適切なエラー処理（例: フォームを再表示するなど）
      end
    end

  	def destroy
  		@sfa = Sfa.find(params[:sfa_id])
  		@progress = @sfa.progresses.find(params[:id])
  		@progress.destroy
  		redirect_to sfa_path(@sfa)
  	end

  	 def update
      @progress = Progress.find(params[:sfa_id])
      @progress = @sfa.progresses.find(params[:id])
      if @progress.update(progress_params)
         redirect_to sfa_path(@sfa)
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
