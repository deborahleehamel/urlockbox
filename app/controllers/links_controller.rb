class LinksController < ApplicationController
  def index
    if current_user
      @links = Link.where(user: current_user)
      @add_link = Link.new
    else
      render file: "public/404"
    end
  end

  def create
    link = Link.new(link_params)
    link.user = current_user
    if link.url
      link.save
      redirect_to links_path
    else
      flash[:error] = "Link is not valid. Please try adding again."
      redirect_to links_path
    end
  end

  def update
    link = Link.find(params[:id])
    if params[:read]
      link.read = !link.read
      link.save
      redirect_to links_path
    elsif link_params[:url]
      link.update(link_params)
      redirect_to links_path
    else
      flash[:error] = "Your link is invalid. Please try again."
      redirect_to edit_link_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  private
    def link_params
      params.require(:link).permit(:url, :title, :user, :read)
    end

end
