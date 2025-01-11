import { Controller } from '@hotwired/stimulus';
import mapboxgl from 'mapbox-gl';
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    console.log('Map controller connected');
    console.log('Markers', this.markersValue);

    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [-0.1276, 51.5074],
      zoom: 12,
      attributionControl: false,
    });

    // Wait for map to load before adding markers
    this.map.on('load', () => {
      console.log(`Map loaded`);
      this.map.resize();
      this.#addMarkersToMap();
      this.#fitMapToMarkers();
    });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // check for invalid markers and skip them
      if (!marker.lng || !marker.lat) {
        console.warn('Invalid marker skipped:', marker);
        return;
      }
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);

      const customMarker = document.createElement('div');
      customMarker.innerHTML = marker.marker_html;

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  // Set the map zoom and bounds based on available markers
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();

    if (this.markersValue.length === 1) {
      const marker = this.markersValue[0];
      console.log('Single marker:', marker.lng, marker.lat);

      this.map.setCenter([marker.lng, marker.lat]);
      this.map.setZoom(14);
    } else {
      this.markersValue.forEach((marker) => {
        if (marker.lng && marker.lat) {
          console.log(`Marker coordinates:`, marker.lng, marker.lat);
          bounds.extend([marker.lng, marker.lat]);
        } else {
          console.warn(`Invalid marker coordinates:`, marker);
        }
      });

      if (!bounds.isEmpty()) {
        console.log(`Final map bounds:`, bounds);
        this.map.fitBounds(bounds, {
          padding: { top: 70, bottom: 220, left: 70, right: 70 },
          maxZoom: 15,
          duration: 2000,
        });
      } else {
        console.warn(`Bounds are empty, cannot fit map to markers`);
      }
    }
  }
}
