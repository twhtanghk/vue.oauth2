<script lang='coffee'>
export default
  install: (Vue, opts) ->
    Vue.component 'authForm', Vue.extend require('./authForm').default
</script>
