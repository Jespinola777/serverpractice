const div = $(".display");
$.get("api/users", function (data) {
  for (user of data) {
    div.append($("<div>").text(user.first_name));
  }
});
