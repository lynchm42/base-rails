class DecisionsController < ApplicationController
  def index
    matching_decisions = Decision.all

    @list_of_decisions = matching_decisions.order({ :created_at => :desc })

    render({ :template => "decisions/index.html.erb" })
  end

  def options
    the_id = params.fetch("path_id")

    matching_decisions = Decision.where({ :id => the_id })

    @the_decision = matching_decisions.at(0)

    render({ :template => "decisions/options.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_decisions = Decision.where({ :id => the_id })

    @the_decision = matching_decisions.at(0)

    render({ :template => "decisions/show.html.erb" })
  end

  def create
    the_decision = Decision.new
    the_decision.name = params.fetch("query_name")

    if the_decision.valid?
      the_decision.save
      redirect_to("/decisions/" + the_decision.id.to_s, { :notice => "Decision created successfully." })
    else
      redirect_to("/decisions", { :alert => the_decision.errors.full_messages.to_sentence })
    end
  end

  def weights
    the_id = params.fetch("path_id")

    matching_decisions = Decision.where({ :id => the_id })

    @the_decision = matching_decisions.at(0)

    render({ :template => "decisions/weights.html.erb" })
  end

  def update
    the_id = params.fetch("path_id")
    the_decision = Decision.where({ :id => the_id }).at(0)

    the_decision.name = params.fetch("query_name")

    if the_decision.valid?
      the_decision.save
      redirect_to("/decisions/#{the_decision.id}", { :notice => "Decision updated successfully."} )
    else
      redirect_to("/decisions/#{the_decision.id}", { :alert => the_decision.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_decision = Decision.where({ :id => the_id }).at(0)

    the_decision.destroy

    redirect_to("/decisions", { :notice => "Decision deleted successfully."} )
  end
end
