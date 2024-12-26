<style>
        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
        }
        input {
            padding: 10px;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        #response {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            min-height: 50px;
            font-family: monospace;
            white-space: pre-wrap;
        }
        #codesnippet {
            width: 30%;
            float: left;
        }
</style>

<script>
        async function setServerAddress() {
            localStorage.setItem("serverAddress", document.getElementById("serverAddress").value)
        }
        async function setSecretKey() {
            localStorage.setItem("secretKey", document.getElementById("secretKey").value)
        }

        async function sendRequest(snippetID) {
            try {

                const response = await fetch(localStorage.getItem("serverAddress") + "query", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        filename: "index.md",
                        snippet_id: snippetID,
                        secret_key: localStorage.getItem("secretKey")
                    })
                });
                const data = await response.json();

                if (data["output"]) {
                    document.getElementById('response').innerHTML = data["output"]
                }
                else {
                    // secretKey is probably wrong so set empty
                    document.getElementById('response').innerHTML = ""
                }

            } catch (error) {
                document.getElementById('response').innerText = 'Error: ' + error.message;
            }
        }
</script>

# v0.0.9

## Test File

<label for="secretKey">Set secret key: </label> <input type="text" onblur="setSecretKey()" id="secretKey" /><br />
<label for="serverAddress">Set server address: </label> <input type="text" onblur="setServerAddress()" id="serverAddress" /><br /><br />

``` {"name": "list all"}
ls -al
touch /tmp/foo
```

<button onclick="sendRequest('list all')">&#9658;</button>
<div id="response">Response will appear here...</div>
