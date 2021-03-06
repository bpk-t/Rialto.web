package api;

import haxe.ds.Option;

class ApiRequest {
  public var body(default, null):Option<Dynamic>;
  public var queries(default, null):Map<String, String>;
  public var pathParamaters(default, null):Map<String, String>;

  public function new(body:Option<Dynamic>, queries:Map<String, String>, pathParamaters:Map<String, String>) {
    this.body = body;
    this.queries = queries;
    this.pathParamaters = pathParamaters;
  }
}