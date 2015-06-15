class @Achievements
  constructor: (el) ->
    @achievements    = $ el
    @achievementList = @achievements.find '.list'
    @addBtn          = @achievements.find 'a.add-achievement'

    @bindEvents()

  bindEvents: ->
    @addBtn.click (event) =>
      event.preventDefault()

      @achievementList.append @newEntry()

  newEntry: ->
    newEntry  = "<div class='entry'>"
    newEntry += "<div class='row'><label for='course_achievements_attributes_0_title_achievement_#{@amountOfEntries()}'>Achievement ##{@amountOfEntries()}</label>"
    newEntry += "<input placeholder='Title' name='course[achievements_attributes][#{@index()}][title]' id='course_achievements_attributes_#{@index()}_title' type='text'></div>"
    newEntry += "<div class='row'>"
    newEntry += "<textarea placeholder='Description' name='course[achievements_attributes][#{@index()}][description]' id='course_achievements_attributes_#{@index()}_description'></textarea></div>"
    newEntry += "<div class='row'><label for='course_achievements_attributes_0_points_achievement_#{@amountOfEntries()}'>Points</label>"
    newEntry += "<input placeholder='1' name='course[achievements_attributes][#{@index()}][points]' id='course_achievements_attributes_#{@index()}_points' type='text'></div>"
    newEntry += "</div>"
    newEntry

  index: ->
    @amountOfEntries() - 1

  amountOfEntries: ->
    @achievements.find('.entry').length + 1
