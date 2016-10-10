module sibwive.article;
import std.json;
import vibe.d;

void article(HTTPServerRequest req, HTTPServerResponse res, JSONValue config_system, JSONValue config_user) {
	res.render!("article.dt", config_system, config_user);
}
