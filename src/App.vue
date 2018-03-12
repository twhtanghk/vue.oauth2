<template>
  <div>
    <authForm :eventBus='eventBus' :user='user' :error='error' :oauth2='oauth2' />
    <b-navbar>
      <b-button v-if='user.token == null' @click='login()'>login {{error.msg}}</b-button>
      <b-button v-if='user.token != null' @click='logout()'>logout {{user.token}}</b-button>
    </b-navbar>
</div>
</template>

<script lang='coffee'>
require './app.scss'

Vue = require('vue').default
Vue.use require('bootstrap-vue').default
Vue.use require('./plugin').default
eventBus = require('./eventBus').default

module.exports =
  data: ->
    eventBus: eventBus
    user:
      token: null
    error:
      msg: ''
    oauth2:
      url: 'https://app.ogcio.gov.hk/auth/oauth2/authorize/'
      client: '3TJ1GWZKUgXADslxXcdWQeipIvniayX0C7AKXNjG'
      scope: 'User'
      response_type: 'token'
  methods:
    login: ->
      eventBus.$emit 'login'
    logout: ->
      eventBus.$emit 'logout'
</script>
