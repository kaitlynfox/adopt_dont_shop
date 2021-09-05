class ApplicationController < ActionController::Base
  def welcome
  end

  def index

  end

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
  end

  def new

  end

  def create
    applicant = Application.new(application_params)
    if applicant.save
      redirect_to "/applications/#{applicant.id}"
    else
      flash[:notice] = "Application not created: Please fill in ALL required information."
      render :new
    end
    # applicant = Application.create!(application_params)
    # redirect_to "/applications/#{applicant.id}"
  end

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end

  def application_params
    params.permit(:name,
                  :street_address,
                  :city,
                  :state,
                  :zip_code)
            .with_defaults(application_status: "In Progress")
  end
end
