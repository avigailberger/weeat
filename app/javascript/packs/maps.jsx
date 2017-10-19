import React from 'react';
import { compose } from "recompose";
import { withScriptjs, withGoogleMap, GoogleMap, Marker } from "react-google-maps"
import MarkerWithLabel from "react-google-maps/lib/components/addons/MarkerWithLabel";
import Geocoder from 'react-native-geocoding';

export class SimpleMap extends React.Component {
    render() {
        let items = this.props.filteredRestaurants
        let markers = [];

        items.map(restaurant =>
        {
            markers.push({
                name: restaurant.restaurant_name,
                position: {lat: restaurant.lat, lng: restaurant.lng},
                id: restaurant.id
            })

        })
        //markers.push({
        //    name: 'WeWork',
        //    position: {lat:32.075256, lng:34.7820189},
        //    id: 0
        //})

        return (
            <MapWithAMarkerWithLabel
                googleMapURL="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4R6AN7SmujjPUIGKdyao2Kqitzr1kiRg&v=3.exp&libraries=geometry,drawing,places"
                loadingElement={<div style={{ height: `100%` }} />}
                containerElement={<div style={{ height: `400px` }} />}
                mapElement={<div style={{ height: `100%` }} />}
                items={markers}
            />
        );
    }
}

const MapWithAMarkerWithLabel = compose(
    withScriptjs,
    withGoogleMap
)(props =>
    <GoogleMap
        defaultZoom={15}
        defaultCenter={{lat:32.075256, lng:34.7820189}}
    >
        {props.items.map(marker =>
            <MarkerWithLabel
                position={marker.position}
                labelAnchor={new google.maps.Point(0, 0)}
                labelStyle={{backgroundColor: '#f7e4d7', fontSize: "12px", padding: "2px"}}
                key={marker.id}
            >
                <div>{marker.name}</div>
            </MarkerWithLabel>
        )}
    </GoogleMap>
);



