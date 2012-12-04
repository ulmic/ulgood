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
    document.getElementById('count').innerHTML = 100-len;
}