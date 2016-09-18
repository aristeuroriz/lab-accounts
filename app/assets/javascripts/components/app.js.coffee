@App = React.createClass
  componentWillMount: ->
    $.ajax(
      method: 'GET'
      url: '/auth/is_signed_in.json').done ((data) ->
      @setState signedIn: data.signed_in
      return
    ).bind(this)
    return
  getInitialState: ->
    { signedIn: null }
  render: ->
    React.DOM.RouteHandler
      signedIn: @state.signedIn