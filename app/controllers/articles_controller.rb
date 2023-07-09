class ArticlesController < ApplicationController
  def show
    # Initialize session[:page_views] to 0 if it is not already set
    session[:page_views] ||= 0

    # Increment page views by 1
    session[:page_views] += 1

    # Check if the user has viewed fewer than 3 pages
    if session[:page_views] < 3
      # Render JSON response with the article data
      render json: { article: Article.find(params[:id]) }
    else
      # Render JSON response with an error message and status code 401 unauthorized
      render json: { error: 'You have reached the maximum page views.' }, status: :unauthorized
    end
  end
end
