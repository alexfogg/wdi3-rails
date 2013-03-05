class PrioritiesController < ApplicationController
  def index
    @priorities = @auth.priorities
  end
  def up
    priority = Priority.find(params[:id])
    higher = @auth.priorities.where('value > ?', priority.value).order('value ASC').first

    if higher.present?
      temp = priority.value
      priority.value = higher.value
      higher.value = temp
      priority.save
      higher.save
      render :json => [priority, higher]
    else
      render :json => [priority]
    end
  end
  def down
    priority = Priority.find(params[:id])
    lower = @auth.priorities.where('value < ?', priority.value).order('value DESC').first

    if lower.present?
      temp = priority.value
      priority.value = lower.value
      lower.value = temp
      priority.save
      lower.save
      render :json => [priority, lower]
    else
      render :json => [priority]
    end
  end
  def create
    priority = Priority.create(params[:priority])
    @auth.priorities << priority
    render :json => [priority]
  end
  def update
    priority = Priority.find(params[:id])
    priority.update_attributes(params[:priority])
    render :json => [priority]
  end
end