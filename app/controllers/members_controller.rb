#encoding: utf-8
class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  def new_member
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])
    @member.norm_rut

    respond_to do |format|
      if @member.save
        registration = Registration.where(:member_id => @member.id, :day => DateTime.now.end_of_week.at_midnight)
        if registration.count == 0
          Registration.create(:member_id => @member.id, :day => DateTime.now.end_of_week.at_midnight)
        end
        AdminMailer.thanks_volunteer(@member).deliver
        format.html { redirect_to thank_you_path(:notice => "¡Gracias! Registro exitoso") }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

   # POST /members
  # POST /members.json
  def create_member
    @member = Member.new(params[:member])
    puts "bla " + @member.name.to_s
    @member.norm_rut
    if @member.donor_amount != ""
      @member.frequent_donor = true
    end

    respond_to do |format|
      if @member.save
        format.html { redirect_to thank_you_path(:notice => "¡Gracias! Registro exitoso") }
      else
        format.html { render action: "new_member" }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])
    @member.norm_rut
    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

	def volunteer

	end

	def check
		m = Member.where(:email => params[:email]).first
		if m
      m.car = params[:car]
      m.save
      registration = Registration.where(:member_id => m.id, :day => DateTime.now.end_of_week.at_midnight).first
      if registration.nil?
  			Registration.create(:member_id => m.id, :day => DateTime.now.end_of_week.at_midnight)
        AdminMailer.thanks_volunteer(m).deliver
        redirect_to thank_you_path(:notice => "¡Gracias! Registro exitoso")
      else
        redirect_to thank_you_path(:notice => "Ya estabas inscrito para este operativo")
      end
      return
			
		else
			@member = Member.new
			@member.email = params[:email]
      @member.car = params[:car]
			render new_member_path
		end
	end

	def thank_you
		@notice = params[:notice]
	end
  
end
