#/bin/bash

cat > /tmp/sample.json << EOF
{
    "statusCode": 200,
    "body": {
        "records": [
            {
                "project": "p1",
                "endpoint": "a.com",
                "useragent": "u1",
                "ip": [
                    "10.60.48.219",
                    "10.60.49.127",
                    "10.60.49.254",
                    "10.60.50.11",
                    "10.60.56.16",
                    "10.60.57.9"
                ]
            },
            {
                "project": "p2",
                "endpoint": "b.com",
                "useragent": "u2",
                "ip": [
                    "10.60.48.184",
                    "10.60.49.6",
                    "10.60.53.85",
                    "10.60.54.153",
                    "10.60.54.180",
                    "10.60.55.148"
                ]
            }
        ]
    }
}
EOF

jq '.body.records[] | [.endpoint, .useragent, .ip]| flatten | join(",")' /tmp/sample.json | pbcopy