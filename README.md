# vue.oauth2
Vue component with bootstrap modal popup to get oauth2 token by Implicit Grant

## Usage
```
props:
  eventBus: 
    Vue component acting as event bus for handling events below
    'oauth2.getToken': show modal popup to seek user authorization grant for client acess
    'oauth2.logout': clear token acquired earlier
    'oauth2.token': return authenticated token value 
    'oauth2.error': return error for oauth2 authentication
  oauth2:
    url: authorization url
    client: oauth2 client id
    scope: oauth2 scope requested by the client
    response_type: 'token'
```

## Example
[Demo](https://rawgit.com/twhtanghk/vue.oauth2/master/dist/index.html)
