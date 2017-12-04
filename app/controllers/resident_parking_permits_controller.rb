class ResidentParkingPermitsController < ApplicationController
  def index
    @resident_parking_permits = ResidentParkingPermit.all

    render("resident_parking_permits/index.html.erb")
  end

  def show
    @resident_parking_permit = ResidentParkingPermit.find(params[:id])

    render("resident_parking_permits/show.html.erb")
  end

  def new
    @resident_parking_permit = ResidentParkingPermit.new

    render("resident_parking_permits/new.html.erb")
  end

  def create
    @resident_parking_permit = ResidentParkingPermit.new

    @resident_parking_permit.resident_id = params[:resident_id]
    @resident_parking_permit.vehicle_id = params[:vehicle_id]
    @resident_parking_permit.purchase_date = params[:purchase_date]
    @resident_parking_permit.expiration_date = params[:expiration_date]

    save_status = @resident_parking_permit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/resident_parking_permits/new", "/create_resident_parking_permit"
        redirect_to("/resident_parking_permits")
      else
        redirect_back(:fallback_location => "/", :notice => "Resident parking permit created successfully.")
      end
    else
      render("resident_parking_permits/new.html.erb")
    end
  end

  def edit
    @resident_parking_permit = ResidentParkingPermit.find(params[:id])

    render("resident_parking_permits/edit.html.erb")
  end

  def update
    @resident_parking_permit = ResidentParkingPermit.find(params[:id])
    @resident_parking_permit.vehicle_id = params[:vehicle_id]
    @resident_parking_permit.purchase_date = params[:purchase_date]
    @resident_parking_permit.expiration_date = params[:expiration_date]

    save_status = @resident_parking_permit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/resident_parking_permits/#{@resident_parking_permit.id}/edit", "/update_resident_parking_permit"
        redirect_to("/resident_parking_permits/#{@resident_parking_permit.id}", :notice => "Resident parking permit updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Resident parking permit updated successfully.")
      end
    else
      render("resident_parking_permits/edit.html.erb")
    end
  end

  def destroy
    @resident_parking_permit = ResidentParkingPermit.find(params[:id])

    @resident_parking_permit.destroy

    if URI(request.referer).path == "/resident_parking_permits/#{@resident_parking_permit.id}"
      redirect_to("/", :notice => "Resident parking permit deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Resident parking permit deleted.")
    end
  end
end
