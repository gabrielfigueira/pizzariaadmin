class DashboardController < ApplicationController
  def index
  end

  def comandas
    @comandas = Comandas.all
  end
end
