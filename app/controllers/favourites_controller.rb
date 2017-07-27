class FavouritesController < ApplicationController
  def create

    @favourite = Favourite.new
    @workplace = Workplace.find(params[:workplace_id])
    @favourite.workplace = @workplace
    @favourite.user = current_user

    if @favourite.save
      respond_to do |format|
        format.html { redirect_to workplace_path(params[:workplace_id]) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'workplace/show' }
        format.js
      end
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @workplace = Workplace.where(id: @favourite.workplace_id).first
    if @favourite.destroy
      @favourite = Favourite.new
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
