# Aliyun DNS Authenticator plugin for Certbot

## plugin github
- https://github.com/tengattack/certbot-dns-aliyun.git 

A certbot dns plugin to obtain certificates using aliyun.


## Obtain Aliyun RAM AccessKey
[https://ram.console.aliyun.com/](https://ram.console.aliyun.com/)

And ensure your RAM account has `AliyunDNSFullAccess` permission.


## Install

```bash
pip install certbot-dns-aliyun
```

For Snap:

```bash
sudo snap install certbot-dns-aliyun
sudo snap set certbot trust-plugin-with-root=ok
sudo snap connect certbot:plugin certbot-dns-aliyun
/snap/bin/certbot plugins
```

Or manually:
```bash
git clone https://github.com/tengattack/certbot-dns-aliyun
cd certbot-dns-aliyun
sudo python setup.py install
```

If you are using `certbot-auto`, you should run `virtualenv` first:

```bash
# CentOS 7
virtualenv --no-site-packages --python "python2.7" "/opt/eff.org/certbot/venv"
/opt/eff.org/certbot/venv/bin/python2.7 setup.py install
```

## Credentials File

```ini
certbot_dns_aliyun:dns_aliyun_access_key = 12345678
certbot_dns_aliyun:dns_aliyun_access_key_secret = 1234567890abcdef1234567890abcdef
```

```bash
chmod 600 /path/to/credentials.ini
```


## Obtain Certificates

```bash
certbot certonly -a certbot-dns-aliyun:dns-aliyun \
    --certbot-dns-aliyun:dns-aliyun-credentials /path/to/credentials.ini \
    -d example.com \
    -d "*.example.com"
```

## docker run 
```
docker run -it --rm --name certbot \
            -v "/root/certbot/letsencrypt:/etc/letsencrypt" \
            -v "/root/certbot/lib/letsencrypt:/var/lib/letsencrypt" \
            -v "/root/certbot/alidns.ini:/alidns.ini:ro" \
            chaiyd/certbot:aliyundns certonly \
            -a certbot-dns-aliyun:dns-aliyun \
            --certbot-dns-aliyun:dns-aliyun-credentials /alidns.ini \
            -d "*.vl.xyz"
```

## crontab
```
0 6 * * * docker run -it --rm --name certbot -v "/root/certbot/letsencrypt:/etc/letsencrypt" -v "/root/certbot/alidns.ini:/alidns.ini:ro" chaiyd/certbot:alidns renew
```
