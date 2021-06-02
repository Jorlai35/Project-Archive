function openNav(){
	document.getElementById("NavBar").style.width = "25%";
}

function closeNav(){
	document.getElementById("NavBar").style.width = "0%";
}

function getPrice(){
	var value = 0;
	switch (document.getElementById("RoomType").value){
		case "Single":
		value += 50;
		break;
		case "Double":
		value += 100
		break;
		case "Queen":
		value += 150;
		break;
		case "Studio":
		value += 200;
		break;
		default:
		value += 0;
	}	
	value *= document.getElementById("NoRooms").value;
	value *= populatedDates();
	value += breakfastCalc();
	
	document.getElementById("TestOutput").value = value;
}

function showEmailMsg(){
	document.getElementById("EmailMsg").style.display = "inline";
}

function hideEmailMsg(){
	document.getElementById("EmailMsg").style.display = "none";
}

function populatedDates(){
	var Arrive = document.getElementById("Arrive").value.split('-');
	var Leave = document.getElementById("Leave").value.split('-');
	var DaysA = (((Number(Arrive[1])/12)+Number(Arrive[0]))*365.25) + Number(Arrive[2]);
	var DaysL = (((Number(Leave[1])/12)+Number(Leave[0]))*365.25) + Number(Leave[2]);
	if (DaysA > DaysL){
		document.getElementById("Leave").value = "";
		return 0;
	}
	if (document.getElementById("Arrive").value !== "" && document.getElementById("Leave").value !== ""){
		document.getElementById("ArrivalTime").style.display = "block";
		return parseInt(DaysL-DaysA);
	}
}
function breakfastCalc(){
	if(document.getElementById("breakfast").checked){
		return (Number(document.getElementById("Adult").value) + (Number(document.getElementById("Child").value)/2))*60
	}
	else{
		return 0;	
	}
}

function showArrival(){
	document.getElementById("ArrivalTime").style.display = "inline";
}
function hideArrival(){
	document.getElementById("ArrivalTime").style.display = "none";
}