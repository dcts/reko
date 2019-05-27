class RekosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @rekos = Reko.where(user_id == current_user.id)
  end
end
