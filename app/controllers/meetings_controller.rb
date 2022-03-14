class MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting, only: %i[show edit update destroy]

  # GET /meetings or /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1 or /meetings/1.json
  def show; end

  # GET /meetings/newsex
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit; end

  # POST /meetings or /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user_id = current_user.id

    respond_to do |format|
      if @meeting.save
        format.html do
          redirect_to meeting_url(@meeting),
                      notice: 'Agendamento criado com sucesso!'
        end
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @meeting.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /meetings/1 or /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html do
          redirect_to meeting_url(@meeting),
                      notice: 'Agendamento atualizado com sucesso!'
        end
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @meeting.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /meetings/1 or /meetings/1.json
  def destroy
    @meeting.destroy

    respond_to do |format|
      format.html do
        redirect_to meetings_url, notice: 'Agendamento deletado com sucesso!'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :user_id)
  end
end
