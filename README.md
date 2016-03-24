# google_maps_api

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
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/[your-github-name]/google_maps_api/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [fridgerator](https://github.com/[your-github-name]) Nick Franken - creator, maintainer
