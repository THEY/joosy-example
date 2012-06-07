Joosy.namespace 'Posts', ->

  # Page that shows the single post entry
  class @ShowPage extends ApplicationPage
    # Deterimes which Layout to wrap this page in
    @layout ApplicationLayout
    # Determines which template at `templates/pages/posts` folder to use
    @view   'show'

    # Data fetching hook
    @fetch (complete) ->
      Post.find @params.id, (post) =>
        # Passes post to the template
        @data.post = post
        @data.comments = post('comments')
        complete()

    elements:
      'deleteIcon':    '.delete'

    events:
      'click $deleteIcon':     'deleteComment'

    deleteComment: (element, event) ->
      Comment.find $(element).attr('data-id'), (comment) ->
        comment.delete ->
          console.log 'Delete!'