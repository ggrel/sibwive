module sibwive.article;
import std.json;
import vibe.d;
import vibe.db.mongo.client;
import vibe.db.mongo.collection;
import vibe.db.mongo.mongo;

void article(HTTPServerRequest req, HTTPServerResponse res, JSONValue config_system, JSONValue config_user, MongoCollection collection) {
    //auto article = collection.find();
    res.render!("article.dt", config_system, config_user, article);
}
