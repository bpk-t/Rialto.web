import js.koa.Koa;
import js.koa.KoaRouter;
import js.koa.Koa.Context;
import lib.koa_bodyparser.KoaBodyParserRequest;
import lib.koa_router.KoaRouterContext;
import js.Node;
import js.node.Fs;
import js.Promise;

import api.ApiResponse;
import api.GetImageFullApi;
import haxe.Json;

class Main {
	static function main() {
		var serverPort = 8080;
		trace('server start. port=${serverPort}');
		var app = new Koa();
		var router = new KoaRouter();
		var bodyParser = Node.require("koa-bodyparser");
		var seq = new lib.Sequelize("", "", "", { dialect:'sqlite', storage:'C:\\personal\\dev\\repo\\Rialto\\Rialto\\bin\\Debug\\imgdb.db' });

		router.post("/post", function(ctx, next) {
			var req: KoaBodyParserRequest = cast ctx.request;
			trace(req.body);
			ctx.body = "body";
		})
		.get("/image/full/:id", function(ctx:Context, next){
			var ctx2:KoaRouterContext = cast ctx;
			var request = new api.ApiRequest(None, new Map<String, String>(), ["id" => ctx2.params.id]);
			return runApi(new GetImageFullApi(seq), request, ctx);
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
	private static function runApi<T>(apiClient:api.Api<T>, request:api.ApiRequest, ctx:Context):Promise<Void> {
		switch (apiClient.convert(request)) {
			case Some(r):
				return apiClient.run(r).then(function(x:ApiResponse) {
					ctx.body = x.body;
					ctx.type = x.type;
					ctx.status = x.status;
				});
			case None:
				return new Promise(function(resolve:Dynamic->Void, reject) {
					// TODO apiごとのカスタムメッセージ
					var response = {
						"message": "bad param"
					};
					ctx.body = Json.stringify(response);
					ctx.status = 400;
					resolve(null);
				});
		}
	}
}
