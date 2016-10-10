module sibwive.index;
import std.json;
import vibe.d;
import vibe.db.mongo.client;
import vibe.db.mongo.mongo;

void index(HTTPServerRequest req, HTTPServerResponse res, JSONValue config_system, JSONValue config_user, MongoCollection collection) {
	res.render!("index.dt", config_system, config_user);
}
