class @CourseForm
  constructor: (el) ->
    @courseForm = $ el
    @menu      = @courseForm.find '.menu'
    @menuItems = @menu.find 'li'
    @menuBtn   = @menuItems.find 'a'
    @pages     = @courseForm.find '.page'

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
