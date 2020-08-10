import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'fontawesome-stars'
  });
};

export { initStarRating };
