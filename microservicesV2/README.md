In the backend, install nodemon to automatically restart the server on file changes.

Add nodemon as a dev dependency:
    npm install --save-dev nodemon
U
pdate the scripts section in backend/package.json:
"scripts": {
  "start": "node server.js",
  "dev": "nodemon server.js"
}
