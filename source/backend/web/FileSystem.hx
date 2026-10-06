package backend.web;

import openfl.utils.Assets;

using StringTools;

class FileSystem {
	static var ids:Array<String> = null;
	static var dirs:Map<String, Bool> = [];

	public static function norm(p:String):String {
		if (p == null) return "";
		p = p.split("\\").join("/");
		while (p.startsWith("./")) p = p.substr(2);
		while (p.length > 0 && p.endsWith("/")) p = p.substr(0, p.length - 1);
		return p;
	}

	static function allIds():Array<String> {
		if (ids == null) ids = Assets.list();
		return ids;
	}

	public static function isDirectory(path:String):Bool {
		var p = norm(path);
		if (p == "") return true;
		if (dirs.exists(p)) return true;
		var prefix = p + "/";
		for (id in allIds()) if (id.startsWith(prefix)) return true;
		for (k in File.memory.keys()) if (k.startsWith(prefix)) return true;
		return false;
	}

	public static function exists(path:String):Bool {
		var p = norm(path);
		if (File.memory.exists(p)) return true;
		if (Assets.exists(p)) return true;
		return isDirectory(p);
	}

	public static function readDirectory(path:String):Array<String> {
		var p = norm(path);
		var prefix = (p == "") ? "" : p + "/";
		var out:Array<String> = [];
		var seen:Map<String, Bool> = [];
		function add(id:String) {
			if (!id.startsWith(prefix)) return;
			var rest = id.substr(prefix.length);
			var i = rest.indexOf("/");
			var name = (i < 0) ? rest : rest.substr(0, i);
			if (name != "" && !seen.exists(name)) {
				seen.set(name, true);
				out.push(name);
			}
		}
		for (id in allIds()) add(id);
		for (k in File.memory.keys()) add(k);
		return out;
	}

	public static function createDirectory(path:String):Void {
		dirs.set(norm(path), true);
	}

	public static function deleteFile(path:String):Void {
		File.memory.remove(norm(path));
	}

	public static function deleteDirectory(path:String):Void {
		dirs.remove(norm(path));
	}

	public static function fullPath(path:String):String return norm(path);
	public static function absolutePath(path:String):String return norm(path);
}