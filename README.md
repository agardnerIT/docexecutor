# docexecutor

```sh {"terminalRows":"3"}
export BODY="{\"secret_key\":\"$(cat /tmp/secret)\",\"filename\":\"docs/index.md\",\"snippet_id\":\"list all\"}"
```

```sh {"terminalRows":"14"}
curl -X POST \
    -H "Content-Type: application/json" \
    -d @<(echo $BODY) \
    http://localhost:8000/query
```
