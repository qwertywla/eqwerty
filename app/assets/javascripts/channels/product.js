App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    $(".alert.alert-info").show();
    //console.log(data);
    //comments ordered to show most recent one at the top with prepend
    $('.product-reviews').prepend(data.comment);
    //update display of average rating
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating();
  },

  listen_to_comments: function() {
    // Called when there's incoming data from a specific product channel
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }
});

$(document).on('turbolinks:load', function() {
App.product.listen_to_comments();
});
