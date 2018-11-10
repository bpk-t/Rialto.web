package api;

class ApiResponse {
  public var body(default, null):Dynamic;
  public var type(default, null):String;
  public var status(default, null):Int;

  public function new(body:Dynamic, type:String, status:Int) {
    this.body = body;
    this.type = type;
    this.status = status;
  }
}