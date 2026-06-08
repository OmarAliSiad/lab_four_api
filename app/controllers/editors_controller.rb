class EditorsController < ApplicationController
  before_action :set_editor, only: %i[ show update destroy ]

  # GET /editors
  def index
    @editors = Editor.all

    render json: @editors
  end

  # GET /editors/1
  def show
    render json: @editor
  end

  # POST /editors
  def create
    @editor = Editor.new(editor_params)

    if @editor.save
      render json: @editor, status: :created, location: @editor
    else
      render json: @editor.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /editors/1
  def update
    if @editor.update(editor_params)
      render json: @editor
    else
      render json: @editor.errors, status: :unprocessable_content
    end
  end

  # DELETE /editors/1
  def destroy
    @editor.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editor
      @editor = Editor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def editor_params
      params.expect(editor: [ :name, :email ])
    end
end
