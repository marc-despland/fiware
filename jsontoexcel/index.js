var json2xls = require('json2xls');
var fs = require('fs');

var args = process.argv.slice(2);
console.log(args);

var ref={};
fs.readdirSync(args[0]).forEach(file => {
  console.log(file);
  if (file.endsWith(".json")) {
  	console.log("Analysing : "+ file);
  	data= fs.readFileSync(args[0]+"/"+file, 'utf8');
  	var raw = JSON.parse(data);
  	//console.log("Data :" +JSON.stringify(raw));
  	raw.forEach(function(element) {
  		for (var name in element) {
  			if (name==="values") {
  				for (var subname in element.values) {
  					ref[subname]="";
  				}
  			} else {
  				ref[name]="";
  			}
  		}
	});
  }
});


var json=[];
fs.readdirSync(args[0]).forEach(file => {
  console.log(file);
  if (file.endsWith(".json")) {
  	console.log("Analysing : "+ file);
  	data= fs.readFileSync(args[0]+"/"+file, 'utf8');
  	var raw = JSON.parse(data);
  	//console.log("Data :" +JSON.stringify(raw));
  	raw.forEach(function(element) {
		var elt={};
		for (var name in ref) {
			elt[name]="";
		}
  		for (var name in element) {
  			if (name==="values") {
  				for (var subname in element.values) {
  					elt[subname]=String(element.values[subname]);
  				}
  			} else {
  				elt[name]=String(element[name]);
  			}
  		}
  		json.push(elt);
	});
  }
});
console.log("Formating json to excel");
var xls = json2xls(json);

console.log("Writing excel");
var excel="result.xlsx";

fs.writeFileSync(excel, xls, 'binary');



/*fs.readFile(args[0], 'utf8', function (err, data) {
    if (err) {
    	console.log("An error occurs");
       // error handling
    }
    var ref={};
	var raw = JSON.parse(data);
	raw.forEach(function(element) {
  		for (var name in element) {
  			if (name==="values") {
  				for (var subname in element.values) {
  					ref[subname]="";
  				}
  			} else {
  				ref[name]="";
  			}
  		}
	});
	var json=[];
	raw.forEach(function(element) {
		var elt={};
		for (var name in ref) {
			elt[name]="";
		}
  		for (var name in element) {
  			if (name==="values") {
  				for (var subname in element.values) {
  					elt[subname]=element.values[subname];
  				}
  			} else {
  				elt[name]=element[name];
  			}
  		}
  		json.push(elt);
	});
    var xls = json2xls(json);

    var excel=args[0].substring(0, args[0].indexOf('.json'))+".xlsx";

	fs.writeFileSync(excel, xls, 'binary');
});*/


