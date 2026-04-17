class RecordsController < ApplicationController
  before_action :set_stretch, only: %i[new create]

  def index
    @records = Record.includes(:stretch).order(date: :desc)
  end

  def new
    @record = @stretch.records.build
  end

  def create
    @record = @stretch.records.build(record_params)
    # @record.user = current_user

    if @record.save
      redirect_to records_path, notice: "お疲れ様でした！記録をカレンダーに登録しました🎉"
    else
      flash.now[:alert] = "記録の登録に失敗しました"
      render :new, status: :unprocessaable_entity
    end
  end

  private
  def set_stretch
    @stretch = Stretch.find(params[:stretch_id])
  end

  def record_params
    params.require(:record).permit(:date)
  end
end
