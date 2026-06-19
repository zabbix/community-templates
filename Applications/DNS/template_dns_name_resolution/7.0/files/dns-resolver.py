#!/usr/bin/env python3

import sys
import json
import time
import dns.resolver

mode = sys.argv[1]

# ---------------------------
# DISCOVERY MODE
# ---------------------------
if mode == "discover":
    hostnames = sys.argv[2]

    hostname_list = hostnames.split(",")

    data = [{"{#HOSTNAME}": h.strip()} for h in hostname_list]

    print(json.dumps({"data": data}))
    sys.exit(0)


# ---------------------------
# CHECK MODE
# ---------------------------
if mode == "check":
    hostname = sys.argv[2]
    dns_server = sys.argv[3]

    result = {
        "success": False,
        "ip": "",
        "response_time_ms": 0,
        "error": ""
    }

    try:
        resolver = dns.resolver.Resolver()
        resolver.nameservers = dns_server.split(",")

        start = time.perf_counter()
        answer = resolver.resolve(hostname, "A")
        end = time.perf_counter()

        result["success"] = True
        result["ip"] = answer[0].to_text()
        result["response_time_ms"] = round((end - start) * 1000, 2)

    except Exception as e:
        result["error"] = str(e)

    print(json.dumps(result))