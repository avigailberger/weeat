import React from 'react';
import {SimpleMap} from './maps.jsx';

export class RestaurantList extends React.Component {
    constructor(){
        super();
        this.state = {
            items: [],
        }
    }

    componentWillMount(){
        fetch( 'http://localhost:3000/restaurants.json' )
            .then( response => response.json() )
            .then( response => this.setState({items: response}))
    }

    renderStars(numOfStars)
    {
        var stars = '';
        for(var i=0;i<numOfStars;i++){
            stars += '★'
        }
        return stars
    }

    render(){
        //get filtered items
        let items = this.state.items;
        const selectCuisineValue = this.props.selectCuisineValue;
        const selectRatingValue = this.props.selectRatingValue;
        const searchName = this.props.searchName.trim();
        if (selectCuisineValue != 'All')
            items = items.filter(function(m) { return m.cuisine.descriptionH == selectCuisineValue;});
        if (selectRatingValue != 'All')
            items = items.filter(function(m) { return m.average_rating == selectRatingValue;});
        if (searchName != '')
            items = items.filter(function(m) { return m.restaurant_name.trim().includes(searchName);});

        //generate table of restaurants
        if (items && items.length > 0) {
            return (
                <div>
                    <div className="restaurantBody">
                        <div className="map">
                            <SimpleMap filteredRestaurants={items}/>
                        </div>
                        <div className="restaurantList">
                            <div className="scrollbar" id="style-default">
                                {items.map(item =>
                                    <div className="restaurantItem" key={item.id}>
                                        <div className="restaurant">
                                            {this.renderStars(item.average_rating)}  {item.restaurant_name}<br/>
                                            {item.cuisine.descriptionH}<br/>
                                            {item.address}
                                        </div>
                                        <div className="cuisine">
                                            <a href={'/restaurants/'+ item.id}> {item.cuisine.icon}</a>
                                        </div>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            )
        }
        else {//error handling
            return (
                <span>No restaurants found</span>
            )
        }
    }
}