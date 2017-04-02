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
          maxWidth = Math.floor(Math.random() * 28) + 23
        else
          maxWidth = Math.floor(Math.random() * 40) + 25
        maxWidthString = maxWidth + '%'


        if(x % 2 == 0)
          $(this).css({'float': 'right'})
          $(this).find('.name').css({'bottom': '10%','top': 'auto', 'left': '0', 'right': 'auto', 'transform': 'translateX(-50%)'})
        else
          $(this).css({'float': 'left'})
          #$(this).find('.name').css({topOrBottom: '10%'})
        $(this).css({'top': topString, 'max-width': maxWidthString})


        x = x + 1
        return
      return
    )
  return

$(document).ready ->
  $('#nerd-info-plus').click ->
    $('.nerd-info').toggle()
    return
  return
