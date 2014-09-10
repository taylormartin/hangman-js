// Function available everywhere, but isn't automatically called
var attach_entry = function(list) {
  list.append( $('<li>This is being attached</li>') );
}

var attach_entry_with_content = function(list, content) {
  list.append( $('<li>' + content + '</li>') );
}

$(function() {
  // This will append this line to ANY element with class entries
  $('.entries').append( $('<li>This is coming from welcome.js</li>') );
});
