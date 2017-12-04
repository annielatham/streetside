class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all

    render("vehicles/index.html.erb")
  end

  def show
    @vehicle = Vehicle.find(params[:id])

    render("vehicles/show.html.erb")
  end

  def new
    @vehicle = Vehicle.new

    render("vehicles/new.html.erb")
  end

  def create
    @vehicle = Vehicle.new

    @vehicle.year = params[:year]
    @vehicle.make = params[:make]
    @vehicle.model = params[:model]
    @vehicle.color = params[:color]
    @vehicle.nickname = params[:nickname]
    @vehicle.license_plate = params[:license_plate]

    save_status = @vehicle.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vehicles/new", "/create_vehicle"
        redirect_to("/vehicles")
      else
        redirect_back(:fallback_location => "/", :notice => "Vehicle created successfully.")
      end
    else
      render("vehicles/new.html.erb")
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])

    render("vehicles/edit.html.erb")
  end

  def update
    @vehicle = Vehicle.find(params[:id])

    @vehicle.year = params[:year]
    @vehicle.make = params[:make]
    @vehicle.model = params[:model]
    @vehicle.color = params[:color]
    @vehicle.nickname = params[:nickname]
    @vehicle.license_plate = params[:license_plate]

    save_status = @vehicle.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vehicles/#{@vehicle.id}/edit", "/update_vehicle"
        redirect_to("/vehicles/#{@vehicle.id}", :notice => "Vehicle updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Vehicle updated successfully.")
      end
    else
      render("vehicles/edit.html.erb")
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])

    @vehicle.destroy

    if URI(request.referer).path == "/vehicles/#{@vehicle.id}"
      redirect_to("/", :notice => "Vehicle deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Vehicle deleted.")
    end
  end
end
