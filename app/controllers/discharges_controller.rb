class DischargesController < ApplicationController
  def index
    # @animals = Animal.deleted.order(id: :desc)
    @animals = Animal.where(discharge: "1").order(id: :desc)
  end

  def search
    @q = Animal.ransack(params[:q])
    @animals = @q.result
    # @animal = Animal.all
    # @animals = @animal.basal_values.includes(:name).order("id DESC")

    # if params[:start_on].present?
    # @animals = Animal.where( "created_at >= ?", Date.parse(params[:start_on]).beginning_of_day )
    # end
    
    # if params[:end_on].present?
    #   @animals = Animal.where( "created_at <= ?", Date.parse(params[:end_on]).end_of_day )
    #  end
      

  end
end