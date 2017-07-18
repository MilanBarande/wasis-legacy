class VisitsController < ApplicationController

  def create
    @visit = Visit.new
    @visit.user = current_user
    @visit.workplace = Workplace.find(params[:workplace_id])
    @visit.checkin = true
    if @visit.save
      redirect_to workplace_path(params[:workplace_id])
    else
      render :new
    end
  end

  def update
    @visit = Visit.find(params[:id])
    @visit.checkin = false
    if @visit.save

      redirect_to new_workplace_review_path#workplace_path(params[:workplace_id])
    else
      render :new
    end
  end

end
