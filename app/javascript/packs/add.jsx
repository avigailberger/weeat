import React from 'react';

export class AddReview extends React.Component {
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

export class AddRestaurant extends React.Component {
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