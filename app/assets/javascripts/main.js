function show_login_help() {
//document.getElementById('black').style.display = "block";
help_win = document.getElementById('login_help');
help_win.style.opacity = 1;
help_win.style.display = 'block';
}

function hide_login_help() {
//document.getElementById('black').style.display = "none";
document.body.style.backgroundColor = "";
help_win = document.getElementById('login_help');
help_win.style.display = 'none';
}