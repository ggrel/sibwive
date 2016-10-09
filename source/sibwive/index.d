module sibwive.index;
import vibe.d;

void index(HTTPServerRequest req, HTTPServerResponse res) {
	res.render!("index.dt", req);
}
