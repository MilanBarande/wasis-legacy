class StatusController < ApplicationController

  def create

    @status = Status.new
    current_user.status = @status
    if current_user.save
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

    @status = Status.find(params[:id])
    current_user.status = @status
    if current_user.save
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
