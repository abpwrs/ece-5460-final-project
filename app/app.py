from flask import Flask, jsonify, render_template
from flask_assets import Bundle, Environment 

# init app
app = Flask(__name__)

# flask assets - styling and js
assets = Environment(app)
assets.url = app.static_url_path

scss = Bundle("index.scss", filters="pyscss", output="gen/all.css")
assets.register("scss_all", scss)

js = Bundle('main.js', filters='jsmin', output='gen/packed.js')
assets.register('js_all', js)

# define app routes
@app.route("/")
def index():
    return render_template("index.html")


if __name__ == '__main__':
    # Threaded option to enable multiple instances for multiple user access support
    app.run(threaded=True, port=5000)