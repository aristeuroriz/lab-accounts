SignUpForm = React.createClass
  _handleInputChange: (ev) ->
    # Get a deep clone of the component's state before the input change.
    nextState = _.cloneDeep(@state)
    #Update the state of the component
    nextState[ev.target.name] = ev.target.value
    # Update the component's state with the new state
    @setState nextState
    return
  getInitialState: ->
    {
      email: ''
      password: ''
      password_confirmation: ''
      name: ''
    }
  _handleRegistrationClick: (e) ->
    $.ajax(
      method: 'POST'
      url: '/users.json'
      data:
        user:
          email: @state.email
          uid: @state.email
          password: @state.password
          password_confirmation: @state.password_confirmation
          name: @state.name
          provider: 'email'
        authenticity_token: Functions.getMetaContent('csrf-token')).done ((data) ->
      location.reload()
      return
    ).bind(this)
    return
  render: ->
  React.DOM.form
   React.DOM.input
    type: 'text'
    name: 'name'
    placeholder: 'name'
    value: @state.name
    onChange: @_handleInputChange
   React.DOM.input
    type: 'email'
    name: 'email'
    placeholder: 'email'
    value: @state.email
    onChange: @._handleInputChange
   React.DOM.input
    type: 'password'
    name: 'password'
    placeholder: 'password'
    value: @state.password
    onChange: @._handleInputChange
   React.DOM.input
    type: 'password'
    name: 'password_confirmation'
    placeholder: 're-type password'
    value: @state.password_confirmation
    onChange: @._handleInputChange
   React.DOM.input
    onClick: @_handleRegistrationClick
    defaultValue: "sign up"


