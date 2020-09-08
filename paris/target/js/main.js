/*(function() {
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
          var maxWidth, maxWidthString, minWidth, minWidthString, top, topString;
          if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {

          } else {
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
              maxWidth = Math.floor(Math.random() * 28) + (minWidth = 23);
            } else {
              maxWidth = Math.floor(Math.random() * 40) + (minWidth = 25);
            }
            maxWidthString = maxWidth + '%';
            minWidthString = minWidth + '%';
            if (x % 2 === 0) {
              $(this).css({
                'float': 'right'
              });
              $(this).find('.name').css({
                'bottom': '10%',
                'top': 'auto',
                'left': '0',
                'right': 'auto',
                'transform': 'translateX(-50%)'
              });
            } else {
              $(this).css({
                'float': 'left'
              });
            }
            $(this).css({
              'top': topString,
              'max-width': maxWidthString,
              'min-width': minWidthString
            });
            x = x + 1;
          }
        });
        $('img.lazy').lazyload({
          effect: 'fadeIn',
          effectspeed: 500,
          threshold: 150
        });
      }
    });
  };

  $(document).ready(function() {
    $('#nerd-info-plus').click(function() {
      $('.nerd-info').toggle();
    });
  });

}).call(this);*/

$( document ).ready(function() {
  let elementContainer = $('#header-switch');
  let elements = ['Barrock', 'Rokoko', 'Klassizismus', 'Biedermeier'];
  let counter = 0;
  let intervalHeaderLoop;

  intervalHeader();

  function intervalHeader() {
    intervalHeaderLoop = setInterval(function(){ 
      elementContainer.text(elements[counter]);
      counter = counter + 1;

      if (counter == elements.length) {
        counter = 0;
        clearIntervalHeader();
      }
    }, 1200);
  }

  function clearIntervalHeader() {
    clearInterval(intervalHeaderLoop);
    intervalHeader();
  }
});