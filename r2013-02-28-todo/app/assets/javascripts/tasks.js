function show_new_task_form()
{
  $('#new_task').hide();
  $('.taskform').show();
  $('#create_task').show();
  $('#update_task').hide();

  $('#title').val('');
  $('#description').val('');
  $('#duedate').val('');
  $('#is_complete').val('');
  $('#address').val('');

  $('#title').focus();
}


function hide_task_form()
{
  $('#new_task').show();
  $('.taskform').hide();
}


function create_task()
{
  var title = $('#title').val();
  var description = $('#description').val();
  var duedate = $('#duedate').val();
  var is_complete = $('#is_complete').val();
  var priority_id = $('#priority_id').val();
  var address = $('#address').val();
  var token = $('input[name=authenticity_token]').val();

  //post to /tasks route, passes along authenticated information about the task, and goes to tasks#create method in tasks controller
  $.ajax({
      dataType: 'json',
      type: "POST",
      url: "/tasks",
      data: {authenticity_token:token, 'task[title]':title, 'task[description]':description, 'task[duedate]':duedate, 'task[is_complete]':is_complete, 'task[priority_id]':priority_id, 'task[address]':address}
    }).done(process_task);

  return false;
}

//adds a task to the tasks array, refreshes the visible list based on tasks
function process_task(task_list)
{
  _.each(task_list, display_task);
}

//kicks out duplicate IDs in array (for edit function), adds current task to array, sorts task by **FIX HERE**

//sets up and makes all visable elements and puts them on the page
function display_task(task)
{

  add_marker(task.latitude, task.longtitude, task.title);

  //creates all of the divs that new priority goes into (but does not put them on page yet)
  var tr = $('<tr>');
  var td0 = $('<td>');
  var td1 = $('<td>');
  var td2 = $('<td>');
  var td3 = $('<td>');
  var td4 = $('<td>');
  var td5 = $('<td>');
  var td6 = $('<td>');
  var td7 = $('<td>');

  //adds classes to the elements

  td0.addClass('task');
  td1.addClass('task is_complete');
  td2.addClass('task color')
  td3.addClass('task title');
  td4.addClass('task pn');
  td5.addClass('task description');
  td6.addClass('task duedate');
  td6.addClass('task address');
  td7.addClass('task tid hide');


  //adds task information to the table data
  td0.text();
  td1.text(task.title);
  td2.text(task.description);
  td3.text(task.duedate);
  td4.text(task.is_complete);
  td5.text(task.pn);
  td6.text(task.address);
  td7.text(task.tid);

  //adds task divs to DOM for displaying
  tr.append([td1, td2, td3, td4, td5, td6, td7]);
  $('#tasks').append(tr);

  hide_form();
}

//calls change_text_to_color on the .color class
function add_color_boxes()
{
  $('.color').each(change_text_to_color);
}

//uses .color we wrote in box to make jquery element, changes background color to be that color, removes the color text
function change_text_to_color(index, element)
{
  var box = $(element);
  var color = box.text();

  box.removeClass('hide');
  box.css('background-color', color);
  box.text('');
}

function edit_task()
{
  $(show_task_edit_form);

  var title = $(this).siblings('.title').text();
  $('#title').val(title);

  var description = $(this).siblings('.description').text();
  $('#description').val(description);

  // var title = $(this).siblings('.title').text();
  // $('#title').val(title);

  // var title = $(this).siblings('.title').text();
  // $('#title').val(title);

  // var title = $(this).siblings('.title').text();
  // $('#title').val(title);
}

function show_task_edit_form()
{
  $('#new_task').hide();
  $('.taskform').show();
  $('#create_task').hide();
  $('#update_task').show();
  $('#title').focus();
}

function close_task()
{
  var tr = $(this).parent().parent();
  tr.addClass('strikethrough');
}
