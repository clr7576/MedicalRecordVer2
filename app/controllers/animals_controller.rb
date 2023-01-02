class AnimalsController < ApplicationController

       def index
        # @animals = Animal.all
        @animals = Animal.where(discharge: "hospitalization")
       end
   
       def new
        @animal= Animal.new
       end
   
       def create
         @animal = Animal.new(animal_params)
         
         if @animal.save
           redirect_to root_path,notice: "新增成功"
         else
           render :new
         end
       end
   
       def show
         @animal = Animal.find(params[:id])
         @basal_value = BasalValue.new
         @basal_values = @animal.basal_values.order(id: :desc)
       end
   
       def edit
         @animal = Animal.find(params[:id])
       end
   
       def update
         @animal = Animal.find(params[:id])
          if @animal.update(animal_params)
             redirect_to root_path,notice: "修改成功"
          else
             render :edit
          end
       end
   
       def destroy
         @animal = Animal.find(params[:id])
           @animal.destroy
           #  redirect_to animal_path,notice: "成功刪除"     
       end

       def archive
        @animal = Animal.find(params[:animal_id])
       end

       def archive_update
        @animal = Animal.find(params[:animal_id])
        if @animal.update(animal_params)
           redirect_to root_path,notice: "已歸檔"
        else
        end
       end
   
       private
       def animal_params
         clean_params = params.require(:animal).permit(:name, :species, :number, :discharge)
       end
   end
   


