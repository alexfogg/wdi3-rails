$(function(){

  // $('#age').blur(blur_func);
  // $('#age').change(change_func);
  $('#age').change(validate_age);
  $('body').keypress(shortcut);
});

function shortcut(data)
{
  var text = $('#text').text();
  $('#text').text(text + String.fromCharCode(data.which));

  switch(String.fromCharCode(data.which))
  {
    case 'g':
      $('#text').css('color', 'green');
      break;
    case 'b':
      $('#text').css('color', 'blue');
      break;
    case 'y':
      $('#text').css('color', 'yellow');
      break;
    case 'r':
      $('#text').css('color', 'red');
      break;
    case 'p':
      $('#text').css('color', 'purple');
      break;
  }
}

function colorize(eventdata)
{
  $('#x').text(eventdata.clientX);
  $('#y').text(eventdata.clientY);

  var red = (eventdata.clientX * eventdata.clientY) % 256
  var green = (eventdata.clientX * eventdata.clientY * 2) % 256
  var blue = (eventdata.clientX * eventdata.clientY * 3) % 256

  $('body').css('background-color', 'rgb('+red+', '+green+', '+blue+')');



  if ((eventdata.clientX % 2) == 0)
    {
      $('#x').css('color', 'green');
    }
  else
    {
      $('#x').css('color', 'red');
    }
  if ((eventdata.clientY % 2) == 0)
    {
      $('#y').css('color', 'green');
    }
  else
    {
      $('#y').css('color', 'red');
    }
}

function validate_age()
{
  $('body').children('p').remove();
  var p = $('<p>');
  $('body').prepend(p);
  var age = parseInt($('#age').val());
  p.text(age);
  if(age > 17)
    {
      p.addClass('green');
    }
    else
    {
      p.addClass('red');
    }
}