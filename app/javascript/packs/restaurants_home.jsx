import React from 'react';
import ReactDOM from 'react-dom';
import {RestaurantList} from './restaurant_list.jsx';
import {SearchName, CuisineSelectionBox, RatingSelectionBox} from './filters.jsx';
import {AddReview, AddRestaurant, AddCuisine} from './add.jsx';

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
                    <AddCuisine />
                </div>
                <RestaurantList selectRatingValue={selectRatingValue} selectCuisineValue={selectCuisineValue} searchName={searchName}/>
            </div>
        )
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