class OptionsController < ApplicationController
  def index
    matching_options = Option.all

    @list_of_options = matching_options.order({ :created_at => :desc })

    render({ :template => "options/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_options = Option.where({ :id => the_id })

    @the_option = matching_options.at(0)

    render({ :template => "options/show.html.erb" })
  end

  def create
    the_option = Option.new
    the_option.name = params.fetch("query_name")
    the_option.decision_id = params.fetch("query_decision_id")

    if the_option.valid?
      the_option.save
      redirect_to("/decisions/" + the_option.decision_id.to_s, { :notice => "Option created successfully."})
      # redirect_to("/options", { :notice => "Option created successfully." })
    else
      redirect_to("/options", { :alert => the_option.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_option = Option.where({ :id => the_id }).at(0)

    the_option.name = params.fetch("query_name")
    the_option.decision_id = params.fetch("query_decision_id")

    if the_option.valid?
      the_option.save
      redirect_to("/options/#{the_option.id}", { :notice => "Option updated successfully."} )
    else
      redirect_to("/options/#{the_option.id}", { :alert => the_option.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_option = Option.where({ :id => the_id }).at(0)

    the_option.destroy

    redirect_to("/options", { :notice => "Option deleted successfully."} )
  end
end
