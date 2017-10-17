import React from 'react';

export class AddReview extends React.Component {
    render() {
        return (
            <div className="addReview" >
                <form action="/reviews/new">
                    <input type="submit" value="הוסף ביקורת" />
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
                    <input type="submit" value="הוסף מסעדה" />
                </form>
            </div>
        );
    }
}

export class AddCuisine extends React.Component {
    render() {
        return (
            <div className="addCuisine" >
                <form action="/cuisines/new">
                    <input type="submit" value="הוסף סוג מטבח" />
                </form>
            </div>
        );
    }
}