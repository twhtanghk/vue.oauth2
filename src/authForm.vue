<template>
  <b-modal size='lg' v-model='show' hide-header hide-footer>
    <iframe id='authForm' />
  </b-modal>
</template>

<script lang='coffee'>
Vue = require('vue').default
Vue.use require('bootstrap-vue').default
module.exports =
  props: [
    'eventBus'
    'oauth2'
  ]
  data: ->
    token: null
    error: null
    show: false
    src: null
  methods:
    authUrl: ->
      URL = require 'url'
      {url, client, scope, response_type} = @oauth2
      query = URL.format query:
        client_id: client
        scope: scope
        response_type: response_type
      "#{url}#{query}"
    postParent: ->
      hash = new URLSearchParams location.hash?[1..]
      search = new URLSearchParams location.search?[1..]
      data =
        access_token: hash.get('access_token')
        error: search.get('error')
      if data.access_token? or data.error?
        window.parent.postMessage {type: 'oauth2', data: data}, location.origin
    getToken: ->
      document
        .getElementById 'authForm'
        .src = @authUrl()
      @show = true
    logout: ->
      @token = null
  created: ->
    @eventBus
      .$on 'oauth2.getToken', =>
        @getToken()
      .$on 'oauth2.logout', =>
        @logout()   
    @postParent()
    window.addEventListener 'message', (event) =>
      {type, data} = event.data
      if type == 'oauth2'
        @error = data.error
        @token = data.access_token
        if @error?
          @eventBus.$emit 'oauth2.error', @error
        if @token?
          @eventBus.$emit 'oauth2.token', @token
        @show = false
</script>

<style lang='scss'>
.modal-body {
  padding: 0.3rem;

  iframe {
    height: 90vh;
    width: 100%;
    border: none;
  }
}
</style>
