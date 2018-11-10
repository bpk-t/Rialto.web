import js.koa.Koa;
import js.koa.KoaRouter;
import js.koa.Koa.Context;
import lib.koa_bodyparser.KoaBodyParserRequest;
import lib.koa_router.KoaRouterContext;
import js.Node;
import js.node.Fs;

class Main {
	static function main() {
		var serverPort = 8080;
		trace('server start. port=${serverPort}');
		var app = new Koa();
		var router = new KoaRouter();
		var bodyParser = Node.require("koa-bodyparser");

		router.get('/', function (ctx: Context, next) {
			var path = "C:\\personal\\dev\\repo\\Rialto.web\\server\\build\\img.jpg";
			trace('exists=${Fs.existsSync(path)}');
			ctx.type = "image/jpg";
			ctx.body = Fs.createReadStream(path);
		})
		.post("/post", function(ctx, next) {
			var req: KoaBodyParserRequest = cast ctx.request;
			trace(req.body);
			ctx.body = "body";
		})
		.get("/image/full/:id", function(ctx:Context, next){
			var ctx2:KoaRouterContext = cast ctx;
			var seq = new lib.Sequelize("", "", "", { dialect:'sqlite', storage:'C:\\personal\\dev\\repo\\Rialto\\Rialto\\bin\\Debug\\imgdb.db' });

			return seq.query('select * from register_image where id = :id', { replacements: { id: ctx2.params.id } }).then(function(result:Dynamic) {
				var str = haxe.Json.stringify(result);
				trace('result = $str');

				var fullPath = "Z:\\rialto\\imgs\\" + result[0][0].file_path;
				ctx.type = "image/jpg";
				ctx.body = Fs.createReadStream(fullPath);
			});
		})
		.get("/image/thumbnail/:id", function(ctx:Context, next){

		})
		.get("/image/info/:id", function(ctx:Context, next){
		})
		.get("/image/tags/:image-id", function(ctx:Context, next){
		})
		.post("/image/tags/:image-id", function(ctx:Context, next){
		})
		.delete("/image/tags/:image-id", function(ctx:Context, next){
		})
		.post("/search", function(ctx:Context, next){
		})
		.get("/tags", function(ctx:Context, next){
		})
		.get("/tags/:id", function(ctx:Context, next){
		})
		.post("/tags", function(ctx:Context, next){
		})
		.put("/tags/:id", function(ctx:Context, next){
		})
		.delete("/tags/:id", function(ctx:Context, next){
		});

		app.use(bodyParser());
		app.use(router.routes());
		app.use(router.allowedMethods());
		app.listen(serverPort);
	}
}

class RegisterImage {

	public var id:Int;
	public var file_size:Int;
	public var file_name:String;
	public var file_extension:String;
	public var file_path:String;
	public var md5_hash:String;
	public var ave_hash:String;
	public var image_repository_id:Int;
	public var height_pix:Int;
	public var width_pix:Int;
	public var do_get:Int;
	public var delete_timestamp:String;
	public var created_at:String;
	public var updated_at:String;

	public function new(){}
}