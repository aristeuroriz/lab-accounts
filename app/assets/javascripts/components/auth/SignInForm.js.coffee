@SignInForm = React.createClass

handleInputChange = (ev)->
  nextState = _.cloneDeep(@state)
  nextState[ev.target.name] = ev.target.value
  @setState(nextState)

getInitialState: ->
  return(
    email: ''
    password: '')

_handleSignInClick = (e)->
  $.ajax(
    method: 'POST'
    url: '/users/sign_in.json'
    data:
      user:
        email: @state.email
        password: @state.password
      authenticity_token: getMetaContent('csrf-token')).done((data) ->
    location.reload()
    return
    ).bind(this)

render: ->
  return

