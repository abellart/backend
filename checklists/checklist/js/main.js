$(document).ready(function(){
  
  $('.show-btn').on('click', function () {
    $(this).parent().next().toggle().addClass('show');
  });

  $('.checklist_item').on('change', function () {

    item_id = $(this).attr("value");
    
    if($(this).is(':checked')) {
      stat = 1;
    } else {
      stat = 0;
    }

    $.ajax({
      url: 'save.php',
      type: 'post',
      data: {item_id:item_id, stat:stat},
    });

  });

  $('.checklist_sub_item').on('change', function () {

    sub_item_id = $(this).attr("value");
    
    if($(this).is(':checked')) {
      stat = 1;
    } else {
      stat = 0;
    }

    $.ajax({
      url: 'save.php',
      type: 'post',
      data: {sub_item_id:sub_item_id, stat:stat},
    });

  });
});