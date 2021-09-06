class ApplicationController < ActionController::Base
  def welcome
  end

  def index

  end

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets

    # Grab input entered into search by user and submitted
    # Run through all Pets and find matches to that name
    @pet_name = (params[:search])
    @pet_result = Pet.where(name: @pet_name)
  end

  def new

  end

  def submit
    # Change application status when the application is submitted
    # Update description with user input
    application = Application.find(params[:id])
    application.update(description: params[:description], application_status: "Pending")

    # Redirect back to the applications show page
    redirect_to "/applications/#{application.id}"
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

  def add_pet
    # Store applicant id
    applicant_id = params[:id]
    ApplicationPet.create!(pet_id: params[:pet_id], application_id: params[:id])
    redirect_to "/applications/#{applicant_id}"
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
