var ready, set_positions, set_positions_todo;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.panelTr').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

set_positions_todo = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.panelTr2').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}


ready = function(){

    // call set_positions function
    set_positions();
     $('.sortable').sortable({ handle: '.handle' });


    // after the order changes
    $('.sortable').sortable().bind('sortupdate', function(e, ui) {
        // array to store new order
        updated_order = []
        // set the updated positions
        set_positions();

        // populate the updated_order array with the new task positions
        $('.panelTr').each(function(i){
            updated_order.push({ id: $(this).data("id"), position: i+1 });
        });

        // send the updated order via ajax
        $.ajax({
            type: "PUT",
            url: '/tasks/sort',
            data: { order: updated_order }
        });
    });


        // call set_positions function
    set_positions_todo();
     $('.sortableTodo').sortable({ handle: '.handleTodo' });


    // after the order changes
    $('.sortableTodo').sortable().bind('sortupdate', function(e, ui) {
        // array to store new order
        updated_order = []
        // set the updated positions
        set_positions_todo();

        // populate the updated_order array with the new task positions
        $('.panelTr2').each(function(i){
            updated_order.push({ id: $(this).data("id"), position: i+1 });
        });

        // send the updated order via ajax
        $.ajax({
            type: "PUT",
            url: '/todolists/sort',
            data: { order: updated_order }
        });
    });
}



$(document).on( "change", ".inputUpload", function() {  
    var id_input = $(this).attr('id_input');
    $("<img class='loadinfFile' src='loading.gif' alt='loading'>").appendTo('#linkFile_'+id_input);
    $('.formUploader_'+id_input).ajaxSubmit({
        clearForm: true,
        resetForm: true,
        dataType: 'script'
    });
});

 function removeComment(remove_id) {  
    $("<div class='remComm'><img src='removing.gif' alt='Removing'></div>").appendTo('#mainResultComment_'+remove_id);   
    $('#mainResultComment_'+remove_id).css("color", "silver");
   }

$(document).ready(ready);
/**
 * if using turbolinks
 */
