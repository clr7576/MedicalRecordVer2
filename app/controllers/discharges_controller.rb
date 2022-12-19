class DischargesController < ApplicationController
  def index
    @animals = Animal.all
  end

end
