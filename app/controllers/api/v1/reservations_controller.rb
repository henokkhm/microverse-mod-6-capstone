module Api
  module V1
    class ReservationsController < ApplicationController

      

      def show

      end

      def create
        reservation = Reservation.new(reservation_params)

        if reservation.save
          render json: ReservationSerializer.new(reservation).serialized_json
        else
          render json: {error: reservation.errors.messages}, status: 422
        end
      end

      def destroy
        reservation = Reservation.find(reservation_params)

        if reservation.destroy
          head :no_content
        else
          render json: {error: reservation.errors.messages}, status: 422
        end
      end
      private

      def reservation_params
        params.require(:reservation).permit(:user_id, :package_id, :location, :date)
      end
    end
  end
end
