var result = "";
for (key in icons) {
	result += "var " + key.split("-").join("_").toUpperCase() + "_BRAND = " + '"fab fa-' + key + ' fa-fw";\n';
}

console.log(result);

//

var result = "";
for (key in icons) {
	result += "var " + key.split("-").join("_").toUpperCase() + "_REGULAR = " + '"far fa-' + key + ' fa-fw";\n';
}

console.log(result);

//

var result = "";
for (key in icons) {
	result += "var " + key.split("-").join("_").toUpperCase() + " = " + '"fas fa-' + key + ' fa-fw";\n';
}

console.log(result);
