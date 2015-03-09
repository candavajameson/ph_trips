module API
	module V1
		class Hotels < Grape::API
		 	include API::V1::Defaults

			resource :hotels do 
				desc "Return list of hotels"
				get do
					Hotel.all
				end

				desc "Return a hotel"
				params do 
					requires :id, type: String, desc: "ID of the contact"
				end

				get ":id", root: "hotel" do
					Hotel.find(permitted_params[:id])
				end
			end
		end
	end
end