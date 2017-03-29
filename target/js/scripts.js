(function() {
  this.getElements = function() {
    var x;
    x = 0;
    $.ajax({
      url: 'php/getElements.php',
      type: 'POST',
      dataType: 'text',
      complete: function(r) {
        $('#inspiration-list').html(r.responseText);
        $('.element').each(function() {
          var maxWidth, maxWidthString, top, topString;
          top = Math.floor(Math.random() * 20) + 8;
          topString = top + 'em';
          maxWidth = Math.floor(Math.random() * 40) + 25;
          maxWidthString = maxWidth + '%';
          x = x + 1;
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
        });
      }
    });
  };

}).call(this);
;
(function() {


}).call(this);
