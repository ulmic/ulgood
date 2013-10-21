//= require jquery
//= require jquery_ujs
//= require_tree .

function showSocialButtons(el) {
    var kids = el.childNodes;
    var ch=0;
    for (var k = 0; k < kids.length; k++) {
        var child = kids[k];
        if (child && child.className == "social_post") {
            ch++;
            $(child).delay(500*ch).css("opacity","1").delay(500*ch);
        }
    }
}
function hideSocialButtons(el) {
    var kids = el.childNodes;
    var ch=0;
    for (var k = 0; k < kids.length; k++) {
        var child = kids[k];
        if (child && child.className == "social_post") {
            $(child).delay(500*ch).css("opacity","0").delay(500*ch);
        }
    }
}

function counter(el)
{
    var wrapper = document.createElement('DIV');
    wrapper.innerHTML = el.value;
    var len = (wrapper.textContent || wrapper.innerText).length;
    if (len < 10) {
        document.getElementById('post').disabled=true;
    } else {
        document.getElementById('post').disabled=false;
    }
    document.getElementById('text_count').innerHTML = 100-len;
}

function show_full(el) {
    if (el.style.whiteSpace == "nowrap" || el.style.whiteSpace == "") {
        el.style.whiteSpace = "normal";
        el.style.wordBreak = "break-all";
        el.style.overflow = "normal";
    } else {
        el.style.overflow = "hidden";
        el.style.whiteSpace = "nowrap";
        el.style.wordWrap = "";
    };
}

var reformalOptions = {
    project_id: 89773,
    project_host: "ulgood.reformal.ru",
    force_new_window: true,
    tab_orientation: "right",
    tab_indent: "50%",
    tab_bg_color: "#f9be27",
    tab_border_color: "#FFFFFF",
    tab_image_url: "http://tab.reformal.ru/T9GC0LfRi9Cy0Ysg0Lgg0L%252FRgNC10LTQu9C%252B0LbQtdC90LjRjw==/FFFFFF/a08a7c60392f68cb33f77d4f56cf8c6f/right/1/tab.png",
    tab_border_width: 0,
    tab_class_name: "reftab"
};

function reformal_script(){
    var script = document.createElement('script');
    script.type = 'text/javascript'; script.async = true;
    script.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'media.reformal.ru/widgets/v3/reformal.js';
    document.getElementsByTagName('head')[0].appendChild(script);
}

function Update() {
    $('#update').click();
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
