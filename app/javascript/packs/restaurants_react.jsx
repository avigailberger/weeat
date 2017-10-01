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
        //error handling
        return (
            <div>
                <table id="restauranTable">
                    <tbody>
                    {items.map(item =>
                        <tr key={item.id}>
                            <td className="cuisine" >{item.cuisine}</td>
                            <td className="restaurant">{item.restaurant_name}</td>
                            <td className="restaurant">{item.average_rating}</td>
                            <td className="restaurant">{item.address}</td>
                        </tr>
                    )}
                    </tbody>
                </table>
            </div>
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