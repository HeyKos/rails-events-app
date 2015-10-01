class com.eventapp.Events
  # Member variables
  # ----------------
  _$tagFilters: null
  _$events: null

  constructor: () ->
    @_initialize()
    @_attachEvents()

  _initialize: () ->
    @_$tagFilters = $('#events > #event-heading #tag-list a.badge')
    @_$events = $('#events #event-list > div')

  _attachEvents: () ->
    @_$tagFilters.on 'click',  $.proxy(@_tagClickHandler, @)

  _tagClickHandler: (e) =>
    e.preventDefault()
    $tag = $(e.target)
    @_$tagFilters.removeClass 'active'
    $tag.addClass 'active'
    @_$events.each( (index) ->
      $this = $(@)
      matchesFilter = false
      $this.find('.event-tags > .badge').each((index) ->
        matchesFilter = true if $(@).text() is $tag.text()
      )
      if matchesFilter
        $this.show()
      else
        $this.hide()
    )
