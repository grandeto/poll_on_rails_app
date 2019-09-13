class AdminController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_helper
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  # GET /admin
  # GET /admin.json
  def index
    @polls = Poll.all
  end

  # GET /admin/1
  # GET /admin/1.json
  def show
  end

  # GET /admin/new
  def new
    @poll = Poll.new
    2.times { @poll.poll_options.build }
  end

  # GET /admin/1/edit
  def edit
  end

  # POST /admin
  # POST /admin.json
  def create
    @poll = Poll.new(poll_params)
    respond_to do |format|
      if @poll.save
        format.html { redirect_to admin_path(@poll), notice: 'Poll was successfully created.' }
        format.json { render :show, status: :created, location: admin_path(@poll) }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/1
  # PATCH/PUT /admin/1.json
  def update
    respond_to do |format|
      # {:name => poll_params[:name]}
      if @poll.update(poll_params)
        format.html { redirect_to admin_path(@poll), notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_path(@poll) }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/1
  # DELETE /admin/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_path, notice: 'Poll was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.includes(:poll_options).where(id: params[:id]).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:name, poll_options_attributes: [:id, :option, :priority])
    end
end
