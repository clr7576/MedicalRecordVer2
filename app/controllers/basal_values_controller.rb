class BasalValuesController < ApplicationController
    def create
        @animal = Animal.find(params[:animal_id])

        @basal_value = @animal.basal_values.new(basal_value_params)
        if @basal_value.save
          LineService.new.notify("#{@animal.name} HR #{@basal_value.HR} BP #{@basal_value.BP} RR #{@basal_value.RR}")
          
        # system %Q(curl -X POST -H 'Authorization: Bearer eLMJ7UuSgVL3xsiEtYTfFbnjRQd1sfekgcKeUfMgGAh' -F 'message="#{@animal.name} HR #{@basal_value.HR} BP #{@basal_value.BP} RR #{@basal_value.RR}"' https://notify-api.line.me/api/notify)

          # redirect_to animal_path(@animal.id), notice: "新增成功"
        else
          redirect_to animal_path(@animal.id), notice: "請填寫時間"
        end
    end

    def edit
      # @animal = Animal.find(params[:animal_id])
      @basal_value = BasalValue.find(params[:id])
    end

    def update
      @basal_value = BasalValue.find(params[:id])
      
      if @basal_value.update(basal_value_params)
        @animal = @basal_value.animal
        redirect_to animal_path(@animal)
      else
        render :edit
      end
    end

    def destroy
      @basal_value = BasalValue.find(params[:id])
       @basal_value.destroy  
    end

    def bloodpressure
       @animal = Animal.find(params[:id])
       @basal_values = @animal.basal_values.order(id: :desc)
    end

    def respiratory
      @animal = Animal.find(params[:id])
      @basal_values = @animal.basal_values.order(id: :desc)
    end

    def summary
      begin 
        @animal = Animal.find(params[:id])
      # rescue ActiveRecord::RecordNotFound
      #   @animal = Animal.deleted.find(params[:id])
        @basal_values = @animal.basal_values.order(id: :desc)
        
      end
        
      @basal_values = @animal.basal_values.order(id: :desc)
    end


    private
    def basal_value_params
      clean_params = params.require(:basal_value).permit(:HR, :RR, :BT, :BP, :time, :description)
    end
end




