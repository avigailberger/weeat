import React from 'react';
import GoogleMapReact from 'google-map-react';

export class SimpleMap extends React.Component {
    constructor(){
        super();
    }

    static defaultProps = {
        center: {lat: 32.075256, lng: 34.7820189},
        zoom: 15
    };

    renderMarkers(map) {
        debugger
        if (this.props.filteredRestaurants != null)
        {
            const geocoder = new window.google.maps.Geocoder();
            this.props.filteredRestaurants
                .map((restaurant, index) => (
                    geocoder.geocode(
                        {address: restaurant.address},
                        function (results, status) {
                            if (status == google.maps.GeocoderStatus.OK) {
                                createMarker(map, restaurant.restaurant_name, results[0].geometry.location);
                            }
                        })
                ));
        }
        createMarker(map, 'WeWork', {lat:32.075256, lng:34.7820189});
    }

    render() {
        return (
            <GoogleMapReact
                onGoogleApiLoaded={({map, maps}) => this.renderMarkers(map)}
                defaultCenter={this.props.center}
                defaultZoom={this.props.zoom}
            >
            </GoogleMapReact>
        );
    }
}

const createMarker = (map, restaurantName, position) => {
    new window.google.maps.Marker(
        {
            label: restaurantName,
            title: restaurantName,
            map: map,
            position: position
        })
};