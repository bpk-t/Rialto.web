package api;

import lib.Sequelize;
import haxe.ds.Option;

class GetImageFullApi implements Api<Request> {
  private var seq:Sequelize;
  public function new(seq:Sequelize){
    this.seq = seq;
  }
  public function run(req: Request):js.Promise<ApiResponse> {
    // TODO DBから値を取得
    // TODO ファイルから読み取り

    seq.query('select * from register_image where id = :id'
            , { replacements: { id: req.imageId } })
       .then(function(result:Dynamic) {
				var str = haxe.Json.stringify(result);
				trace('result = $str');

				var fullPath = "Z:\\rialto\\imgs\\" + result[0][0].file_path;
				//ctx.type = "image/jpg";
				//ctx.body = Fs.createReadStream(fullPath);
			});
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