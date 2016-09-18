@SignOutLink = React.createClass(

  _signOut: ->
    $.ajax(
      method: 'DELETE'
      url: '/users/sign_out.json'
      data: authenticity_token: Functions.getMetaContent('csrf-token')).done ->
      location.reload()
      return
    return
)
  render: ->
      React.DOM.a
        href: '#'
        onClick: @_signOut
        'Sign out'
