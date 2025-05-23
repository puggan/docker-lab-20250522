import jwt
import requests
import sys
from flask import Flask, request, Response
from functools import wraps
app = Flask(__name__)


with open('./jwt-public.key', 'rb') as f:
    public_key = f.read()

# Decorator to verify JWT token
def jwtAuth(endpoint):
    @wraps(endpoint)
    def decorator(*args, **kwargs):
        token = request.headers.get('Authorization')
        if not token:
            return Response("Invalid token", status=403, content_type='text/plain')
        try:
            token = token.split(" ")[1]

            decoded_token = jwt.decode(token, public_key, algorithms=['RS256'])  # Use public key for verification
        except jwt.ExpiredSignatureError:
            return Response("Invalid token", status=403, content_type='text/plain')
        except jwt.InvalidTokenError:
            return Response("Invalid token", status=403, content_type='text/plain')

        request.current_user = decoded_token['username']
        kwargs['token'] = decoded_token
        return endpoint(*args, **kwargs)

    return decorator


@app.route('/', methods=['GET'])
def welcome():
    return Response("<h1>Welcome</h1><p>endpoints: /auth, /expired, /joke, /quote</p>", status=200, content_type="text/html")

@app.route('/auth', methods=['GET'])
def proxyAuthGet():
    response = requests.get('http://auth:8080/login')
    return Response(response.content, status=response.status_code, content_type=response.headers['Content-Type'])

@app.route('/auth', methods=['POST'])
def proxyAuthPost():
    data = request.get_data()
    response = requests.post('http://auth:8080/login', data=data)
    return Response(response.content, status=response.status_code, content_type=response.headers['Content-Type'])

@app.route('/expired', methods=['GET'])
def proxyExpiredGet():
    response = requests.get('http://auth:8080/expired')
    return Response(response.content, status=response.status_code, content_type=response.headers['Content-Type'])

@app.route('/expired', methods=['POST'])
def proxyExpiredPost():
    data = request.get_data()
    response = requests.post('http://auth:8080/expired', data=data)
    return Response(response.content, status=response.status_code, content_type=response.headers['Content-Type'])


@app.route('/joke', methods=['GET', 'POST'])
@jwtAuth
def joke():
    response = requests.get('http://jokebox:8080')
    return Response(response.content, status=response.status_code, content_type=response.headers['Content-Type'])

@app.route('/quote', methods=['GET', 'POST'])
@jwtAuth
def quote():
    response = requests.get('http://quotebox:8080')
    return Response(response.content, status=response.status_code, content_type=response.headers['Content-Type'])

if __name__ == '__main__':
    port = 8080
    if len(sys.argv) > 1:
        port = int(sys.argv[1])  # Try to parse the port from argv
    app.run(debug=True, port=port)
