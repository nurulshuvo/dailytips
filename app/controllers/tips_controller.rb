class TipsController < ApplicationController

  def index
    @tips = Tip.all

    respond_to do |format|
      format.html
      format.json { render json: @tips }
    end
  end

  def show
    @tip = Tip.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @tip }
    end
  end

  def new
    @tip = Tip.new

    respond_to do |format|
      format.html
      format.json { render json: @tip }
    end
  end

  def edit
    @tip = Tip.find(params[:id])
  end

  def create
    @tip = Tip.new(params[:tip])

    respond_to do |format|
      if @tip.save
        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
        format.json { render json: @tip, status: :created, location: @tip }
      else
        format.html { render action: "new" }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tip = Tip.find(params[:id])

    respond_to do |format|
      if @tip.update_attributes(params[:tip])
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tip = Tip.find(params[:id])
    @tip.destroy

    respond_to do |format|
      format.html { redirect_to tips_url }
      format.json { head :no_content }
    end
  end
end
