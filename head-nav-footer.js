function dynamicallyInclude(name) {
  document.getElementById(name).innerHTML = fetch("/" + name + ".html")
  .then(response => response.text())
  .then(data => document.getElementById(name).innerHTML = data);
}

dynamicallyInclude("header")
dynamicallyInclude("nav")
dynamicallyInclude("footer")
