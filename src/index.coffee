Forwarded = require('forwarded')

exports.plugin = {
  register: (server, options) ->
    server.ext 'onRequest', (request, h) ->
      address = Forwarded(request.raw.req).pop()
      if address.trim() != ''
        request.info.remoteAddress = address

      h.continue
  ,
  pkg: require('../package.json'),
  name: 'hapi-forward'
}
