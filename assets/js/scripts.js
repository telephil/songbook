/* JavaScript */

var currentLink = null;

function setSelection(obj) {
    if (currentLink != null) {
	currentLink.className='list-group-item';
    }
    obj.className = 'list-group-item active';
    currentLink = obj;
}

function displayTab(id) {
    var req = new XMLHttpRequest();
    req.onreadystatechange = function() {
	var output = document.getElementById("tabview");
	const new_html = req.responseText;
	if(output.innerHTML != new_html) {
            output.innerHTML = new_html;
	}
    };
    req.open("POST", "/tab", true);
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send("id=" + id);
}

