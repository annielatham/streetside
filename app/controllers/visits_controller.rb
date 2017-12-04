class VisitsController < ApplicationController
  def index
    @visits = Visit.page(params[:page]).per(10)

    render("visits/index.html.erb")
  end

  def show
    @visit = Visit.find(params[:id])

    render("visits/show.html.erb")
  end

  def new
    @visit = Visit.new

    render("visits/new.html.erb")
  end

  def create
    @visit = Visit.new

    @visit.vehicle_id = params[:vehicle_id]
    @visit.permit_id = params[:permit_id]
    @visit.start_time = params[:start_time]
    @visit.end_time = params[:end_time]

    save_status = @visit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/visits/new", "/create_visit"
        redirect_to("/visits")
      else
        redirect_back(:fallback_location => "/", :notice => "Visit created successfully.")
      end
    else
      render("visits/new.html.erb")
    end
  end

  def edit
    @visit = Visit.find(params[:id])

    render("visits/edit.html.erb")
  end

  def update
    @visit = Visit.find(params[:id])

    @visit.vehicle_id = params[:vehicle_id]
    @visit.permit_id = params[:permit_id]
    @visit.start_time = params[:start_time]
    @visit.end_time = params[:end_time]

    save_status = @visit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/visits/#{@visit.id}/edit", "/update_visit"
        redirect_to("/visits/#{@visit.id}", :notice => "Visit updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Visit updated successfully.")
      end
    else
      render("visits/edit.html.erb")
    end
  end

  def destroy
    @visit = Visit.find(params[:id])

    @visit.destroy

    if URI(request.referer).path == "/visits/#{@visit.id}"
      redirect_to("/", :notice => "Visit deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Visit deleted.")
    end
  end
end
