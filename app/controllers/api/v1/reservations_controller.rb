module Api
  module V1
    class ReservationsController < ApplicationController

      def index
        package = Package.find_by(slug: params[:package_slug])

        if package
          reservations = Reservation.where(package: package)
          render json: reservations, each_serializer: ReservationSerializer, status: :ok
        else
          render json: { error: 'Package not found' }, status: :not_found
        end
      end

      def reservation_params
        params.require(:reservation).permit(:user_id, :package_id, :location, :date)
      end
    end
  end
end
