import vuehx.Vue;
class Main {
	static function main() {
		trace("Hello, world!");

		var vd = new ViewData();
		var vm = new Vue({
			el: "#app",
			data: (function() return vd)
		});
		var logic = new Logic(vd);
		logic.init();
	}
}