import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';


class HomePage extends React.Component {
    render() {
        return (
            <div className="banner">
                <div style={{marginLeft: "70%", paddingTop: "10px"}}>
                    <h1 className="cuisine">F&ensp;</h1>
                    <h2>WeEat</h2>
                    <h3>it's 12:00 and you're hungry</h3>
                </div>
            </div>
        );
    }
}

class RestaurantList extends React.Component {
    constructor(){
        super();
        this.state = {items: []}
    }
    componentWillMount(){
        fetch( 'http://localhost:3000/restaurants.json' )
            .then( response => response.json() )
            .then( response => this.setState({items: response}))
    }
    render(){
        let items = this.state.items
        if (items && items.length > 0) {
            return (
                <div>
                    <table id="restauranTable">
                        <tbody>
                        {items.map(item =>
                            <tr key={item.id}>
                                <td className="cuisine">{item.cuisine}</td>
                                <td className="restaurant">{item.restaurant_name}</td>
                                <RestaurantRating average_rating={item.average_rating} />
                                <td className="restaurant">{item.address}</td>
                            </tr>
                        )}
                        </tbody>
                    </table>
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

class RestaurantRating extends React.Component {
    render() {
        var stars = [];
        for(var i=0;i<this.props.average_rating;i++){
            stars.push(
                (<td className="restaurant" key={i}>★</td>)
            );
        }

        return (
            <span>
                {stars}
            </span>
        )
    }
}



document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <div>
            <HomePage />
            <RestaurantList />
        </div>,
        document.body.appendChild(document.createElement('div')),
    )
});