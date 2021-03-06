class SnippetsController < ApplicationController
  before_action :find_snippet, only: [:show,:edit,:update,:destroy]

  def index
    @snippets = Snippet.all
  end

  def show
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new snippet_params
    if @snippet.save
      redirect_to @snippet, notice: "Snippet Added"
    else
      flash.now[:alert] = "Snippet was not saved..."
      render :new
    end

  end

  def edit
  end

  def update
    if @snippet.update snippet_params
      redirect_to @snippet, notice: "Snippet Updated"
    else
      flash.now[:alert] = "Snippet was not updated..."
      render :edit
    end
  end

  def destroy
    @snippet.destroy
    redirect_to snippets_path, notice: "Snippet Deleted Successfully"
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :work, :kind_id)
  end

  def find_snippet
    @snippet = Snippet.find params[:id]
  end

end
