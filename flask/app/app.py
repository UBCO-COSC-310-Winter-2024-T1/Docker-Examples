from flask import Flask, send_file

app = Flask(__name__)

@app.route('/')
def hello():
	return "Hello World!"

@app.route('/test.html')
def test():
	return send_file('test.html')


if __name__ == '__main__':
	app.run(host='0.0.0.0', port=8000)