// Generated by CoffeeScript 1.3.3
var Dispatcher, Documenter, Service;

Dispatcher = require("./service/simple_dispatcher");

Documenter = require("./service/documenter");

Service = (function() {

  function Service(options) {
    this.schema = options.schema;
    this["interface"] = options["interface"];
    this.map = options.map;
    this.documenter = new Documenter(this.schema, this["interface"]);
  }

  Service.prototype.simple_dispatcher = function(handlers) {
    var dispatcher;
    dispatcher = new Dispatcher(this, handlers);
    return dispatcher.create_handler();
  };

  Service.prototype.documentation = function() {
    return "" + (this.documenter.document_interface()) + "\n\n" + (this.documenter.document_schema());
  };

  return Service;

})();

module.exports = Service;