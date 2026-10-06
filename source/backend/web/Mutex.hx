package backend.web;

class Mutex {
    public function new() {}
    public inline function acquire():Void {}
    public inline function release():Void {}
    public inline function tryAcquire():Bool return true;
}
