package api;

import haxe.ds.Option;

class GetImageFullApi implements Api<Request> {
  public function new(){
    // TODO storage
  }
  public function run(req: Request):js.Promise<ApiResponse> {
    // TODO DBから値を取得
    // TODO ファイルから読み取り
    return null;
  }
  public function convert(source:ApiRequest):Option<Request> {
    return null;
  }
}

class Request {
  public var imageId(default, null):Int;
  public function new(imageId:Int) {
    this.imageId = imageId;
  }
}