import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';

class AddReview extends React.Component {
    render() {
        return (
            <div className="addReview" >
                <form action="/reviews/new">
                    <input type="submit" value="Add Review" />
                </form>
            </div>
        );
    }
}
class AddRestaurant extends React.Component {
    render() {
        return (
            <div className="addRestaurant" >
                <form action="/restaurants/new">
                    <input type="submit" value="Add Restaurant" />
                </form>
            </div>
        );
    }
}

class SearchName extends React.Component {
    render() {
        return (
            <div className="searchName">
                <input type="text" placeholder="חפש שם מסעדה" onKeyPress={this.props.handleOnChange}></input>
            </div>
        );
    }
}

class CuisineSelectionBox extends React.Component {
    constructor(){
        super();
        this.state = {
            cuisines: [],
        }
    }

    componentWillMount(){
        fetch( 'http://localhost:3000/cuisines' )
            .then( response => response.json() )
            .then( data => this.setState({cuisines: data.cuisines}))
    }

    render() {
        let cuisines = this.state.cuisines;
        return (
                <div className="filterCuisine">
                    <select onChange={this.props.handleOnChange}>
                        <option key='All' value="All">Choose Cuisine</option>
                        {cuisines.map(item =>
                            <option key={item}>{item}</option>)
                        }
                    </select>
                </div>
        );
    }
}

class RatingSelectionBox extends React.Component {
    render() {
        return (
                <div className="filterRating">
                    <select onChange={this.props.handleOnChange}>
                        <option value="All">Choose Rating</option>
                        <option value="1">★</option>
                        <option value="2">★★</option>
                        <option value="3">★★★</option>
                    </select>
                </div>
        );
    }
}

class RestaurantContainer extends React.Component {
    constructor() {
        super();
        this.state = {
            selectCuisineValue: 'All',
            selectRatingValue: 'All',
            searchName: ''
        }
    }

    handleOnChangeCuisine(e) {
        this.setState({
            selectCuisineValue: e.target.value
        });
    }
    handleOnChangeRating(e) {
        this.setState({
            selectRatingValue: e.target.value
        });

    }
    handleOnChangeSearchName(e) {
        if (e.charCode == 13) {
            this.setState({
                searchName: e.target.value
            });
        }
    }


    render() {
        const selectCuisineValue = this.state.selectCuisineValue;
        const selectRatingValue = this.state.selectRatingValue;
        const searchName = this.state.searchName;

        return (
            <div>
                <div className="filters">
                    <CuisineSelectionBox handleOnChange={this.handleOnChangeCuisine.bind(this)}/>
                    <RatingSelectionBox handleOnChange={this.handleOnChangeRating.bind(this)}/>
                    <SearchName handleOnChange={this.handleOnChangeSearchName.bind(this)}/>
                </div>
                <div className="buttons">
                    <AddReview />
                    <AddRestaurant />
                </div>
                <RestaurantList selectRatingValue={selectRatingValue} selectCuisineValue={selectCuisineValue} searchName={searchName}/>
            </div>
        )
    }
}

class RestaurantList extends React.Component {
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
        const searchName = this.props.searchName;
        if (selectCuisineValue != 'All')
            items = items.filter(function(m) { return m.cuisine_name == selectCuisineValue;});
        if (selectRatingValue != 'All')
            items = items.filter(function(m) { return m.average_rating == selectRatingValue;});
        if (searchName != '')
            items = items.filter(function(m) { return m.restaurant_name == searchName;});

        //generate table of restaurants
        if (items && items.length > 0) {
            return (
                <div>
                    <div className="restaurantBody">
                        <div className="map"></div>
                        <div className="restauranList">
                            <div className="scrollbar" id="style-default">
                                {items.map(item =>
                                    <div className="restaurantItem" key={item.id}>
                                        <div className="restaurant">
                                        {this.renderStars(item.average_rating)}  {item.restaurant_name}<br/>
                                        {item.address}
                                        </div>
                                        <div className="cuisine">
                                            <a href={'/restaurants/'+ item.id}> {item.cuisine_code}</a>
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


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <div>
            <RestaurantContainer />
        </div >,
        document.body.appendChild(document.createElement('div')),
    )
});