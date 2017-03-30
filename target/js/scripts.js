(function() {
  this.getElements = function(input) {
    var x;
    x = 0;
    $.ajax({
      url: 'php/getElements.php',
      type: 'POST',
      dataType: 'text',
      data: {
        input: input
      },
      complete: function(r) {
        $('#output-list').html(r.responseText);
        $('.element').each(function() {
          var maxWidth, maxWidthString, top, topString;
          if (x === 0) {
            top = 0;
          } else if (input === 'work') {
            top = Math.floor(Math.random() * 8) + 2;
          } else {
            top = Math.floor(Math.random() * 20) + 8;
          }
          topString = top + 'em';
          if (x === 0) {
            maxWidth = 40;
          } else if (input === 'work') {
            maxWidth = Math.floor(Math.random() * 28) + 20;
          } else {
            maxWidth = Math.floor(Math.random() * 40) + 25;
          }
          maxWidthString = maxWidth + '%';
          if (x % 2 === 0) {
            $(this).css({
              'float': 'right'
            });
          } else {
            $(this).css({
              'float': 'left'
            });
          }
          $(this).css({
            'top': topString,
            'max-width': maxWidthString
          });
          x = x + 1;
        });
      }
    });
  };

  $(document).ready(function() {
    $('#nerd-info-plus').click(function() {
      $('.nerd-info').toggle();
    });
  });

}).call(this);
;
(function() {


}).call(this);
