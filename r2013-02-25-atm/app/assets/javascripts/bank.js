$(function(){

  $('#saveamount').text(saveamount);
  $('#checkamount').text(checkamount);
  $('#withdrawbtnchecking').click(checking_withdraw);
  $('#depositbtnchecking').click(checking_deposit);
  $('#withdrawbtnsavings').click(savings_withdraw);
  $('#depositbtnsavings').click(savings_deposit);


});

var saveamount = 1000;
var checkamount = 1000;


function checking_withdraw()
{
  var checking = parseFloat($('#checking').val());
      if (checking <= checkamount)
      {
        checkamount = checkamount - checking;
        $('#checkamount').text(checkamount);
      }
      else
      {
        if (checking <= checkamount + saveamount)
        {
          checkamount = checkamount - checking;
          saveamount = checkamount + saveamount;
          checkamount = 0;
          $('#checkamount').addClass('red');
          $('#checkamount').text(checkamount);
          $('#saveamount').text(saveamount);
        }
        else
        {
          alert('not enough money!!!');
        }
      }
}

function checking_deposit()
{
  var checking = parseFloat($('#checking').val());
    checkamount = checkamount + checking;
    $('#checkamount').text(checkamount);
}

function savings_withdraw()
{
  var savings = parseFloat($('#savings').val());
    saveamount = saveamount - savings;
    $('#saveamount').text(saveamount);
}

function savings_deposit()
{
  var savings = parseFloat($('#savings').val());
    saveamount = saveamount + savings;
    $('#saveamount').text(saveamount);
}