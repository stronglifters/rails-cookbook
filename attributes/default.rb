if node.platform_family == "rhel"
  default['stronglifters']['packages'] = %w{
    autoconf
    automake
    bison
    bzip2
    ca-certificates
    gcc-c++
    git
    libffi-devel
    libtool
    libxml2
    libxml2-devel
    libxslt
    libxslt-devel
    make
    openssl-devel
    patch
    readline
    readline-devel
    zlib
    zlib-devel
  }
else
  default['stronglifters']['packages'] = %w{
    build-essential
    curl
    git-core
    libcurl4-openssl-dev
    libffi-dev
    libreadline-dev
    libssl-dev
    libxml2-dev
    libxslt1-dev
    libyaml-dev
    python-software-properties
    zlib1g-dev
  }
end

default['stronglifters']['application_name'] = "app"
default['stronglifters']['aws']['profiles']['default']['region'] = 'us-east-1'
default['stronglifters']['aws']['profiles']['default']['aws_access_key_id'] = 'secret'
default['stronglifters']['aws']['profiles']['default']['aws_secret_access_key'] = 'secret'
default['stronglifters']['root_path'] = "/var/www/#{node['stronglifters']['application_name']}"
default['stronglifters']['current_path'] = "#{node['stronglifters']['root_path']}/current"
default['stronglifters']['nginx']['blacklisted_ips'] = []
default['stronglifters']['nginx']['domain'] = 'www.example.com'
default['stronglifters']['ruby_version'] = '2.2.3'
default['stronglifters']['username'] = 'rails'

default['stronglifters']['env'] = {
  asset_host: '',
  rails_env: 'production',
  secret_token: ''
}

default['stronglifters']['nginx']['ssl']['key'] = <<-SELFSIGNED
-----BEGIN RSA PRIVATE KEY-----
MIICWwIBAAKBgQCbfQuXVpccfpOmBHGfkZVfgfOZpMLGX3XmxFrer20aGM6vG9JR
75QmD28bnDnQPaLGMzCmsg6nhi0Lz+c+u9DdCKRVgZbCK5MJo7FsVRLR9vEdhGkT
QjoBujcKqR7BpWhgJyg2QGp4ytAbh0QixV+tMmx7PC485KIsnCeF9VRjcwIDAQAB
AoGARnbQvfDb4mnqd54j7/CGBRZbUxG7wzKXt9DcbXaKtvzvDaRKGB++v9DWxWhz
Os/z6GZicejXg0vnNict4Nw0toHTEDAfo21c9RHJLK7IOOv1vI8tsMNBQufSkS8l
W/BMg0Y+EgsHG/WBUdC/3TQdm8rQPm2lYam1Raob6JuQAgECQQDHnD8BYewKAPqf
jd/2eo1osLGyd2JyoRudlL9yWLKL975JVtFzdAfs4RSp56fpfS+sRD1WyPZpeigu
XUkVDtpBAkEAx2nrYC1/GYio3kwJ8G3uZK6/JVPICoC+3c1ZKa8+C1WjvTCngZ44
WhzjeOl6g6pcWjtU+uld7x2Klqrfr6/IswJAVSW9aqWOvqW0QyOOCeI1OBdHdc2f
XS6ETTAKiohzgWlo7nfuWMWCK/XHjsKWye7wyxdA4yhOlKfbRAvfBPCVAQJARGOj
AZ0Y1dz0bSiO0BIjjAwSKe8Nz+xPiSn/xjf/g0ufmCazi9SDZwQ5TyJjjfxDJ/7p
KhQWzwbGnN2FUW9r2QJADT7SMkMHb9bOgUJnLehLQY0sONrfAMJ7NieJk24PyX83
bBV1YGbhWentkyZBkgcvYqVlxGTPvIao1x69xSJhOw==
-----END RSA PRIVATE KEY-----
SELFSIGNED
default['stronglifters']['nginx']['ssl']['crt'] = <<-SELFSIGNED
-----BEGIN CERTIFICATE-----
MIIDYzCCAsygAwIBAgIJAKQbJHHxbt63MA0GCSqGSIb3DQEBBQUAMH8xCzAJBgNV
BAYTAkNBMRAwDgYDVQQIEwdBbGJlcnRhMRAwDgYDVQQHEwdDYWxnYXJ5MRYwFAYD
VQQKEw1DYWtlU2lkZSBJbmMuMREwDwYDVQQDEwhDYWtlU2lkZTEhMB8GCSqGSIb3
DQEJARYSYWRtaW5AY2FrZXNpZGUuY29tMB4XDTEzMDUxOTIyMTgwM1oXDTEzMDYx
ODIyMTgwM1owfzELMAkGA1UEBhMCQ0ExEDAOBgNVBAgTB0FsYmVydGExEDAOBgNV
BAcTB0NhbGdhcnkxFjAUBgNVBAoTDUNha2VTaWRlIEluYy4xETAPBgNVBAMTCENh
a2VTaWRlMSEwHwYJKoZIhvcNAQkBFhJhZG1pbkBjYWtlc2lkZS5jb20wgZ8wDQYJ
KoZIhvcNAQEBBQADgY0AMIGJAoGBAJt9C5dWlxx+k6YEcZ+RlV+B85mkwsZfdebE
Wt6vbRoYzq8b0lHvlCYPbxucOdA9osYzMKayDqeGLQvP5z670N0IpFWBlsIrkwmj
sWxVEtH28R2EaRNCOgG6NwqpHsGlaGAnKDZAanjK0BuHRCLFX60ybHs8Ljzkoiyc
J4X1VGNzAgMBAAGjgeYwgeMwHQYDVR0OBBYEFB6G6ZMXcmQz2o1kt1PSOCScSsd1
MIGzBgNVHSMEgaswgaiAFB6G6ZMXcmQz2o1kt1PSOCScSsd1oYGEpIGBMH8xCzAJ
BgNVBAYTAkNBMRAwDgYDVQQIEwdBbGJlcnRhMRAwDgYDVQQHEwdDYWxnYXJ5MRYw
FAYDVQQKEw1DYWtlU2lkZSBJbmMuMREwDwYDVQQDEwhDYWtlU2lkZTEhMB8GCSqG
SIb3DQEJARYSYWRtaW5AY2FrZXNpZGUuY29tggkApBskcfFu3rcwDAYDVR0TBAUw
AwEB/zANBgkqhkiG9w0BAQUFAAOBgQCaoE2mrDADs3IDY/DJ6UVYuyzGUL/1r20w
wF+ITsPDm1nWbGZ8h8tVc6VYdHPyAX95X9/F9h1u2z8E36A5CQ9aTaS6aU1KnNTh
Mthn8jGpgIJeFo2Jphx/QjEVUrLQdPg3pN00uJOTa8Sk4OEWSiqw5P9w0tj0Wicz
60evIdcHAQ==
-----END CERTIFICATE-----
SELFSIGNED
