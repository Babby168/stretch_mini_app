class StretchesController < ApplicationController
  def index
    @target_area = params[:target_area]

    @stretches = if @target_area.present?
                  Stretch.where(target_area: @target_area)
    else
                  Stretch.all
    end
  end

  def show
    @stretch = Stretch.find(params[:id])
    @target_area = params[:target_area]
  end
end
