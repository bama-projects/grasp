class @Lectures
  constructor: (el) ->
    @lectures    = $ el
    @lectureList = @lectures.find '.list'
    @addBtn      = @lectures.find 'a.add-lecture'

    @bindEvents()

  bindEvents: ->
    @addBtn.click (event) =>
      event.preventDefault()

      @lectureList.append @newEntry()

  newEntry: ->
    newEntry  = "<br /><br />"
    newEntry += "<label for='course_lectures_attributes_0_title_lecture_#{@amountOfEntries()}'>Lecture ##{@amountOfEntries()}</label>"
    newEntry += "<input placeholder='Title' name='course[lectures_attributes][#{@index()}][title]' id='course_lectures_attributes_#{@index()}_title' type='text'>"
    newEntry

  index: ->
    @amountOfEntries() - 1

  amountOfEntries: ->
    @lectures.find('label').length + 1
