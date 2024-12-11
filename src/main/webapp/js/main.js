function callApi(method, url, data, responseHandler) {
    var options;
    if (method === "GET" || method === "DELETE") {
        options = {
            method: method,
            headers: {
                'Content-Type': 'application/json'
            }
        };
    } else {
        options = {
            method: method,
            headers: {
                'Content-Type': 'application/json'
            },
            body: data // Send data in body for POST and PUT
        };
    }

    fetch(url, options)
        .then(response => {
            if (!response.ok) {
                throw new Error(response.status + ": " + response.statusText);
            }
            return response.text(); // Parse response as plain text
        })
        .then(data => responseHandler(data)) // Process the response
        .catch(error => {
            alert("Error: " + error.message);
            console.error("There was an error with the request:", error);
        });
}
function getResponse(data) {
    var ackLabel = document.getElementById("ack");

    ackLabel.innerText = data; // Display the plain text response
    ackLabel.style.color = "green"; // Set the color to green for success
}
