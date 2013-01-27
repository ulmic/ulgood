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
