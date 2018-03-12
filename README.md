# vue.oauth2
Vue component with bootstrap modal popup to get oauth2 token by Implicit Grant

## Usage
```
props:
  eventBus: Vue component acting as event bus for listening event 'login', 'logout'. OAuth2 component with iframe popup to seek user authorization grant for client access if event 'login' emitted. Clear user.token if event 'logout' emitted.
  user:
    token: token acquired via oauth2 server
  error:
    msg: error message replied by oauth2 server
  oauth2:
    url: authorization url
    client: oauth2 client id
    scope: oauth2 scope requested by the client
    response_type: 'token'
```

## Example
[Demo](https://rawgit.com/twhtanghk/vue.oauth2/master/dist/index.html)
