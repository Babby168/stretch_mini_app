class StretchesController < ApplicationController
  def index
    target_area_key = params[:target_area]
    
    # target_area_keyが存在する場合、日本語化した値を@target_areaに代入
    @target_area = if target_area_key.present?
                     I18n.t("activerecord.attributes.stretch.target_area.#{target_area_key}")
                   else
                     nil
                   end
    
    # 検索条件を設定
    @stretches = if target_area_key.present?
                   Stretch.where(target_area: target_area_key)
                 else
                   Stretch.all
                 end
  end

  def show
    @stretch = Stretch.find(params[:id])
    @target_area = params[:target_area]
  end
end
