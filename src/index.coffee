Forwarded = require('forwarded')

exports.register = (server, options, next) ->
  server.ext 'onRequest', (request, reply) ->
    address = Forwarded(request.raw.req).pop()
    if address.trim() != ''
      request.info.remoteAddress = address

    reply.continue()

  next()

exports.register.attributes = pkg: require('../package.json')
