from http.server import HTTPServer, BaseHTTPRequestHandler

class MyHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()

        self.wfile.write(
            b"Production Docker Project is Running!"
        )

server = HTTPServer(("0.0.0.0", 8000), MyHandler)

print("Application running on port 8000", flush=True)

server.serve_forever()