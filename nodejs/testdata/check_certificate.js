const https = require('https')
const options = {
  hostname: 'www.google.com',
  port: 443,
  path: '/',
  method: 'GET'
}

const req = https.request(options, res => {
  console.log(`statusCode: ${res.statusCode}`)
})

req.end()
