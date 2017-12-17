window.onbeforeunload = function() {
	return "Vai tiešām vēlies iziet? Testa sesija nesaglabāsies!"
}

var questions = [];
var userId;
var userName;
function getData(numRows, userName, userId){
	for ( var i = 0; i < numRows; i++ ) {
    		questions[i] = []; 
	}
	this.userId = userId;
	this.userName = userName;
}

var z = 0;
var qn;
function getQuestions(str, questionNum) {
	if(questions[questionNum][z]){
		z++;
	}
	if(questionNum != qn){
		z = 0;
	}
	questions[questionNum][z] = str;
	qn = questionNum;
}

var answers = new Array;
var idees = new Array;
var counter = 0;
var score = 0;
var globalId = 0;

function getRandom(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

function checkPicked(num) {
	for (var x = 0; x < idees.length; x++) {
		if (idees[x] == num) return true;
	}
	return false;
}

function answer(id, text) {
	this.id = id;
	this.text = text;
}

function generateChoices(length, questionId) {
	for (var i = 0; i < length - 2; i++) {
		var num = getRandom(2, length - 1);
		while (checkPicked(num) == true) {
			num = getRandom(2, length - 1);
		}
		idees[i] = num;
		answers[i] = new answer(idees[i], questionId[num]);
	}
}

function createForm() {
	clearArrays();
	generateChoices(questions[counter].length, questions[counter]);

	var form = document.createElement("form");
	document.body.appendChild(form);
	form.setAttribute("id", "questionForm");

	var par = document.createElement("p");
	par.setAttribute("style", "font-size:22px")
	form.appendChild(par);

	var ques = document.createTextNode((questions[counter])[1]);
	par.appendChild(ques);


	for (var x = 0; x < (answers.length); x++) {
		var div = document.createElement("div");
		var p = document.createElement("p");
		var text = document.createTextNode(answers[x].text);

		form.appendChild(div);
		div.appendChild(p);
		p.appendChild(text);
		div.setAttribute("id", answers[x].id);
		div.addEventListener('click', select(answers[x].id));
	}
	var but = document.createElement("input");
	document.body.appendChild(but);
	but.setAttribute("id", "but");
	but.setAttribute("type", "submit");
	but.setAttribute("value", "Nākamais");
	but.addEventListener('click', submit());

	var bar = document.createElement("progress");
	document.body.appendChild(bar);
	bar.setAttribute("id", "bar");
	bar.setAttribute("max", 100);
	bar.setAttribute("value", (100.00/questions.length)*counter);
}

function select(id) {
	return function() {
		globalId = id;
		document.getElementById(id).style.backgroundColor = "lightgray";
		for (var x = 0; x < idees.length; x++) {
			if (idees[x] == id) continue;
			document.getElementById(idees[x]).style.backgroundColor = "white";
		}
	};
}

function submit() {
	return function() {
		if (globalId == 0) {
			return;
		}
		sendData("answer", "questionId", questions[counter][0], "globalId", globalId, "userId", userId);
		if (globalId == 2) {
			score++;
		}
		if (counter < questions.length-1) {
			globalId = 0;
			clearContents();
			counter++;
			createForm();

		}else{
			sendData("score", "score", score, "total", (counter+1), "userId", userId);
			clearContents();
			var f = document.createElement("form");
			f.setAttribute("method", "post");
			f.setAttribute("action", "./final.php");
			
			var i1 = document.createElement("input");
			i1.setAttribute("type", "hidden");
			i1.setAttribute("name", "score");
			i1.setAttribute("value", score);

			var i2 = document.createElement("input");
			i2.setAttribute("type", "hidden");
			i2.setAttribute("name", "counter");
			i2.setAttribute("value", counter + 1);

			var i3 = document.createElement("input");
			i3.setAttribute("type", "hidden");
			i3.setAttribute("name", "userName");
			i3.setAttribute("value", userName);

			f.appendChild(i1);
			f.appendChild(i2);
			f.appendChild(i3);

			document.body.appendChild(f);
			window.onbeforeunload = null;
			f.submit();
			
		}
	};
}

function clearContents() {
	var c = document.getElementById("questionForm");
	document.body.removeChild(c);

	var b = document.getElementById("but");
	document.body.removeChild(b);

	var p = document.getElementById("bar");
	document.body.removeChild(p);
}

function clearArrays() {
	if (idees.length > 0) idees = idees.slice(idees.length);
	if (answers.length > 0) answers = answers.slice(answers.length);
}

function sendData(dataTypeValue, data1, value1, data2, value2, data3, value3) {
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET", "sendData.php?dataType="+dataTypeValue+"&"+data1+"="+value1+"&"+data2+"="+value2+"&"+data3+"="+value3, true);
    xmlhttp.send();
}
