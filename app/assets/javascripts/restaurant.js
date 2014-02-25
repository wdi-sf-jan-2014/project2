$(function() {

  $("ul#select_source a").click(function(eventObject) {
    eventObject.preventDefault();
    if ($(this).text() === "Fun & Cheap") {
      console.log("fun & cheap, mo-fo!");
      $("input#activity_selector").val("Fun & Cheap");
    }
    else if ($(this).text() === "Restaurants") {
      console.log("restaurants, mo-fo!");
      $("input#activity_selector").val("Restaurants");
    }
    else if ($(this).text() === "Concerts") {
      console.log("concerts, mo-fo!");
      $("input#activity_selector").val("Concerts");
    }
    else {
      console.log("No clue, mo-fo!");
    } 
  });

});