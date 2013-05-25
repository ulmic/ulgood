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

$(window).resize(function(){
    var screen_width = window.innerWidth
    var el = screen_width/20;
    $('.login_icon').width(el).height(el).css('margin-left', el*4);
    $($('#login_buttons').children()[0]).css('margin-left', el);
    $('#login_buttons').css('bottom', $('footer').height()-($('.login_icon').height()+20)/2);
    $('#main').width(window.innerWidth-220);
});

$(document).ready(function(){
    $(window).resize();
});