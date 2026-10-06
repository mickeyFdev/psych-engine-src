package backend.web;

import openfl.utils.Assets;

class File {
	public static var memory:Map<String, String> = [];

	public static function getContent(path:String):String {
		var p = FileSystem.norm(path);
		if (memory.exists(p)) return memory.get(p);
		var s:String = Assets.getText(p);
		if (s == null) throw 'File not found: $path';
		return s;
	}

	public static function saveContent(path:String, content:String):Void {
		memory.set(FileSystem.norm(path), content);
	}
}