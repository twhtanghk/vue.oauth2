<template>
  <div>
    <authForm :eventBus='eventBus' :oauth2='oauth2' />
    <b-navbar>
      <b-button v-if='token == null' @click='getToken()'>login {{error}}</b-button>
      <b-button v-if='token != null' @click='logout()'>logout {{token}}</b-button>
    </b-navbar>
  </div>
</template>

<script lang='coffee'>
Vue = require('vue').default
Vue.use require('bootstrap-vue').default
Vue.use require('./plugin').default
eventBus = require('./eventBus').default

module.exports =
  data: ->
    token: null
    error: null
    eventBus: eventBus
    oauth2:
      url: 'https://app.ogcio.gov.hk/auth/oauth2/authorize/'
      client: '3TJ1GWZKUgXADslxXcdWQeipIvniayX0C7AKXNjG'
      scope: 'User'
      response_type: 'token'
  methods:
    getToken: ->
      @eventBus.$emit 'oauth2.getToken'
    logout: ->
      @token = null
      @eventBus.$emit 'oauth2.logout'
  created: ->
    @eventBus
      .$on 'oauth2.token', (token) =>
        @token = token
        @error = null
      .$on 'oauth2.error', (error) =>
        @token = null
        @error = error
</script>
