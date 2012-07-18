module.exports =

  capability_dictionary:
    type: "dictionary"
    items: {type: "string"}

  account:
    type: "resource"
    media_type: "application/vnd.spire-io.account+json;version=1.0"
    properties:
      url: {type: "string"}
      capabilities: {type: "capability_dictionary"}
      id: {type: "string", readonly: true}
      secret: {type: "string", readonly: true}
      created_at: {type: "number", readonly: true}
      email: {type: "string"}
      name: {type: "string"}
      password: {type: "string"}
    required: ["email", "password"]

  account_collection:
    type: "resource"
    media_type: "application/vnd.spire-io.accounts+json;version=1.0"
    properties:
      url: {type: "string"}

  session:
    type: "resource"
    media_type: "application/vnd.spire-io.session+json;version=1.0"
    properties:
      url: {type: "string"}
      capabilities: {type: "capability_dictionary"}
      resources:
        type: "object"
        properties:
          account: {type: "account"}
          channels: {type: "channel_collection"}
          applications: {type: "object"}
          subscriptions: {type: "subscription_collection"}
          notifications: {type: "object"}
          
  session_collection:
    type: "resource"
    properties:
      url: {type: "string"}



  channel:
    type: "resource"
    media_type: "application/vnd.spire-io.channel+json;version=1.0"
    properties:
      url: {type: "string"}
      capabilities: {type: "capability_dictionary"}
      name: {type: "string"}
      application_key: {type: "string", readonly: true}
      limit: {type: "number"}
    required: ["name"]

  channel_collection:
    type: "resource"
    media_type: "application/vnd.spire-io.channels+json;version=1.0"
    properties:
      url: {type: "string"}
      capabilities: {type: "capability_dictionary"}

  channel_dictionary:
    type: "dictionary"
    media_type: "application/vnd.spire-io.channels+json;version=1.0"
    items: {type: "channel"}

  subscription:
    type: "resource"
    media_type: "application/vnd.spire-io.subscription+json;version=1.0"
    properties:
      url: {type: "string"}
      capabilities: {type: "capability_dictionary"}
      application_key: {type: "string", readonly: true}
      name: {type: "string"}
      channels:
        type: "array"
        items: {"type": "string"}

  subscription_collection:
    type: "resource"
    media_type: "application/vnd.spire-io.subscriptions+json;version=1.0"
    properties:
      url: {type: "string"}
      capabilities: {type: "capability_dictionary"}

  subscription_dictionary:
    type: "dictionary"
    media_type: "application/vnd.spire-io.subscriptions+json;version=1.0"
    items: {type: "subscription"}

  event:
    type: "resource"
    media_type: "application/vnd.spire-io.event+json;version=1.0"
    properties:
      channel_name: {type: "string"}
      content: {type: "object"}
      timestamp: {type: "number"}
      reason: {type: "string"}

  events:
    type: "object"
    media_type: "application/vnd.spire-io.events+json;version=1.0"
    properties:
      first: {type: "number"}
      last: {type: "number"}
      messages: {type: "message_list"}
      joins: {}
      parts: {}

  message:
    type: "resource"
    media_type: "application/vnd.spire-io.message+json;version=1.0"
    properties:
      url: {type: "string"}
      capabilities: {type: "capability_dictionary"}
      channel_name: {type: "string"}
      content: {type: "object"}
      timestamp: {type: "number"}

  message_list:
    type: "array"
    items: {type: "message"}
