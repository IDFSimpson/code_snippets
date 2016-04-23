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
    @snippet = Snippet.find params[:id]
  end

  def update
    @snippet = Snippet.find params[:id]
    snippet_params = params.require(:snippet).permit(:title, :work)
    if @snippet.update snippet_params
      redirect_to @snippet, notice: "Snippet Updated"
    else
      flash[:alert] = "Snippet was not updated..."
      render :edit
    end
  end

  def destroy
    @snippet = Snippet.find params[:id]
    @snippet.destroy
    redirect_to snippets_path, notice: "Snippet Deleted Successfully"    
  end

end
