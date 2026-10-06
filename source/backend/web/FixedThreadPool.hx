package backend.web;

class FixedThreadPool {
	var _shutdown:Bool = false;
	public function new(threadsCount:Int) {}

	public function run(task:() -> Void):Void {
		haxe.Timer.delay(task, 0);
	}

	public function shutdown():Void {
		_shutdown = true;
	}
}