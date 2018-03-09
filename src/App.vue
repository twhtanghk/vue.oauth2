<template>
<div>
  <b-navbar>
    <b-button v-if='user.token == null' @click='login()'>login {{error.msg}}</b-button>
    <b-button v-if='user.token != null' @click='logout()'>logout {{user.token}}</b-button>
  </b-navbar>
  <div id='authPopup'/>
</div>
</template>

<script lang='coffee'>
require './app.scss'

Vue = require('vue').default
Vue.use require('bootstrap-vue').default
authForm = Vue.extend require('./authForm').default
eventBus = require('./eventBus').default

module.exports =
  data: ->
    user:
      token: null
    error:
      msg: ''
  methods:
    login: ->
      eventBus.$emit 'login'
    logout: ->
      eventBus.$emit 'logout'
  mounted: ->
    new authForm
      el: '#authPopup'
      propsData: 
        eventBus: eventBus
        user: @user
        error: @error
        oauth2:
          url: 'https://app.ogcio.gov.hk/auth/oauth2/authorize/'
          client: '3TJ1GWZKUgXADslxXcdWQeipIvniayX0C7AKXNjG'
          scope: 'User'
          response_type: 'token'
</script>
