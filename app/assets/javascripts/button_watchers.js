var button_initialize = function() {
  $("ul#select_source a").click(function(eventObject) {
    eventObject.preventDefault();
    if ($(this).text() === "Fun & Cheap") {
      console.log("fun & cheap, mo-fo!");
      $("input#activity_selector").val("Fun & Cheap");
      $("#restaurantForm").empty();
    }
    else if ($(this).text() === "Restaurants") {
      console.log("restaurants, mo-fo!");
      $("input#activity_selector").val("Restaurants");
      var restaurantQueryHTML = HandlebarsTemplates.restaurant_query();
      $("#restaurantForm").append(restaurantQueryHTML);
    }
    else if ($(this).text() === "Concerts") {
      console.log("concerts, mo-fo!");
      $("input#activity_selector").val("Concerts");
      $("#restaurantForm").empty();
    }
    else {
      console.log("No clue, mo-fo!");
    } 
  });
};

$(document).on('ready page:load', button_initialize);