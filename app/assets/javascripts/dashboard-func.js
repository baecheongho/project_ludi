// reisizable and draggable
$( function() {
  $( ".sortable" ).sortable();
  $( ".sortable" ).disableSelection();
} );

$( function() {
  $( ".resizable" ).resizable({
    ghost: true
  });
} );




//$( function() {

//  $( ".draggable" ).draggable({
//    connectToSortable: "#sortable",
//helper: "clone",
//    revert: "valid",
//snap: ".ui-widget-header"
///snap: ".snap"
//
//  });
//} );


// jquery UI method end
