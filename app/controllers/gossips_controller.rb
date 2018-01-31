class GossipsController < ApplicationController

  def create
	@gossip = Gossip.new(gossip_params)
	@gossip.save
	redirect_to @gossip
  end

  def show
	@gossip = Gossip.find(params[:id])
  end

  def edit
  	@gossip = Gossip.find(params[:id])
  end

  def update
  	@gossip = Gossip.find(params[:id])
  	if @gossip.update(gossip_params)
  		redirect_to @gossip
  	else render 'edit'
  	end
  end

  def destroy
  	@gossip = Gossip.find(params[:id])
  	@gossip.delete
  	redirect_to gossips_index_path
  end

  def index
	@gossips = Gossip.all
  end

  private

  	def gossip_params
   		params.permit(:anonymous_author, :content)
  	end
end
