class LeadDatesController < ApplicationController
  require 'csv'

  def index
    @lead_dates = LeadDate.all
  end

  def create
    lead_id = params[:lead_id]

    if lead_id.blank?
      flash[:notice] = "lead id can't be blank!"
      return redirect_to root_path
    end

    if LeadDate.exists?(lead_id: lead_id)
      flash[:notice] = "lead id already exists!"
      return redirect_to root_path
    end

    LeadDate.create!(
      lead_id: lead_id,
      first_date: rand(3.months).seconds.ago,
      second_date: rand(3.months).seconds.ago,
      third_date: rand(3.months).seconds.ago
    )
    flash[:notice] = "Created random dates for #{lead_id}!"
    return redirect_to root_path
  end
end
