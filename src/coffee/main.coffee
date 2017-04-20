#main.coffee

@getElements = (input) ->
  x = 0
  $.ajax(
    url: 'php/getElements.php'
    type: 'POST'
    dataType: 'text'
    data:
      input: input
    complete: (r)->
      $('#output-list').html(r.responseText)
      $('.element').each ->

        #if mobile
        if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) )

        else
          #top variation
          if(x == 0)
            top = 0
          else if(input == 'work')
            top = Math.floor(Math.random() * 8) + 2
          else
            top = Math.floor(Math.random() * 20) + 8

          topString = top + 'em'

          #size variation
          if(x == 0)
            maxWidth = 40
          else if(input == 'work')
            maxWidth = Math.floor(Math.random() * 28) + minWidth = 23
          else
            maxWidth = Math.floor(Math.random() * 40) + minWidth = 25
          maxWidthString = maxWidth + '%'
          minWidthString = minWidth + '%'

          if(x % 2 == 0)
            $(this).css({'float': 'right'})
            $(this).find('.name').css({'bottom': '10%','top': 'auto', 'left': '0', 'right': 'auto', 'transform': 'translateX(-50%)'})
          else
            $(this).css({'float': 'left'})
            #$(this).find('.name').css({topOrBottom: '10%'})
          $(this).css({'top': topString, 'max-width': maxWidthString, 'min-width': minWidthString})

          x = x + 1
        return
      $('img.lazy').lazyload effect: 'fadeIn', effectspeed: 900, threshold : 150
      return
    )
  return

$(document).ready ->
  $('#nerd-info-plus').click ->
    $('.nerd-info').toggle()
    return

  return
