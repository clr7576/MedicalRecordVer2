class DischargesController < ApplicationController
  def index
    @animals = Animal.all

  end

  def search
    @q = Animal.ransack(params[:q])
    @animals = @q.result
  end

end
