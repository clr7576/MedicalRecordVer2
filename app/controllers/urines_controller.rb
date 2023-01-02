class UrinesController < ApplicationController
    def new
      @urine = Urine.new
      @animal = Animal.find(params[:animal_id])
      @urines = @animal.urines.order(id: :desc)
    end

    def create
      @animal = Animal.find(params[:animal_id])
      @urine = @animal.urines.new(urine_params)
      if @urine.save
        
      else
      end
    end

    private
    def urine_params
      clean_params = params.require(:urine).permit(:time, :volume,:description)
    end
end
