class FipeController < ApplicationController
  def models
    render json: Fipe::Request.models(params.require(:brand_id))
  end
end
