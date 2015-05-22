default['user']['username'] = 'rails'
default['capistrano']['root_path'] = '/var/www/app'
default['capistrano']['username'] = node['user']['username']
default['capistrano']['env'] = {
  asset_host: '',
  secret_token: ''
}
default['delayed_job']['username'] = node['user']['username']
default['delayed_job']['current_path'] = "#{node['capistrano']['root_path']}/current"
default['delayed_job']['rails_env'] = node.chef_environment
default['nginx']['domain'] = 'www.example.com'
default['nginx']['current_path'] = "#{node['capistrano']['root_path']}/current"
default['nginx']['shared_path'] = "#{node['capistrano']['root_path']}/shared_path"
default['nginx']['ssl']['key'] = <<-DATA
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
DATA
default['nginx']['ssl']['crt'] = <<-DATA
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
DATA
default['unicorn']['username'] = node['user']['username']
default['unicorn']['current_path'] = "#{node['capistrano']['root_path']}/current"
default['unicorn']['rails_env'] = node.chef_environment
default['monit']['application'] = 'app'
default['rbenv']['ruby_version'] = '2.2.2'
default['aws']['username'] = node['user']['username']
default['aws']['profiles']['default']['region'] = 'us-east-1'
default['aws']['profiles']['default']['aws_access_key_id'] = 'secret'
default['aws']['profiles']['default']['aws_secret_access_key'] = 'secret'
