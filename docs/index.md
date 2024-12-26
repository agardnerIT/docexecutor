<style>
        .executor {
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
        .executor:hover {
            background-color: #45a049;
        }
        #codesnippet {
            width: 30%;
            float: left;
        }
        #response {
            visibility: hidden;
            background-color: rgba(34,139,34,0.7);
            position: fixed;
            bottom: 5px;
            color: #fff;
            padding: 16px;
        }

        #response.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s, fadeout 0.5s 5s;
            animation: fadein 0.5s, fadeout 0.5s 5s;
        }

        @-webkit-keyframes fadein {
            from {bottom: 0; opacity: 0;} 
            to {bottom: 30px; opacity: 1;}
        }

        @keyframes fadein {
            from {bottom: 0; opacity: 0;}
            to {bottom: 30px; opacity: 1;}
        }

        @-webkit-keyframes fadeout {
            from {bottom: 30px; opacity: 1;} 
            to {bottom: 0; opacity: 0;}
        }

        @keyframes fadeout {
            from {bottom: 30px; opacity: 1;}
            to {bottom: 0; opacity: 0;}
        }
</style>

<script>
        async function setServerAddress() {
            localStorage.setItem("serverAddress", document.getElementById("serverAddress").value)
        }
        async function setSecretKey() {
            localStorage.setItem("secretKey", document.getElementById("secretKey").value)
        }

        async function sendRequest(snippetID, filePath) {
            try {

                const response = await fetch(localStorage.getItem("serverAddress") + "query", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        filename: filePath,
                        snippet_id: snippetID,
                        secret_key: localStorage.getItem("secretKey")
                    })
                });
                const data = await response.json();

                if (data["output"]) {
                    document.getElementById('response').innerHTML = data["output"]
                    var x = document.getElementById("response");
                    x.className = "show";
                    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
                }
                // else {
                //     // secretKey is probably wrong so set empty
                //     document.getElementById('response').innerHTML = ""
                // }

            } catch (error) {
                document.getElementById('response').innerText = 'Error: ' + error.message;
            }
        }
</script>

# v0.0.18

## Test File

<label for="secretKey">Set secret key: </label> <input type="text" onblur="setSecretKey()" id="secretKey" /><br />
<label for="serverAddress">Set server address: </label> <input type="text" onblur="setServerAddress()" id="serverAddress" /><br /><br />

``` {"name": "list all"}
ls -al
touch /tmp/foo
```

<button class="executor" onclick="sendRequest('list all', 'docs/index.md')">&#9658;</button>
<pre id="response">Response will appear here...</pre>
