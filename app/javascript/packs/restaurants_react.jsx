import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';


class HomePage extends React.Component {
    render() {
        return (
            <div className="banner">
                <h1><span className="cuisines">F&ensp;</span>WeEat</h1>
                <h2>it's 12:00 and you're hungry</h2>
            </div>
        );
    }
}

/*class RestaurantList extends React.Component {
    constructor() {
        super();
        this.state = {}



        var request = new XMLHttpRequest();
        request.open('get', '/restaurants.json', true);
        request.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
        request.send(data);


    render() {
        return(
            <h3>{this.state.data[0].id}</h3>
        );
    }
};*/

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
        return (
            <div>
                {items.map(item =>
                    <h4 key={item.id}>{item.restaurant_name}</h4>)}
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