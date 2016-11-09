class LinksController < ApplicationController
  before_action :require_user

  def index
    @links = current_user.links
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:success] = 'New link has been added!'
      redirect_to links_path
    else
      flash[:error] = "Link is not valid. Please try adding again."
      redirect_to links_path
    end
  end

  def update
    link = Link.find[params[:id]]
    if params[:read]
      link.read = !link.read
      link.save
      redirect_to links_path
    else
      link.update(link_params)
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :id, :read)
    end
end
