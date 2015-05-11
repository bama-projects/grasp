class @Message
  constructor: (el) ->
    message = $ el

    @fadeOut(message)

  fadeOut: (message) ->
    # Fades out message box after 2 seconds
    # Taken from http://stackoverflow.com/a/3488547 | meder | 11th May 2015, 04:11 pm
    setTimeout (->
      message.fadeOut()
    ), 2000
