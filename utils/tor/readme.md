https://stackoverflow.com/questions/28520028/tor-as-http-proxy-instead-socks

The easiest way is to add HTTPTunnelPort 9080 line in your /etc/tor/torrc file.

After that you'll have localhost:9080 socket open and you can set http_proxy=http://localhost:9080 environment variable to tell applications to use it.
