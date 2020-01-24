// from data.js
var tableData = data;

// YOUR CODE HERE!

var tbody = d3.select("tbody");
function buildTable (data){
	tbody.html("");
	data.forEach((dataRow) => {

		var row = tbody.append("tr");

		Object.values(dataRow).forEach((value) => {

			var cell = row.append("td");
			cell.text(value);

		});
		//console.log(tableData)
	});
}

function clickButton(){
	var date = d3.select("#datetime").property("value");
	var filterData = tableData;
	if(date){
		filterData = filterData.filter(row=> row.datetime === date);
	}
	console.log(filterData);

	buildTable(filterData);
}
d3.selectAll("#filter-btn").on("click",clickButton);


buildTable(tableData);

