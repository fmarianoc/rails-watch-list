class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]
  def index
    @lists = List.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
