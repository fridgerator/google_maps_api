# GoogleMapsApi

WORK IN PROGRESS

Crystal library for the Google Maps API.

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  google_maps_api:
    github: fridgerator/google_maps_api
```


## Usage


```crystal
require "google_maps_api"
```

#### Geocoding

```cyrstal
GoogleMapsApi::Geocoding.address_search("1111 North 20th")
GoogleMapsApi::Geocoding.latlng_search(40.714224, -73.961452)
GoogleMapsApi::Geocoding.place_search("ChIJd8BlQ2BZwokRAFUEcm_qrcA")
```

#### Places
**places API requires an API key (set using ENV["GOOGLE_API_KEY"])**

```crystal
GoogleMapsApi::Place.nearby(40.714224, -73.961452, {radius: 1000})
GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI")
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/google_maps_api/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [fridgerator](https://github.com/fridgerator) Nick Franken - creator, maintainer
