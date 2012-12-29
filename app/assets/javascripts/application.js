//= require jquery
//= require jquery_ujs

function TwitterBird() {
    twitterAccount = 'ulmicru';
    showTweet = false;
    birdSprite='http://simartshool.ru/wp-content/plugins/anmiated-twitter-bird/birdsprite.png';
    tripleflapInit();
}

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
    document.getElementById('count').innerHTML = 100-len;
}

function show_full(el) {
    if (el.style.whiteSpace == "nowrap" || el.style.whiteSpace == "") {
        el.style.whiteSpace = "normal";
        el.style.wordWrap = "break-word";
        el.style.overflow = "normal";
    } else {
        el.style.overflow = "hidden";
        el.style.whiteSpace = "nowrap";
        el.style.wordWrap = "";
    };
}

function show_login_help() {
    document.getElementById('black').style.display = "block";
    help_win = document.getElementById('login_help');
    help_win.style.opacity = 1;
    help_win.style.display = 'block';
}

function hide_login_help() {
    document.getElementById('black').style.display = "none";
    document.body.style.backgroundColor = "";
    help_win = document.getElementById('login_help');
    help_win.style.display = 'none';
}