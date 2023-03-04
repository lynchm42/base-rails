class CriteriaController < ApplicationController
  def index
    matching_criteria = Criterium.all

    @list_of_criteria = matching_criteria.order({ :created_at => :desc })

    render({ :template => "criteria/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_criteria = Criterium.where({ :id => the_id })

    @the_criterium = matching_criteria.at(0)

    render({ :template => "criteria/show.html.erb" })
  end

  def create
    the_criterium = Criterium.new
    the_criterium.weight = params.fetch("query_weight")
    the_criterium.decision_id = params.fetch("query_decision_id")
    the_criterium.name = params.fetch("query_name")

    if the_criterium.valid?
      the_criterium.save
      redirect_to("/decisions_criteria/" + the_criterium.decision.id.to_s, { :notice => "Criterium created successfully." })
    else
      redirect_to("/criteria", { :alert => the_criterium.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_criterium = Criterium.where({ :id => the_id }).at(0)

    the_criterium.weight = params.fetch("query_weight")
    the_criterium.decision_id = params.fetch("query_decision_id")
    the_criterium.name = params.fetch("query_name")

    if the_criterium.valid?
      the_criterium.save
      redirect_to("/decisions_weights/#{the_criterium.decision_id}", { :notice => "Criterium updated successfully."} )
    else
      redirect_to("/criteria/#{the_criterium.id}", { :alert => the_criterium.errors.full_messages.to_sentence })
    end
  end

  def weight_update
    params[:weight].each do |criterium_id, weight|
      criterium = Criterium.find(criterium_id)
      criterium.update(weight: weight.to_i)
    end
    redirect_back(fallback_location: root_path)
    # decision_id = Criterium.first.decision_id
    # redirect_to("/decisions_weights/#{decision_id}", { :notice => "Weight updated successfully."})
  end

  def destroy
    the_id = params.fetch("path_id")
    the_criterium = Criterium.where({ :id => the_id }).at(0)

    the_criterium.destroy

    redirect_to("/criteria", { :notice => "Criterium deleted successfully."} )
  end
end
