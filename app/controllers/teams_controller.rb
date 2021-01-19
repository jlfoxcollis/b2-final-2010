class TeamsController < ApplicationController

  def index
    @teams = Team.all.sort_by_age
  end

  def new
    @team = Team.new
  end

  def create
    competition = Competition.find(params[:competition_id])
    competition.teams.create(team_params)
    redirect_to competition_path(params[:competition_id])
  end

  private

  def team_params
    params.require(:team).permit(:nickname, :hometown)
  end
end
