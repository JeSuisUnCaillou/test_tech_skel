class SearchesController < ApplicationController
	before_filter :authenticate_user!
  before_action :set_search, only: [:show, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @searches = current_user.searches
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
		q_manager = QueryManager.new
		results = q_manager.natural_amazon_search(@search.sentence)
		@results = results.map do |result|
			url = result["DetailPageURL"]
			title = result["ItemAttributes"]["Title"]
			{url: url, title: title}
		end
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = current_user.searches.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :index, alert: 'Search was not created' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
			render_unauthorized if @search.user != current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:sentence)
    end
end
