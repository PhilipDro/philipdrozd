#main.coffee

@getElements = ->
  x = 0
  $.ajax(
    url: 'php/getElements.php'
    type: 'POST'
    dataType: 'text'
    complete: (r)->
      $('#inspiration-list').html(r.responseText)
      $('.element').each ->
        top = Math.floor(Math.random() * 20) + 8
        topString = top + 'em'

        #offsetRandom = Math.floor(Math.random() * 3) + 1

        maxWidth = Math.floor(Math.random() * 40) + 25
        maxWidthString = maxWidth + '%'

        #if(offsetRandom == 1)
        #  offset = 0
        #else
        #  offset = 0
        #offsetString = offset + 'em'

        x = x + 1
        if(x % 2 == 0)
          $(this).css({'float': 'right'})
        #else if(x % 3 == 0)
        #  $(this).css({'margin': '0 auto', 'display': 'table'})
        else
          $(this).css({'float': 'left'})
        $(this).css({'top': topString, 'max-width': maxWidthString})
        return
      return
    )
  return
