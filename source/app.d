import vibe.d;
import std.json;
import std.string;
import std.file;
import sibwive.index;
import sibwive.article;

JSONValue config_system;
JSONValue config_user;

shared static this() {
	config_system = parseJSON(chomp(readText("config/system.json")));
	config_user = parseJSON(chomp(readText("config/user.json")));

	//Connection to MongoDB
	auto client = connectMongoDB(config_system["dbAddress"].str());
	auto collection = client.getCollection(config_system["dbCollection"].str());

	auto router = new URLRouter;
	router.get("/", (HTTPServerRequest req, HTTPServerResponse res){index(req,res,config_system,config_user,collection);});
	router.get("/article/", (HTTPServerRequest req, HTTPServerResponse res){article(req,res,config_system,config_user,collection);});

	auto settings = new HTTPServerSettings;
	settings.port = 8080;

	listenHTTP(settings, router);
}
