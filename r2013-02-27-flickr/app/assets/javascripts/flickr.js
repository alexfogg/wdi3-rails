$(function(){

  $('#flickr').click(search_flickr);
  $('#clear').click(clear_photos);
});

var timer;
var index;
var photos;
var search;
var page = 1;
var per_page = 500;


function search_flickr() {
  search = $('#search').val();
  $.getJSON('http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=536fdadd1442f683d1ba542b506bac9a&text=' + search + '&per_page=500&page=' + page + '&format=json&jsoncallback=?', results);

}

function results(data) {
  var sec = parseInt($('#duration').val());
  var msec = sec * 1000;
  index = 0;
  timer = setInterval(display_photo, msec);
  photos = data.photos.photo;
  }

function display_photo(){
  photo = photos[index];
  var width = $('#width').val();
  var height = $('#height').val();
  var url = "url(http://farm"+ photo.farm +".static.flickr.com/"+ photo.server +"/"+ photo.id +"_"+ photo.secret +"_m.jpg)";
  var image = $('<div>');
  image.addClass('image');
  image.css({'width' : width, 'height' : height, 'background-image' : url});
  $('#images').prepend(image);
  index++;
  if (index == per_page)
    {
    page++;
    clearInterval(timer);
    query();
    }
}

function query()
{
  $.getJSON('http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=536fdadd1442f683d1ba542b506bac9a&text=' + search + '&per_page=500&page=' + page + '&format=json&jsoncallback=?', results);
}

function clear_photos()
{
  $('#images').empty();
}