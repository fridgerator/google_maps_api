module GoogleMapsApi
	class Photo
		JSON.mapping({
			height: Int32,
			width: Int32,
			photo_reference: String
		})
	end
end