class ArticlesController < ApplicationController
  before_filter :authorize!

  def index
    current_user.articles
  end
end