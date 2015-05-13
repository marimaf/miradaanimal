class RafflesController < ApplicationController
  # GET /raffles
  # GET /raffles.json
  def index
    @raffles = Raffle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raffles }
    end
  end

  # GET /raffles/1
  # GET /raffles/1.json
  def show
    @raffle = Raffle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raffle }
    end
  end

  # GET /raffles/new
  # GET /raffles/new.json
  def new
    @raffles = Hash[ Raffle.where(:event_number => 1).map{|c| [c.number, true] }]
    @raffle = Raffle.new
    @limit = 100
    @dogs = Dog.limit(@limit)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raffle }
    end
  end



  # POST /raffles
  # POST /raffles.json
  def create
    event_number = 1
    numbers = params[:raffle][:number]
    if !numbers.nil? && numbers.count != 0
      numbers.each_with_index do |number, index|
        if !Raffle.where(:number => number, :event_number => event_number).empty?
          @raffles = Hash[ Raffle.where(:event_number => event_number).map{|c| [c.number, true] }]
          @raffle = Raffle.new(params[:raffle])
          @raffle.number = nil 
          @limit = 100
          @dogs = Dog.limit(@limit)
          @notice = "NO SE PUDO REALIZAR LA COMPRA, ALGUIEN YA COMPRO UNO DE LOS NUMEROS QUE ESCOGISTE, SELECCIONA TUS NUMEROS NUEVAMENTE"
          render action: "new"
          return
        end
      end
      numbers.each_with_index do |number, index|
      #if index.odd?
        
          @raffle = Raffle.new(params[:raffle])
          @raffle.event_number = event_number
          @raffle.number = number[0].to_i
          @raffle.save
        
         
        
      #end
      end

      AdminMailer.thanks_raffle(@raffle.email).deliver
      redirect_to @raffle, notice: 'Raffle was successfully created.'
    else
      @raffles = Hash[ Raffle.where(:event_number => event_number).map{|c| [c.number, true] }]
    @raffle = Raffle.new
    @limit = 100
    @dogs = Dog.limit(@limit)
     render action: "new" 
    end
    

    
     
  end

  # PUT /raffles/1
  # PUT /raffles/1.json
  def update
    @raffle = Raffle.find(params[:id])

    respond_to do |format|
      if @raffle.update_attributes(params[:raffle])
        format.html { redirect_to @raffle, notice: 'Raffle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raffles/1
  # DELETE /raffles/1.json
  def destroy
    @raffle = Raffle.find(params[:id])
    @raffle.destroy

    respond_to do |format|
      format.html { redirect_to raffles_url }
      format.json { head :no_content }
    end
  end
end
