# CrowdSec

CrowdSec - the open-source and participative security solution offering crowdsourced protection against malicious IPs and access to the most advanced real-world CTI

CrowdSec is a free, modern & collaborative behavior detection engine, coupled with a global IP reputation network. It stacks on fail2ban's philosophy but is IPV6 compatible and 60x faster (Go vs Python), it uses Grok patterns to parse logs and YAML scenarios to identify behaviors. CrowdSec is engineered for modern Cloud / Containers / VM-based infrastructures (by decoupling detection and remediation). Once detected you can remedy threats with various bouncers (firewall block, nginx http 403, Captchas, etc.) while the aggressive IP can be sent to CrowdSec for curation before being shared among all users to further improve everyone's security. See FAQ or read below for more.

## Links

<https://www.crowdsec.net/>

<https://github.com/crowdsecurity/crowdsec>

<https://hub.docker.com/r/crowdsecurity/crowdsec>

## Configuration

### Bouncer API Key

The app stack contains the crowdsec service and a bouncer. The bouncer needs an API Key to connect to the service.
Since the API Key needs to be generated after the initial start, you must provide a temporary dummy Bouncer API Key for the stack to run.

After you started the app, head to a console and use

```bash
docker exec -t crowdsec cscli bouncers add crowdsec-bouncer-traefik
```

```bash
# docker exec -t crowdsec cscli bouncers add crowdsec-bouncer-traefik
API key for 'crowdsec-bouncer-traefik':

   djC0YxRO3xzKG1mctemSzaUfs2yj4vG7cQ7fliTOJR0

Please keep this key since you will not be able to retrieve it!
```

To get the Bouncer API Key, use this Key in the settings of the app instead of the dummy Bouncer API Key and restart the app.

### Integrate in crowdsec Console

<https://app.crowdsec.net/security-engines>

With the key from the command line in the section `Enroll your CrowdSec Security Engine`execute:

```bash
docker exec crowdsec cscli console enroll {{ KEY }}
```

### Traefik Integration

- traefik.yml

  ```yml
  entryPoints:
    websecure:
        middlewares:
          - forwardauth-crowdsec-bouncer@file
  ```

- dynamic.yml

  ```yml
  http:
    middlewares:
      forwardauth-crowdsec-bouncer:
        forwardauth:
          address: http://crowdsec-bouncer-traefik:8080/api/v1/forwardAuth
          trustForwardHeader: true
  ```

restart runtipi to apply the settings.

### Dashboard

The dashboard comes with a pre configured user:

Email address: `crowdsec@crowdsec.net`

Password: `!!Cr0wdS3c_M3t4b4s3??`

## cscli

### list collections

```bash
8ee1637a8c9e:/# cscli collections list

COLLECTIONS
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Name                                 📦 Status    Version  Local Path                                           
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 crowdsecurity/base-http-scenarios    ✔️  enabled  1.0      /etc/crowdsec/collections/base-http-scenarios.yaml   
 crowdsecurity/http-cve               ✔️  enabled  2.9      /etc/crowdsec/collections/http-cve.yaml              
 crowdsecurity/iptables               ✔️  enabled  0.2      /etc/crowdsec/collections/iptables.yaml              
 crowdsecurity/linux                  ✔️  enabled  0.2      /etc/crowdsec/collections/linux.yaml                 
 crowdsecurity/sshd                   ✔️  enabled  0.5      /etc/crowdsec/collections/sshd.yaml                  
 crowdsecurity/traefik                ✔️  enabled  0.1      /etc/crowdsec/collections/traefik.yaml               
 crowdsecurity/whitelist-good-actors  ✔️  enabled  0.1      /etc/crowdsec/collections/whitelist-good-actors.yaml 
 firix/authentik                      ✔️  enabled  0.1      /etc/crowdsec/collections/authentik.yaml             
─────────────────────────────────────────────────────────────────────────────────────────────────────
```

### list decisions

```bash
8ee1637a8c9e:/# cscli decisions list
No active decisions
```

### list alerts

```bash
8ee1637a8c9e:/# cscli alerts list
╭───────┬────────────────────┬───────────────────────────────────────────┬─────────┬────────────────────────────┬───────────┬─────────────────────────────────────────╮
│   ID  │        value       │                   reason                  │ country │             as             │ decisions │                created_at               │
├───────┼────────────────────┼───────────────────────────────────────────┼─────────┼────────────────────────────┼───────────┼─────────────────────────────────────────┤
│ 10494 │ Ip:179.43.189.138  │ crowdsecurity/http-path-traversal-probing │ CH      │ 51852 Private Layer INC    │ ban:1     │ 2024-12-11 09:43:28. +0000 UTC │
│ 10493 │ Ip:179.43.189.138  │ crowdsecurity/http-probing                │ CH      │ 51852 Private Layer INC    │ ban:1     │ 2024-12-11 09:41:33.375201441 +0000 UTC │
...
│ 10456 │ Ip:139.59.132.8    │ crowdsecurity/jira_cve-2021-26086         │ DE      │ 14061 DIGITALOCEAN-ASN     │ ban:1     │ 2024-12-10 15:51:27.695338887 +0000 UTC │
╰───────┴────────────────────┴───────────────────────────────────────────┴─────────┴────────────────────────────┴───────────┴─────────────────────────────────────────╯
```

### inspect alert

```bash
8ee1637a8c9e:/# cscli alerts inspect -d 10494

################################################################################################

 - ID           : 10494
 - Date         : 2024-12-11T09:43:51Z
 - Machine      : localhost
 - Simulation   : false
 - Remediation  : true
 - Reason       : crowdsecurity/http-path-traversal-probing
 - Events Count : 6
 - Scope:Value  : Ip:179.43.189.138
 - Country      : CH
 - AS           : Private Layer INC
 - Begin        : 2024-12-11 09:43:28.194360075 +0000 UTC
 - End          : 2024-12-11 09:43:50.60592302 +0000 UTC
 - UUID         : e8011352-4316-47f7-9138-716546cd2c8c


 - Context  :
╭────────────┬───────────────────────╮
│     Key    │         Value         │
├────────────┼───────────────────────┤
│ method     │ GET                   │
│ status     │ 404                   │
│ target_uri │ /img../.git/config    │
│ target_uri │ /js../.git/config     │
│ target_uri │ /media../.git/config  │
│ target_uri │ /static../.git/config │
│ user_agent │ -                     │
╰────────────┴───────────────────────╯

 - Events  :

- Date: 2024-12-11 09:43:50 +0000 UTC
╭─────────────────────┬─────────────────────────────╮
│         Key         │            Value            │
├─────────────────────┼─────────────────────────────┤
│ ASNNumber           │ 51852                       │
│ ASNOrg              │ Private Layer INC           │
│ IsInEU              │ false                       │
│ IsoCode             │ CH                          │
│ SourceRange         │ 179.43.128.0/18             │
│ datasource_path     │ /var/log/traefik/access.log │
│ datasource_type     │ file                        │
│ http_args_len       │ 0                           │
│ http_path           │ /img../.git/config          │
│ http_status         │ 404                         │
│ http_user_agent     │ -                           │
│ http_verb           │ GET                         │
│ log_type            │ http_access-log             │
│ service             │ http                        │
│ source_ip           │ 179.43.189.138              │
│ timestamp           │ 2024-12-11T09:43:50Z        │
│ traefik_router_name │ -                           │
│ user                │ -                           │
╰─────────────────────┴─────────────────────────────╯
```

### list hub

```bash
8ee1637a8c9e:/# cscli hub list
INFO Loaded: 132 parsers, 9 postoverflows, 749 scenarios, 8 contexts, 4 appsec-configs, 88 appsec-rules, 127 collections 
INFO Unmanaged items: 1 local, 1 tainted          

PARSERS
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Name                            📦 Status            Version  Local Path                                               
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 crowdsecurity/cri-logs          ✔️  enabled          0.1      /etc/crowdsec/parsers/s00-raw/cri-logs.yaml              
...
 crowdsecurity/whitelists        ⚠️  enabled,tainted  ?        /etc/crowdsec/parsers/s02-enrich/whitelists.yaml         
 firix/authentik-logs            ✔️  enabled          0.1      /etc/crowdsec/parsers/s01-parse/authentik-logs.yaml      
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

POSTOVERFLOWS
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Name                              📦 Status    Version  Local Path                                                        
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 crowdsecurity/cdn-whitelist       ✔️  enabled  0.4      /etc/crowdsec/postoverflows/s01-whitelist/cdn-whitelist.yaml      
 crowdsecurity/rdns                ✔️  enabled  0.3      /etc/crowdsec/postoverflows/s00-enrich/rdns.yaml                  
 crowdsecurity/seo-bots-whitelist  ✔️  enabled  0.5      /etc/crowdsec/postoverflows/s01-whitelist/seo-bots-whitelist.yaml 
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

SCENARIOS
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Name                                              📦 Status    Version  Local Path                                                      
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 crowdsecurity/apache_log4j2_cve-2021-44228        ✔️  enabled  0.6      /etc/crowdsec/scenarios/apache_log4j2_cve-2021-44228.yaml       
 crowdsecurity/CVE-2017-9841                       ✔️  enabled  0.2      /etc/crowdsec/scenarios/CVE-2017-9841.yaml                      
...    
 firix/authentik-bf                                ✔️  enabled  0.1      /etc/crowdsec/scenarios/authentik-bf.yaml                       
 ltsich/http-w00tw00t                              ✔️  enabled  0.2      /etc/crowdsec/scenarios/http-w00tw00t.yaml                      
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

CONTEXTS
──────────────────────────────────────────────────────────────────────────────────────────────
 Name                         📦 Status    Version  Local Path                                
──────────────────────────────────────────────────────────────────────────────────────────────
 crowdsecurity/bf_base        ✔️  enabled  0.1      /etc/crowdsec/contexts/bf_base.yaml       
 crowdsecurity/firewall_base  ✔️  enabled  0.2      /etc/crowdsec/contexts/firewall_base.yaml 
 crowdsecurity/http_base      ✔️  enabled  0.2      /etc/crowdsec/contexts/http_base.yaml     
──────────────────────────────────────────────────────────────────────────────────────────────

COLLECTIONS
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Name                                 📦 Status    Version  Local Path                                           
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 crowdsecurity/base-http-scenarios    ✔️  enabled  1.0      /etc/crowdsec/collections/base-http-scenarios.yaml   
 crowdsecurity/http-cve               ✔️  enabled  2.9      /etc/crowdsec/collections/http-cve.yaml              
 crowdsecurity/iptables               ✔️  enabled  0.2      /etc/crowdsec/collections/iptables.yaml              
 crowdsecurity/linux                  ✔️  enabled  0.2      /etc/crowdsec/collections/linux.yaml                 
 crowdsecurity/sshd                   ✔️  enabled  0.5      /etc/crowdsec/collections/sshd.yaml                  
 crowdsecurity/traefik                ✔️  enabled  0.1      /etc/crowdsec/collections/traefik.yaml               
 crowdsecurity/whitelist-good-actors  ✔️  enabled  0.1      /etc/crowdsec/collections/whitelist-good-actors.yaml 
 firix/authentik                      ✔️  enabled  0.1      /etc/crowdsec/collections/authentik.yaml             
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```

### list parsers

```bash
8ee1637a8c9e:/# cscli parsers list

PARSERS
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Name                            📦 Status            Version  Local Path                                               
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 crowdsecurity/cri-logs          ✔️  enabled          0.1      /etc/crowdsec/parsers/s00-raw/cri-logs.yaml              
 crowdsecurity/dateparse-enrich  ✔️  enabled          0.2      /etc/crowdsec/parsers/s02-enrich/dateparse-enrich.yaml   
...
 crowdsecurity/whitelists        ⚠️  enabled,tainted  ?        /etc/crowdsec/parsers/s02-enrich/whitelists.yaml         
 firix/authentik-logs            ✔️  enabled          0.1      /etc/crowdsec/parsers/s01-parse/authentik-logs.yaml      
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```

### list metrics

```bash
8ee1637a8c9e:/# cscli metrics
Acquisition Metrics:
╭────────────────────────┬────────────┬──────────────┬────────────────┬────────────────────────┬───────────────────╮
│ Source                 │ Lines read │ Lines parsed │ Lines unparsed │ Lines poured to bucket │ Lines whitelisted │
├────────────────────────┼────────────┼──────────────┼────────────────┼────────────────────────┼───────────────────┤
│ file:/var/log/auth.log │ 2          │ -            │ 2              │ -                      │ -                 │
│ file:/var/log/syslog   │ 1          │ 1            │ -              │ -                      │ -                 │
╰────────────────────────┴────────────┴──────────────┴────────────────┴────────────────────────┴───────────────────╯

Local API Alerts:
╭───────────────────────────────────────────┬───────╮
│ Reason                                    │ Count │
├───────────────────────────────────────────┼───────┤
│ crowdsecurity/http-sensitive-files        │ 6     │
│ crowdsecurity/jira_cve-2021-26086         │ 4     │
│ crowdsecurity/http-cve-2021-41773         │ 2     │
│ crowdsecurity/http-path-traversal-probing │ 3     │
│ crowdsecurity/http-probing                │ 6     │
╰───────────────────────────────────────────┴───────╯

Bouncer Metrics (crowdsec-bouncer-tipi) since 2024-12-16 16:39:37 +0000 UTC:
╭────────────────────────────┬──────────────────┬───────────────────┬───────────────────────╮
│ Origin                     │ active_decisions │      dropped      │       processed       │
│                            │        IPs       │  bytes  │ packets │   bytes   │  packets  │
├────────────────────────────┼──────────────────┼─────────┼─────────┼───────────┼───────────┤
│ CAPI (community blocklist) │           38.43k │  19.56k │     348 │         - │         - │
│ lists:firehol_cybercrime   │              415 │       0 │       0 │         - │         - │
│ lists:firehol_greensnow    │            1.54k │   3.75k │      63 │         - │         - │
│ lists:otx-webscanners      │            8.01k │   1.03k │      21 │         - │         - │
├────────────────────────────┼──────────────────┼─────────┼─────────┼───────────┼───────────┤
│                      Total │           48.39k │  24.34k │     432 │     1.10G │     2.71M │
╰────────────────────────────┴──────────────────┴─────────┴─────────┴───────────┴───────────╯

Local API Decisions:
╭────────────────────────────────────────────┬────────┬────────┬───────╮
│ Reason                                     │ Origin │ Action │ Count │
├────────────────────────────────────────────┼────────┼────────┼───────┤
│ crowdsecurity/spring4shell_cve-2022-22965  │ CAPI   │ ban    │ 2     │
│ crowdsecurity/ssh-cve-2024-6387            │ CAPI   │ ban    │ 44    │
...
│ crowdsecurity/CVE-2023-49103               │ CAPI   │ ban    │ 75    │
│ crowdsecurity/http-crawl-non_statics       │ CAPI   │ ban    │ 749   │
╰────────────────────────────────────────────┴────────┴────────┴───────╯

Local API Metrics:
╭──────────────────────┬────────┬──────╮
│ Route                │ Method │ Hits │
├──────────────────────┼────────┼──────┤
│ /v1/alerts           │ GET    │ 2    │
│ /v1/alerts/10494     │ GET    │ 1    │
│ /v1/decisions        │ GET    │ 79   │
│ /v1/decisions/stream │ GET    │ 84   │
│ /v1/heartbeat        │ GET    │ 13   │
│ /v1/usage-metrics    │ POST   │ 2    │
│ /v1/watchers/login   │ POST   │ 4    │
╰──────────────────────┴────────┴──────╯

Local API Bouncers Metrics:
╭──────────────────────────────────────┬──────────────────────┬────────┬──────╮
│ Bouncer                              │ Route                │ Method │ Hits │
├──────────────────────────────────────┼──────────────────────┼────────┼──────┤
│ crowdsec-bouncer-tipi                │ /v1/decisions/stream │ GET    │ 84   │
│ crowdsec-bouncer-traefik@172.18.0.17 │ /v1/decisions        │ GET    │ 79   │
╰──────────────────────────────────────┴──────────────────────┴────────┴──────╯

Local API Bouncers Decisions:
╭──────────────────────────────────────┬───────────────┬───────────────────╮
│ Bouncer                              │ Empty answers │ Non-empty answers │
├──────────────────────────────────────┼───────────────┼───────────────────┤
│ crowdsec-bouncer-traefik@172.18.0.17 │ 79            │ 0                 │
╰──────────────────────────────────────┴───────────────┴───────────────────╯

Local API Machines Metrics:
╭───────────┬──────────────────┬────────┬──────╮
│ Machine   │ Route            │ Method │ Hits │
├───────────┼──────────────────┼────────┼──────┤
│ localhost │ /v1/alerts       │ GET    │ 2    │
│ localhost │ /v1/alerts/10494 │ GET    │ 1    │
│ localhost │ /v1/heartbeat    │ GET    │ 13   │
╰───────────┴──────────────────┴────────┴──────╯

Parser Metrics:
╭─────────────────────────────────┬──────┬────────┬──────────╮
│ Parsers                         │ Hits │ Parsed │ Unparsed │
├─────────────────────────────────┼──────┼────────┼──────────┤
│ child-crowdsecurity/sshd-logs   │ 14   │ -      │ 14       │
...
│ crowdsecurity/whitelists        │ 1    │ 1      │ -        │
╰─────────────────────────────────┴──────┴────────┴──────────╯

Whitelist Metrics:
╭──────────────────────────┬─────────────────────────────┬──────┬─────────────╮
│ Whitelist                │ Reason                      │ Hits │ Whitelisted │
├──────────────────────────┼─────────────────────────────┼──────┼─────────────┤
│ crowdsecurity/whitelists │ private ipv4/ipv6 ip/ranges │ 1    │ -           │
╰──────────────────────────┴─────────────────────────────┴──────┴─────────────╯
```

### set acquisitions

`~/runtipi/app-data/crowdsec/data/crowdsec/acquis.yaml`

```yml
filenames:
 - /var/log/auth.log
 - /var/log/syslog
 - /var/log/kern.log
 - /var/log/ufw.log
labels:
  type: syslog
---
source: journalctl
journalctl_filter:
 - "-k"
labels:
  type: syslog
---
source: docker
container_name:
 - runtipi-reverse-proxy
labels:
  type: traefik
---
source: docker
container_name:
  - authentik
labels:
  type: authentik
---
source: docker
container_name:
  - freshrss
labels:
  type: apache2
---
source: docker
container_name:
  - immich
labels:
  type: immich
---
```

### show acquisition metrics

```bash
8ee1637a8c9e:/# cscli metrics show acquisition
Acquisition Metrics:
╭────────────────────────┬────────────┬──────────────┬────────────────┬────────────────────────┬───────────────────╮
│ Source                 │ Lines read │ Lines parsed │ Lines unparsed │ Lines poured to bucket │ Lines whitelisted │
├────────────────────────┼────────────┼──────────────┼────────────────┼────────────────────────┼───────────────────┤
│ file:/var/log/kern.log │ 2          │ 2            │ -              │ -                      │ -                 │
│ file:/var/log/syslog   │ 2          │ 2            │ -              │ -                      │ -                 │
│ file:/var/log/ufw.log  │ 2          │ 2            │ -              │ -                      │ -                 │
╰────────────────────────┴────────────┴──────────────┴────────────────┴────────────────────────┴───────────────────╯
```

### list machines

```bash
8ee1637a8c9e:/# cscli machines list
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Name       IP Address  Last Update           Status  Version                 OS                            Auth Type  Last Heartbeat 
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 localhost  127.0.0.1   2024-12-17T09:09:28Z  ✔️      v1.6.4-523164f6-docker  Alpine Linux (docker)/3.20.3  password   33s            
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```

### list bouncers

```bash
8ee1637a8c9e:/# cscli bouncers list
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Name                                  IP Address   Valid  Last API pull         Type                       Version                                                                  Auth Type 
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 crowdsec-bouncer-traefik              172.18.0.7   ✔️     2024-12-16T15:29:08Z  Go-http-client             1.1                                                                      api-key   
 crowdsec-bouncer-tipi                 172.18.0.1   ✔️     2024-12-17T09:10:24Z  crowdsec-firewall-bouncer  v0.0.31-debian-pragmatic-amd64-4b99c161b2c1837d76c5fa89e1df83803dfbcc87  api-key   
 crowdsec-bouncer-traefik@172.18.0.40  172.18.0.40  ✔️     2024-12-17T08:53:36Z  Go-http-client             1.1                                                                      api-key   
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```

### delete bouncer

```bash
cscli bouncers delete BOUNCER-NAME
```

### explain acquis

```bash
8ee1637a8c9e:/# cscli explain -d "docker://runtipi-reverse-proxy?since=1h" -t traefik
```

```bash
8ee1637a8c9e:/# tail -n 5 /var/log/ufw.log | cscli explain --type syslog -f -
line: Dec 17 10:53:12 tipi kernel: [65078.995744] [UFW BLOCK] IN=enp2s0f0 OUT= MAC=33:33:00:00:00:01:dc:39:6f:2e:d6:5c:86:dd SRC=fe80:0000:0000:0000:de39:6fff:fe2e:d65c DST=ff02:0000:0000:0000:0000:0000:0000:0001 LEN=64 TC=0 HOPLIMIT=255 FLOWLBL=0 PROTO=UDP SPT=53805 DPT=53805 LEN=24 
        ├ s00-raw
        |       ├ 🔴 crowdsecurity/cri-logs
        |       ├ 🔴 crowdsecurity/docker-logs
        |       └ 🟢 crowdsecurity/syslog-logs (+12 ~9)
        ├ s01-parse
        |       ├ 🔴 firix/authentik-logs
        |       └ 🟢 crowdsecurity/iptables-logs (+11 ~1)
        ├ s02-enrich
        |       ├ 🟢 crowdsecurity/dateparse-enrich (+2 ~2)
        |       ├ 🟢 crowdsecurity/geoip-enrich (+9)
        |       ├ 🔴 crowdsecurity/http-logs
        |       └ 🟢 crowdsecurity/whitelists (unchanged)
        ├-------- parser success 🟢
        ├ Scenarios
```

### list notifications

```bash
bf788e1b64ad:/# cscli notifications list
──────────────────────────────────────────────────
 Active  Name              Type      Profile name 
──────────────────────────────────────────────────
 🚫      slack_default     slack                  
 🚫      splunk_default    splunk                 
 🚫      http_default      http                   
 🚫      email_default     email                  
 🚫      sentinel_default  sentinel               
──────────────────────────────────────────────────
```

### create pushover notification

`~/runtipi/app-data/crowdsec/data/crowdsec/notifications/http.yaml`

```yml
type: http          # Don't change
name: http_default  # Must match the registered plugin in the profile
log_level: info
format: |
  {
   "token": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "user": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "message": "{{range . -}}{{$alert := . -}}{{range .Decisions -}}<b>{{.Value}}</b> will get <b>{{.Type}}</b> for next <b>{{.Duration}}</b> for triggering <b>{{.Scenario}}</b>.\r\n https://www.shodan.io/host/{{.Value}}{{end -}}{{end -}}",
   "html": "1",
   "title": "Scenario triggered on IDS/IPS !"
  }
url: https://api.pushover.net/1/messages.json
method: POST
headers:
  Content-Type: "application/json"
```

### test http_default notification

[Crowdsec Pushover Notification (using API and HTTP notifier)](https://gist.github.com/JigSawFr/1104d6b619d3523500f00ab68d8bf841)

```cscli notifications test http_default
bf788e1b64ad:/# cscli notifications test http_default
WARN notification 'http_default' is defined multiple times 
...pid=883
DEBU[0001] plugin exited
```

### register notification

`~/runtipi/app-data/crowdsec/data/crowdsec/profiles.yaml`

```yml
name: default_ip_remediation
...
notifications:
```

## Firewall Bouncer Configuration

[Crowdsec Docker Compose Guide Part 1: Powerful IPS with Firewall Bouncer](https://www.smarthomebeginner.com/crowdsec-docker-compose-1-fw-bouncer/)

> Note that Firewall Bouncer is to be installed on the Docker host (where runtipi runs) as a native app.

tipi host:

```bash
curl -s https://install.crowdsec.net | sudo sh
sudo apt update
sudo apt install crowdsec-firewall-bouncer-iptables
```

crowdsec container:

```bash
23943bdf7ae1:/# cscli bouncers add crowdsec-bouncer-<hostname>
API key for 'crowdsec-bouncer-tipi':

   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Please keep this key since you will not be able to retrieve it!
```

tipi host:

```bash
sudo vim /etc/crowdsec/bouncers/crowdsec-firewall-bouncer.yaml
```

```yml
api_url: http://127.0.0.1:8081/
api_key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
disable_ipv6: true
iptables_chains:
  - INPUT
#  - FORWARD
  - DOCKER-USER
```

```bash
sudo systemctl restart crowdsec-firewall-bouncer.service
```

check for servicer failures

```bash
journalctl -u crowdsec-firewall-bouncer -n 50 --no-pager
```
