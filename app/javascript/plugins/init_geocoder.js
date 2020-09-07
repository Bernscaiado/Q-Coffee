import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import mapboxgl from 'mapbox-gl';

const initGeocoder = () => {
  const input = document.getElementById('coffee_address');
  if (input) {
    mapboxgl.accessToken = input.dataset.mapboxApiKey;
    const geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      types: 'country,region,place,postcode,locality,neighborhood, poi',
      countries: 'br'
    });
     
    geocoder.addTo('#coffee_address');
    const geocoderInput = document.querySelector('.mapboxgl-ctrl-geocoder--input');
    geocoderInput.name = 'coffee[address]'
  }
}

export { initGeocoder };
