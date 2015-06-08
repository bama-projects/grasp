class @CodeField
  constructor: (el) ->
    @codeField = $ el
    @menu      = @codeField.find '.options'
    @menuItems = @menu.find 'li'
    @menuBtn   = @menuItems.find 'a'
    @pages     = @codeField.find '.page'

    @bindEvents()

  bindEvents: ->
    @menuBtn.click (event) =>
      event.preventDefault()

      self        = $ event.currentTarget
      menuItem    = self.parent()
      menuHref    = self.attr 'href'
      relatedPage = $ menuHref

      @menuItems.removeClass 'active'
      @pages.    removeClass 'active'

      menuItem.   addClass 'active'
      relatedPage.addClass 'active'

      @updateMarkdown() if self.attr('href') == '#preview'

  updateMarkdown: ->
    @getMarkdown $('textarea.code').val()

  getMarkdown: (source) ->
    $.ajax
      url: @getMarkdownUrl(source)
      type: 'GET'

      success: (data) ->
        $('.preview').html data

  getMarkdownUrl: (source) ->
    "markdown?source=#{encodeURIComponent(source)}"
