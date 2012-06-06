Joosy.namespace 'Comments', ->

  class @NewPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'new'

    # Maps DOM selectors (on the right) to instance variables (on the left)
    elements:
      'rawForm': 'form'

    # Data fetching hook
    @fetch (complete) ->
      # Passes post to the template
      @data.comment = Comment.build()
      complete()

    # Happens just after the page was loaded. Activates form.
    @afterLoad ->
      @form = Joosy.Form.attach @rawForm,
        resource: @data.comment
        success: (data) => @navigate '/'