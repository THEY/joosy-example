Joosy.namespace 'Comments', ->

  class @NewPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'new'

    # Maps DOM selectors (on the right) to instance variables (on the left)
    elements:
      'rawForm': 'form'

    # Data fetching hook
    @fetch (complete) ->
      @data.post_id = @params.id
      @data.comment = Comment.build()
      complete()

    # Happens just after the page was loaded. Activates form.
    @afterLoad ->
      @form = Joosy.Form.attach @rawForm,
        resource: @data.comment
        success: (data) => @navigate '/'
        error: (errors) =>
          $('.error').remove()
          $('[name="comment[email]"]').after(ApplicationPage.errorfy('Email', errors.email[0])) if errors.email
          $('[name="comment[body]"]').after(ApplicationPage.errorfy('Body', errors.body[0])) if errors.body