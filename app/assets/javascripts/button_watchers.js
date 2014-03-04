var button_initialize = function() {
  $("ul#select_source a").click(function(eventObject) {
    eventObject.preventDefault();
    if ($(this).text() === "Fun & Cheap") {
  
      $("input#activity_selector").val("Fun & Cheap");
      $("#restaurantForm").empty();
    }
    else if ($(this).text() === "Restaurants") {

      $("input#activity_selector").val("Restaurants");
      $("#restaurantForm").empty();
      var restaurantQueryHTML = HandlebarsTemplates.restaurant_query();
      $("#restaurantForm").append(restaurantQueryHTML);
    }
    else if ($(this).text() === "Concerts") {
  
      $("input#activity_selector").val("Concerts");
      $("#restaurantForm").empty();
    }
    else {
      console.log("No clue, mo-fo!");
    } 
  });
};

$(document).on('ready page:load', button_initialize);