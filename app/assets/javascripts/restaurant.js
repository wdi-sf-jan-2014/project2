$(function() {

  $("ul#select_source a").click(function(eventObject) {
    eventObject.preventDefault();
    if ($(this).text() === "Events") {
      console.log("events, mo-fo!");
    }
    else if ($(this).text() === "Restaurants") {
      console.log("restaurants, mo-fo!");
    }
    else if ($(this).text() === "Concerts") {
      console.log("concerts, mo-fo!");
    }
    else {
      console.log("No clue, mo-fo!");
    } 
  });

});