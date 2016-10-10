module sibwive.index;
import std.json;
import vibe.d;

void index(HTTPServerRequest req, HTTPServerResponse res, JSONValue config_system, JSONValue config_user) {
	res.render!("index.dt", config_system, config_user);
}
