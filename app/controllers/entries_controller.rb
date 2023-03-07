class EntriesController < ApplicationController
    before_action :authenticate_admin!, except: [:index, :show]
      def index
        @entries = Entry.all
      end
    
      def show
        @entry = Entry.find(params[:id])
      end
    
      def new
        @entry = Entry.new
      end
    
      def create
        @entry = Entry.new(entry_params)
        if @entry.save
          redirect_to entries_path
        else
          render 'new'
        end
      end
    
      def edit
        @entry = Entry.find(params[:id])
        render :layout => "froala"
      end
    
      def destroy
        @entry = Entry.find(params[:id])
        @entry.destroy
         redirect_to entries_path
      end
    
      def update
        @entry = Entry.find(params[:id])
        if @entry.update(entry_params)
          redirect_to entries_path
        else
          render 'edit'
        end
      end
    
      private
      def entry_params
        params.require(:entry).permit(
            :occupation,
            :name,
            :tel,
            :email,
            :age,
            :experience,
            :number_of_years,
            :work_content,
            :acquired_language,
            :annual_income,
            :desired_salary,
            :desired_employment,
            :desired_work_location,
            :desired_period
          )
      end
    end
    