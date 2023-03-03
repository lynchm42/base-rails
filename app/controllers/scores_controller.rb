class ScoresController < ApplicationController
  def index
    matching_scores = Score.all

    @list_of_scores = matching_scores.order({ :created_at => :desc })

    render({ :template => "scores/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_scores = Score.where({ :id => the_id })

    @the_score = matching_scores.at(0)

    render({ :template => "scores/show.html.erb" })
  end

  def create
    the_score = Score.new
    the_score.score = params.fetch("query_score")
    the_score.option_id = params.fetch("query_option_id")
    the_score.criteria_id = params.fetch("query_criteria_id")

    if the_score.valid?
      the_score.save
      redirect_to("/scores", { :notice => "Score created successfully." })
    else
      redirect_to("/scores", { :alert => the_score.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_score = Score.where({ :id => the_id }).at(0)

    the_score.score = params.fetch("query_score")
    the_score.option_id = params.fetch("query_option_id")
    the_score.criteria_id = params.fetch("query_criteria_id")

    if the_score.valid?
      the_score.save
      redirect_to("/scores/#{the_score.id}", { :notice => "Score updated successfully."} )
    else
      redirect_to("/scores/#{the_score.id}", { :alert => the_score.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_score = Score.where({ :id => the_id }).at(0)

    the_score.destroy

    redirect_to("/scores", { :notice => "Score deleted successfully."} )
  end
end
