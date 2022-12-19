class DischargesController < ApplicationController
  def index
    # @animals = Animal.deleted.order(id: :desc)
    @animals = Animal.where(discharge: "1").order(id: :desc)
  end

  def search
    @q = Animal.ransack(params[:q])
    @animals = @q.result
  end

end
