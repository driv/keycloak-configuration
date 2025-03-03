
kubectl exec example-kc-0 -- bash -c 'JAVA_OPTS_APPEND="-Djgroups.bind.port=8888 -Djgroups.dns.query=10.96.190.201:8080" /opt/keycloak/bin/kc.sh export --file /tmp/export.json'
kubectl exec example-kc-0 -- bash -c 'cat tmp/export.json' > export.json
jq '.[] | select(.realm=="SDLCBox") | .clients | .[] | select(.clientId=="grafana")' export.json > grafana.json
jq '.[] | select(.realm=="SDLCBox") | .clients | .[] | select(.clientId=="grafana-oauth")' export.json > grafana-oauth.json
meld grafana-oauth.json grafana.json
