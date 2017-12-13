var questions = [];
function getNumOfRows(num){
	for ( var i = 0; i < num; i++ ) {
    	questions[i] = []; 
	}
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
		if (idees[x] == num)
			return true;
	}
	return false;
}

function answer(id, text) {
	this.id = id;
	this.text = text;
}

function generateChoices(length, questionId) {
	for (var i = 0; i < length - 4; i++) {
		var num = getRandom(4, length - 1);
		while (checkPicked(num) == true) {
			num = getRandom(4, length - 1);
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
	form.setAttribute("id", "theForm");

	var par = document.createElement("p");
	form.appendChild(par);

	var ques = document.createTextNode((questions[counter])[3]);
	par.appendChild(ques);


	for (var x = 0; x < (answers.length); x++) {
		var div = document.createElement("div");
		form.appendChild(div);

		var text = document.createTextNode(answers[x].text);
		div.appendChild(text);
		div.setAttribute("id", answers[x].id);
		div.addEventListener('click', select(answers[x].id));
	}
	var but = document.createElement("button");
	document.body.appendChild(but);

	var txt = "Nākamais";
	var butText = document.createTextNode(txt);
	but.setAttribute("id", "but");
	but.appendChild(butText);
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
		sendData(questions[counter][2], globalId);
		if (globalId == 0) {
			return;
		}
		if (globalId == 4) {
			score++;
		}
		if (counter < questions.length-1) {
			globalId = 0;
			clearContents();
			counter++;
			createForm();

		}else{
			sendFinal();
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
			var userName = document.getElementById("nameInput").getAttribute("value");
			i3.setAttribute("value", userName);

			f.appendChild(i1);
			f.appendChild(i2);
			f.appendChild(i3);

			document.body.appendChild(f);
			f.submit();
		}
	};
}

function clearContents() {
	var c = document.getElementById("theForm");
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

var userId;

function sendData(questionId, globalId) {
		userId = document.getElementById("userId").getAttribute("value");
        if (window.XMLHttpRequest) {
            xmlhttp = new XMLHttpRequest();
        } else {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.open("GET", "sendData.php?questionId="+questionId+"&globalId="+globalId+"&userId="+userId, true);
        xmlhttp.send();
    }

function sendFinal() {
        if (window.XMLHttpRequest) {
            xmlhttp = new XMLHttpRequest();
        } else {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.open("GET", "sendFinal.php?score="+score+"&total="+(counter+1)+"&userId="+userId, true);
        xmlhttp.send();
    }

