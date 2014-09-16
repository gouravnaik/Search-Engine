class GeneratorsController < ApplicationController
	load_and_authorize_resource :except => [:search]

	def search

		@user=current_user.id
		start_date=params[:start]
		if params[:end]
		end_date=params[:end].to_date + 1
	    end
	    "start_date between ? and ?"
		@result=Report.where('user_id = ? AND created_at between ? and ?', @user, start_date, end_date )	
	end

	def employees
	   @employees = User.where(:role_id => 2)
	end

	def employee_reports
		@user=params[:format]
		@result = Report.where(:user_id=>@user)
	end

    end
