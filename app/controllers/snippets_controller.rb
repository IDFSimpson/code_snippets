class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find params[:id]
  end

  def new
    @snippet = Snippet.new
  end

  def create
    snippet_params = params.require(:snippet).permit(:title, :work)
    @snippet = Snippet.new snippet_params
    if @snippet.save
      redirect_to @snippet, notice: "Snippet Added"
    else
      flash[:alert] = "Snippet was not saved..."
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

end
