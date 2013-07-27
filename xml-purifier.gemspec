Gem::Specification.new do |s|
  s.name = 'xml-purifier'
  s.version = '0.1.4'
  s.summary = 'xml-purifier'
    s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb'] 
  s.signing_key = '../privatekeys/xml-purifier.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/xml-purifier'
end
