class @CodeField
  constructor: (el) ->
    @codeField = $ el
    @menu      = @codeField.find '.options'
    @menuItems = @menu.find 'li'
    @menuBtn   = @menuItems.find 'a'
    @pages     = @codeField.find '.page'

    @sourcePage  = @codeField.find 'textarea.code'
    @previewPage = @codeField.find '.preview'

    @bindEvents()

  bindEvents: ->
    @menuBtn.click (event) =>
      event.preventDefault()

      self        = $ event.currentTarget
      menuItem    = self.parent()
      menuHref    = self.attr 'href'
      relatedPage = menuItem.parent().parent().parent().find menuHref

      @menuItems.removeClass 'active'
      @pages.    removeClass 'active'

      menuItem.   addClass 'active'
      relatedPage.addClass 'active'

      @updateMarkdown() if self.attr('href') == '#preview'

  updateMarkdown: ->
    @previewPage.html @getMarkdown(@sourcePage.val())

  getMarkdown: (source) ->
    markdown.toHTML source
