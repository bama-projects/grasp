class @BoardForm
  constructor: (el) ->
    @boardForm = $ el
    @menu      = @boardForm.find '.menu'
    @menuItems = @menu.find 'li'
    @menuBtn   = @menuItems.find 'a'
    @pages     = @boardForm.find '.page'

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
