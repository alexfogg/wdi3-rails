$(function(){

/////****PRIORITIES****\\\\\\\\\\

  //shows form and hides button when user clicks new priority
  $('#new_priority').click(show_new_form);
  //hides form when user clicks cancel button
  $('#cancel_priority').click(hide_form);

  //shows edit form when you click on a priority color, prepopulates form with current priority info
  $('#priorities').on('click', '.color', edit_priority);

  //creates a new priority from form information when someone clicks new priority
  $('#create_priority').click(create_priority);
  //updates a priority from the edit form when someone clicks edit priority
  $('#update_priority').click(update_priority);

  //moves prioity up the list when a user clicks the up arrow
  $('#priorities').on('click', '.up', up_priority);
  $('#priorities').on('click', '.down', down_priority);



/////TASKS

  //shows task form and hides button when user clicks new task
  $('#new_task').click(show_new_task_form);
  //hides task form when user clicks cancel button
  $('#cancel_task').click(hide_task_form);

  //creates new task from form information when someones clicks new task
  $('#create_task').click(create_task);
  //updates a task from the edit form when someone clicks edit task
  $('#edit_task').click(edit_task);

  $('input#is_complete').click(close_task);


//ETC

  //when page loads, take hidden color text and turns it into a visible color box
  add_color_boxes();
  //calls minicolors function sets up form with cool color box
  init_minicolors();

});

var map;