class VisitsController < ApplicationController

  def create

    @visit = Visit.new
    @workplace = Workplace.find(params[:workplace_id])
    @visit.user = current_user
    @visit.workplace = @workplace
    @visit.checkin = true
    @visits = @workplace.visits.where(checkin: true)

    if @visit.save
      @checkedin_visit = true
      respond_to do |format|
        format.html { redirect_to workplace_path(params[:workplace_id]) }
        format.js  # <-- will render `app/views/visits/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'workplace/show' }
        format.js  # <-- idem
      end
    end
  end

  def update

    @visit = Visit.find(params[:id])
    @workplace = Workplace.find(params[:workplace_id])
    @visit.checkin = false
    @visits = @workplace.visits.where(checkin: true)

    if @visit.save
      @checkedin_visit = false
      respond_to do |format|
        format.html { redirect_to workplace_path(params[:workplace_id])}
        format.js  # <-- will render `app/views/visits/update.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'workplace/show' }
        format.js  # <-- idem
      end
    end
   end

end
