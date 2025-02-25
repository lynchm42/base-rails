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

    render({ :template => "decisions/step3.html.erb" })
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

  def scores
    the_id = params.fetch("path_id")

    matching_decisions = Decision.where({ :id => the_id })

    @the_decision = matching_decisions.at(0)

    @criteria = @the_decision.criteria
    @options = @the_decision.options

    # @scores = Score.where({ :criteria_id => @criteria.id, :option_id => @option.id}).at(0)

    render({ :template => "decisions/scores.html.erb" })
  end

  def answer
    the_id = params.fetch("path_id")

    matching_decisions = Decision.where({ :id => the_id })

    @the_decision = matching_decisions.at(0)

    @criteria = @the_decision.criteria
    @options = @the_decision.options
    
    @option_scores = []

    @options.each do |option|
      total_weighted_score = 0
  
      @criteria.each do |criteria|
        scores = Score.where({ :option_id => option.id, :criteria_id => criteria.id })
        
        if scores.present?
          score = scores.first.score
          weighted_score = score * criteria.weight
          total_weighted_score += weighted_score
        end
      end
  
      @option_scores << [option, total_weighted_score]
    end
  
    @option_scores = @option_scores.sort_by { |option, score| -score }.first(3)
   
    if params[:show_top_3] == "true"
      @show_top_3 = true
      @option_scores = @option_scores.first(3)
    else
      @show_top_3 = false
      # Show only the option with the highest score
      @option_scores = [@option_scores.first]
    end
    
    render({ :template => "decisions/answer.html.erb" })
  end

  def decided
      decision_score = 0
    criteria_weights = Decision.criteria.weight
    criteria_weights.each do |cw|
      score = Rating.where(option_id: option.id, criteria_id: cw.criteria_id).pluck(:score).first
      decision_score += cw.weight * score
    end
    return decision_score
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
