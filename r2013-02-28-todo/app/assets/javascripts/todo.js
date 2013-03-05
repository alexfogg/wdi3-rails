$(function(){

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


  //when page loads, take hidden color text and turns it into a visible color box
  add_color_boxes();
  //calls minicolors function sets up form with cool color box
  init_minicolors();

});

//grabs id of of priority where user clicked "+", sends ajax request to change values
function up_priority()
{
  var id = $(this).parent().siblings('.id').text();
  var token = $('input[name=authenticity_token]').val();

//posts data to /priorities/:id/up and gets routed to priorities#up method and increases value
  $.ajax({
    dataType: 'json',
    type: "post",
    url: "/priorities/" + id + "/up",
    data: {authenticity_token:token}
  }).done(process_priority);
  return false;
}

//grabs id of of priority where user clicked "-", sends ajax request to change values
function down_priority()
{
  var id = $(this).parent().siblings('.id').text();
  var token = $('input[name=authenticity_token]').val();

//posts data to /priorities/:id/down and gets routed to priorities#down method and decreases value
  $.ajax({
    dataType: 'json',
    type: "post",
    url: "/priorities/" + id + "/down",
    data: {authenticity_token:token}
  }).done(process_priority);
  return false;
}

//sets up minicolors box on the form
function init_minicolors()
{
  var settings = {
    animationSpeed: 100,
    animationEasing: 'swing',
    change: null,
    changeDelay: 0,
    control: 'hue',
    defaultValue: '',
    hide: null,
    hideSpeed: 100,
    inline: false,
    letterCase: 'lowercase',
    opacity: false,
    position: 'default',
    show: null,
    showSpeed: 100,
    swatchPosition: 'left',
    textfield: false,
    theme: 'default'
};

  $('INPUT.minicolors').minicolors(settings);
}

//shows edit form, grabs information about priority from div and populates the form with it
function edit_priority()
{
  show_edit_form();

  var color = $(this).css('background-color');
  color = rgb2hex(color);
  $('input.minicolors').minicolors('value', color);

  var name = $(this).siblings('.name').text();
  $('#name').val(name);

  var value = $(this).siblings('.value').text();
  $('#value').val(value);

  var priority_id = $(this).siblings('.id').text();
  $('#priority_id').val(priority_id);
}

//makes priority through ajax. grabs form info + sends in ajax request then goes to process priority
function create_priority()
{
  var value = $('#value').val();
  var name = $('#name').val();
  var color = $('input.minicolors').minicolors('value');
  var token = $('input[name=authenticity_token]').val();

  //post to /priorities route, passes along authenticated information about the priority, and goes to priorities#create method in priorities controller
  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/priorities",
      data: {authenticity_token:token, 'priority[color]':color, 'priority[name]':name, 'priority[value]':value}
    }).done(process_priority);

  return false;
}

//updates a priority through ajax. grabs info + sends ajax request to process priority
function update_priority()
{
  var value = $('#value').val();
  var name = $('#name').val();
  var color = $('input.minicolors').minicolors('value');
  var token = $('input[name=authenticity_token]').val();
  var priority_id = $('#priority_id').val();

  //FAKE PUTS to specific /priorities/:id route, passes along authenticated information about the priority, and goes to priorities#update method in priorities controller
  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/priorities/" + priority_id,
      data: {_method:'put', authenticity_token:token, 'priority[color]':color, 'priority[name]':name, 'priority[value]':value}
    }).done(process_priority);

  return false;
}

//adds a priority to the priorities array, refreshes the visible list based on priorities
function process_priority(priority_list)
{
  _.each(priority_list, add_priority_to_array);
  $('ul#priorities').empty();
  _.each(priorities, display_priority);
}

//sets up and makes all visable elements and puts them on the page
function display_priority(priority)
{
  //creates all of the divs that new priority goes into (but does not put them on page yet)
  var li = $('<li>');
  var div1 = $('<div>');
  var div2 = $('<div>');
  var div3 = $('<div>');
  var div4 = $('<div>');
  var div5 = $('<div>');
  var div6 = $('<div>');

  //creates + - image in div 1
  var img1 = $('<img>');
  var img2 = $('<img>');
  img1.addClass('up');
  img1.attr('src', '/assets/famfamfam/icons/add.png')
  img2.addClass('down');
  img2.attr('src', '/assets/famfamfam/icons/delete.png')
  div1.append([img1, img2]);

  //adds classes to the elements
  div1.addClass('priority');
  div2.addClass('priority color');
  div3.addClass('priority name');
  div4.addClass('priority value hide');
  div5.addClass('priority id hide');
  div6.addClass('clear');

  //adds priority information to the divs
  div2.css('background-color', priority.color);
  div3.text(priority.name);
  div4.text(priority.value);
  div5.text(priority.id);

  //adds priority divs to DOM for displaying
  li.append([div1, div2, div3, div4, div5, div6]);
  $('#priorities').append(li);

  hide_form();
}

//kicks out duplicate IDs in array (for edit function), adds current priority to array, sorts priorities by value (descending)
function add_priority_to_array(priority)
{
  priorities = _.reject(priorities, function(p){return p.id == priority.id;});
  priorities.push(priority);
  priorities = _.sortBy(priorities, function(p){ return p.value; }).reverse();
}

// hides form + shows new priority green button
function hide_form()
{
  $('#new_priority').show();
  $('.form').hide();
}


// shows form + hides edit button + shows create button + clears form
function show_new_form()
{
  $('#new_priority').hide();
  $('.form').show();
  $('#create_priority').show();
  $('#update_priority').hide();

  $('#name').val('');
  $('#value').val('')
  $('input.minicolors').minicolors('value', '#ffffff');

  $('#name').focus();
}

//shows the forms and hides the buttons
function show_edit_form()
{
  $('#new_priority').hide();
  $('.form').show();
  $('#create_priority').hide();
  $('#update_priority').show();
  $('#name').focus();
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

function rgb2hex(rgb)
{
 rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
 return "#" +
  ("0" + parseInt(rgb[1],10).toString(16)).slice(-2) +
  ("0" + parseInt(rgb[2],10).toString(16)).slice(-2) +
  ("0" + parseInt(rgb[3],10).toString(16)).slice(-2);
}