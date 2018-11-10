package lib;

import js.Promise;

@:jsRequire("Sequelize")
extern class Sequelize {
  function new(database:String, username:String, password:String, option:Dynamic);
  function query(sql:String, options:Dynamic):Promise<Dynamic>;

  function define(modelName:String, attributes:Dynamic, options:Dynamic = {}):Dynamic;

  //function STRING(length:Int, binary:Bool):Void;
  //function INTEGER(length:Int):Void;
}