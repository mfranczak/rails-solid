class ClownsController < ApplicationController
  def index
    @clowns = Clown.all
  end

  def show
    begin
      @clown = Clown.find params[:id]
    rescue
      redirect_to clowns_path
    end
  end
end