package api;

import js.node.Fs;
import lib.Sequelize;
import haxe.ds.Option;

class GetImageFullApi implements Api<Request> {
  private var seq:Sequelize;
  public function new(seq:Sequelize){
    this.seq = seq;
  }
  public function run(req: Request):js.Promise<ApiResponse> {
    return seq.query('select * from register_image where id = :id'
            , { replacements: { id: req.imageId } })
       .then(function(result:Dynamic) {
				var str = haxe.Json.stringify(result);
				trace('result = $str');

        // TODO path
				var fullPath = "Z:\\rialto\\imgs\\" + result[0][0].file_path;
        return new ApiResponse(Fs.createReadStream(fullPath), getType(), 200);
			});
  }
  public function convert(source:ApiRequest):Option<Request> {
    var id = source.pathParamaters.get("id");
    if (id == null) {
      return None;
    } else {
      return Some(new Request(Std.parseInt(id));
    }
  }
  private function getType():String {
    // TODO 
    return "image/jpg";
  }
}

class Request {
  public var imageId(default, null):Int;
  public function new(imageId:Int) {
    this.imageId = imageId;
  }
}