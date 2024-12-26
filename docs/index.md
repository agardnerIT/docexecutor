<style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }
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
            background-color: #f5f5f5;
        }
        #codesnippet {
            width: 30%;
            float: left;
        }
</style>

## Test File

```
ls -al
touch /tmp/foo
```
<button onclick="sendRequest()">&#9658;</button>
