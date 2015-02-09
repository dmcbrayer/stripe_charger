class LeadersController < ApplicationController
  before_action :set_leader, only: [:show, :edit, :update, :destroy]

  def index
    @leaders = Leader.all
  end

  def show
  end

  def new
    @leader = Leader.new
  end

  def edit
  end

  def create
    @leader = Leader.new(leader_params)

    respond_to do |format|
      if @leader.save
        flash[:success] = "Leader was successfully created."
        format.html { redirect_to @leader}
        format.json { render :show, status: :created, location: @leader }
      else
        flash[:danger] = "Leader could not be created."
        format.html { render :new }
        format.json { render json: @leader.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @leader.update(leader_params)
        flash[:success] = "Leader was successfully updated."
        format.html { redirect_to @leader}
        format.json { render :show, status: :ok, location: @leader }
      else
        flash[:danger] = "Leader could not be updated."
        format.html { render :edit }
        format.json { render json: @leader.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @leader.destroy
    respond_to do |format|
      flash[:success] = "Leader was successfully destroyed."
      format.html { redirect_to leaders_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leader
      @leader = Leader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leader_params
      params.require(:leader).permit(:name, :email)
    end
end
