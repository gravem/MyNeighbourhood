class ReportsController < ApplicationController

  def index

    # @reports = Report.order(:location, )
    # @reports = Report.all

    # Fetch user coordinates
    user_coordinates = Geocoder.coordinates(current_user.address) || [51.5074, -0.1278] # Default: London

    # Fetch reports near user and exclude "Done" reports and with missing lat and long
    @reports = Report.near(user_coordinates, 500, order: 'distance')
    @reports_active = @reports.where.not(status: "Done").where.not(latitude: nil, longitude: nil)

    # Log reports with missing coordinates (if any)
    @reports.where(latitude: nil, longitude: nil).each do |report|
      logger.warn("Missing coordinates for report ID: #{report.id}")
    end

    # Calculate distances (if needed for the view)
    # @distances = @reports_active.map do |report|
    #   Geocoder::Calculations.distance_between(user_coordinates, [report.latitude, report.longitude])
    # end

    # Build markers for the map
    @markers = @reports_active.map do |report|
      {
        lat: report.latitude,
        lng: report.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {report: report}),
        marker_html: render_to_string(partial: "marker", locals: {report: report})
      }
    end
    Rails.logger.debug "Markers: #{@markers.inspect}"
    Rails.logger.debug "Reports near user: #{@reports.inspect}"
    Rails.logger.debug "User coordinates: #{user_coordinates.inspect}"
    Rails.logger.debug "Current User Address: #{current_user.address.inspect}"
  end

  def show
    @report = Report.find(params[:id])
    @ticket = Ticket.new
    @comment = Comment.new
    @follow = Follow.where(user: current_user, report: @report).first
    @markers = [
      {
        lat: @report.latitude,
        lng: @report.longitude,
        marker_html: render_to_string(partial: "marker", locals: {report: @report})
      }
    ]
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save
      redirect_to report_path(@report)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.update(report_params)
    redirect_to report_path(@report)
  end

  def destroy
    @report = Report.find(params[:id])
    @report.tickets.destroy_all
    @report.destroy
    redirect_to reports_path, status: :see_other
  end

  def report_params
    params.require(:report).permit(:title, :description, :location, :latitude, :longitude, :category, :status, :votes, photos: [])
  end
end
