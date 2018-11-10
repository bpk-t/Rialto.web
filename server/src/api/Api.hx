package api;

import haxe.ds.Option;

interface Api<R> {
  function run(req:R):js.Promise<ApiResponse>;
  function convert(source:ApiRequest):Option<R>;
}