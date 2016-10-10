import vibe.d;
import std.json;
import std.string;
import std.file;
import sibwive.index;

shared static this() {
	JSONValue config_system = parseJSON(chomp(readText("config/system.json")));
	JSONValue config_user = parseJSON(chomp(readText("config/user.json")));

	auto router = new URLRouter;
	router.get("/", (res,req){index(req,res,config_system,config_user);});

	auto settings = new HTTPServerSettings;
	settings.port = 8080;

	listenHTTP(settings, router);
}
