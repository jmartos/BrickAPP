$(document).ready(function () {
  $("#edit_profile").click(function () {
    window.location.href = "/users/edit";
  })
})

$.ajax({
  url: '/works/:work_id/',
  type: "post",
  dataType: "json",
  
  success: function(data, textStatus, jqXHR) {
        // since we are using jQuery, you don't need to parse response
        drawTable(data);
      }
    });

function drawTable(data) {
  for (var i = 0; i < data.length; i++) {
    drawRow(data[i]);
  }
}

function drawRow(rowData) {
  var row = $("<tr />")
  $("#personDataTable").append(row); 
  row.append($("<td>" + rowData.id + "</td>"));
  row.append($("<td>" + rowData.name + "</td>"));
  row.append($("<td>" + rowData.address + "</td>"));
}

