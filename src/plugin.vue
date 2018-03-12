<script lang='coffee'>
module.exports =
  install: (Vue, opts) ->
    Vue.component 'authForm', Vue.extend require('./authForm').default
</script>
