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
    first_date, second_date, third_date = generate_random_date
    LeadDate.create!(
      lead_id: lead_id,
      first_date: first_date,
      second_date: second_date,
      third_date: third_date
    )
    flash[:notice] = "Created random dates for #{lead_id}!"
    return redirect_to root_path
  end

  private

  def generate_random_date
    dates = []
    while dates.length < 3 do
      temp_date = rand(3.months).seconds.ago
      months_array = dates.map{|dt| dt.month}
      temp_date_not_in_list = !months_array.include?(temp_date.month)
      temp_date_not_current_month = !(temp_date.month == Time.now.month)
      dates.push(temp_date) if temp_date_not_in_list && temp_date_not_current_month
    end
    dates
  end
end
