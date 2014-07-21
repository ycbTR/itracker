class ReportsController < ApplicationController

  #Routes -- get
  # daily_visits_reports_path
  # reschedule_visits_reports_path
  # patient_history_reports_path
  # visit_sales_reports_path

  def daily_visits
    params[:q] ||= {}
    params[:q][:date_visit_eq] ||= Date.today
    load_visits
  end

  def patient_history
    @patient = Patient.find(params[:patient_id])
    @visits = @patient.visits
  end


  def visit_sales
    params[:q] ||= {}
    params[:q][:date_visit_gteq] ||= ((Date.today - 10.days)).to_date
    params[:q][:date_visit_lteq] ||= Date.today

    load_visits
  end

  # Filters visits according to given date scope
  def reschedule_visits
    params[:q] ||= {}
    params[:q][:date_visit_gteq] ||= ((Date.today - 11.months) - 3.days).to_date
    params[:q][:date_visit_lteq] ||= (((Date.today - 11.months)) + 1.day).to_date
    load_visits
  end

  def social_media
    @patients = Patient.where("facebook_account = ? OR twitter_account = ? ", true, true).page(params[:page]).per(20)
  end

  private

  def load_visits
    @search = Visit.ransack(params[:q])
    @visits = @search.result(:distinct => true).page(params[:page]).per(20)
  end


end