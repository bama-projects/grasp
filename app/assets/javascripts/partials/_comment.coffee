class @Comment
  constructor: (el) ->
    @comment   = $ el
    @replyBtn  = @comment.find 'a.reply'
    @replyForm = @comment.find '.add-reply'

    @bindEvents()

  bindEvents: ->
    @replyBtn.click (event) =>
      event.preventDefault()

      @replyForm.toggleClass 'active'
