class HomesController < ApplicationController
  skip_before_action :authorized, only: [:index]
  def index
  end
end