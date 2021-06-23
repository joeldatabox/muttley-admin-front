const PROXY_CONFIG = [
  {
    context: [
      "/api"
    ],
    "target": "http://localhost:9242",
    "secure": false,
    "logLevel": "debug"
  }
];

module.exports = PROXY_CONFIG;
