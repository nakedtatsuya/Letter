class LettersController < ApplicationController
  before_action :set_letter, only: [:show]

  # GET /letters/1
  # GET /letters/1.json
  def show
    # send_data @image.tempfile.open.read, :type => 'image/png',:disposition => 'inline'
  end

  # GET /letters/new
  def new
    @letter = Letter.new
  end

  # POST /letters
  # POST /letters.json
  def create
    @letter = Letter.new(letter_params)
    OgpCreator.build(@letter.message)
    @image = OgpCreator.write2(@letter.from_name + 'より', @letter.to_name + 'へ')
    @letter.image = @image
    respond_to do |format|
      if @letter.save
        format.html { redirect_to @letter, notice: '手紙を作成しました' }
        format.json { render :show, status: :created, location: @letter }
      else
        format.html { render :new }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_params
      params.require(:letter).permit(:from_name, :message, :to_name, :image)
    end
end
