import React from 'react';

export class SearchName extends React.Component {
    render() {
        return (
            <div className="searchName">
                <input type="text" placeholder="חפש שם מסעדה" onKeyPress={this.props.handleOnChange}></input>
            </div>
        );
    }
}

export class CuisineSelectionBox extends React.Component {
    constructor(){
        super();
        this.state = {
            cuisines: [],
        }
    }

    componentWillMount(){
        fetch( 'http://localhost:3000/cuisines.json' )
            .then( response => response.json() )
            .then( response => this.setState({cuisines: response}))
    }

    render() {
        let cuisines = this.state.cuisines;
        return (
            <div className="filterCuisine">
                <select onChange={this.props.handleOnChange}>
                    <option key='All' value="All">סוג מטבח</option>
                    {cuisines.map(item =>
                        <option key={item.id}>{item.descriptionH}</option>)
                    }
                </select>
            </div>
        );
    }
}

export class RatingSelectionBox extends React.Component {
    render() {
        return (
            <div className="filterRating">
                <select onChange={this.props.handleOnChange}>
                    <option value="All">דירוג</option>
                    <option value="1">★</option>
                    <option value="2">★★</option>
                    <option value="3">★★★</option>
                </select>
            </div>
        );
    }
}