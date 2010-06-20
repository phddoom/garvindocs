// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var selectQueryID;
function start(){
	if (document.all){
		//IE
		frames.doc.document.designMode = "On";
	}else{
		//Firefox and Chrome
		bindShortcuts();
		//document.execCommand("useCSS", false, null);
		setInterval("CommandQuery()", 100);
		selectQueryID = setInterval("selectQuery()", 100);
		guiUpdate();
		}
}

function guiUpdate(){
	//This makes sure that notices provided by flash
	//are centered with respect to the window
	var e = document.getElementById('notice');
	var width = e.style.width;
	width = width.substring(0, width.length - 2);
//	alert(width);
//	alert(window.innerWidth);
	e.style.left=String((window.innerWidth - (Number(width)/2))/2) + "px";
}

function selectQuery(){
	var fontname = document.queryCommandValue('fontname');
	var x = document.getElementById('fontname');
	for (i=0;i<x.length;i++){
		if(x.options[i].value == fontname){
			x.options[i].selected = 'selected';
		}
	}
	var fontsize = document.queryCommandValue('fontsize');
	x = document.getElementById('fontsize');
	for (i=0;i<x.length;i++){
		if(x.options[i].value == fontsize){
			x.options[i].selected = 'selected';
		}
	}
	try{
	var formatblock = document.queryCommandValue('formatblock');
	x = document.getElementById('formatblock');
	for (i=0;i<x.length;i++){
		if(x.options[i].value == formatblock){
			x.options[i].selected = 'selected';
		}
	}
	}catch(err){}
}

function CommandQuery () {
	var i;
	var commands = new Array();
	commands[0] = "bold";
	commands[1] = "italic";
	commands[2] = "underline";
	commands[3] = "subscript";
	commands[4] = "superscript";
	commands[5] = "strikethrough";
	commands[6] = "justifycenter";
	commands[7] = "justifyfull";
	commands[8] = "justifyleft";
	commands[9] = "justifyright";
	for (i in commands){
		try {var state = document.queryCommandState(commands[i]);
		switch (state) {
			case true:
				document.getElementById(commands[i]).className = "imagebutton_pressed";
				break;
			case false:
				document.getElementById(commands[i]).className = "imagebutton";
				break;
			case null:
				document.getElementById(commands[i]).className = "imagebutton";
				break;
		}}catch(err){}
	}
}
function runCommand(theCommand) {
  var theEditor;
  if (document.all) {
    //IE
    frames["doc"].document.execCommand(theCommand, false);
    document.getElementById("doc").contentWindow.focus();
  } else {
    //Firefox and Chrome
    document.execCommand(theCommand, false, null);
    document.getElementById("docForm").doc.focus();

  }
}

function Select(selectname)
{
	//clearInterval(selectQueryID);
  var cursel = document.getElementById(selectname).selectedIndex;
  /* First one is always a label */
  if (cursel != 0) {
    var selected = document.getElementById(selectname).options[cursel].value;
    document.execCommand(selectname,false, selected);
    //document.getElementById(selectname).selectedIndex = 0;
    document.getElementById("doc").focus();
    //selectQueryID = setInterval("selectQuery()", 100);
  }
}


function saveAndClose(){
  save();
  window.close();
}

function bindShortcuts()
{
  //Make Bold shortcut bind to ctrl+b
  shortcut.add("Ctrl+b",function() {
      document.execCommand('bold', false, null);
      });

  //Make Italic shortcut bind to ctrl+i
  shortcut.add("Ctrl+i",function() {
      document.execCommand('italic', false, null);
      });

  //Make Underline shortcut bind to ctrl+u
  shortcut.add("Ctrl+u",function() {
      document.execCommand('underline', false, null);
      });

  //Make indent shortcut bind to Tab
  shortcut.add("Tab",function() {
      document.execCommand('indent', false, null);
      });

  //Make unindent shortcut bind to Shift+Tab
  shortcut.add("Shift+Tab",function() {
      document.execCommand('outdent', false, null);
      });

  //Make list shortcut bind to Ctrl+l
  shortcut.add("Ctrl+l",function() {
      document.execCommand('InsertOrderedList', false, null);
      });

  //Make bullets shortcut bind to Ctrl+Shift+l
  shortcut.add("Ctrl+Shift+l",function() {
      document.execCommand('InsertUnorderedList', false, null);
      });

  //Make strikethrough shortcut bind to Ctrl+k
  shortcut.add("Ctrl+k",function() {
        document.execCommand('strikethrough', false, null);
      });

  //Make superscript shortcut bind to Ctrl+=
  shortcut.add("Ctrl+=",function() {
      document.execCommand('superscript', false, null);
      });

  //Make superscript shortcut bind to Ctrl+-
  shortcut.add("Ctrl+-",function() {
      document.execCommand('subscript', false, null);
      });

  //Make justifyleft shortcut bind to Ctrl+e
  shortcut.add("Ctrl+e",function() {
      document.execCommand('justifyleft', false, null);
      });

  //Make justifyright shortcut bind to Ctrl+r
  shortcut.add("Ctrl+r",function() {
      document.execCommand('justifyright', false, null);
      });

  //Make justifycenter shortcut bind to Ctrl+e
  shortcut.add("Ctrl+Shift+e",function() {
      document.execCommand('justifycenter', false, null);
      });

  //Make justifyfull shortcut bind to Ctrl+j
  shortcut.add("Ctrl+j",function() {
      document.execCommand('justifyfull', false, null);
      });

  //Make Print shortcut bind to Ctrl+p
  shortcut.add("Ctrl+p",function() {
      parent.printDoc();
      });

  //Make Save shortcut bind to Ctrl+S
  shortcut.add("Ctrl+s",function() {
      parent.save();

      });

  //Make Save and Close shortcut bind to Ctrl+S
  shortcut.add("Ctrl+Shift+s",function() {
      parent.saveAndClose();
      });
}

