function mouseIn(elem) {
    var img = $(elem.parentNode.parentNode).find('.img-list');

    img[0].classList.add('add_color');
}

function mouseOut(elem) {
    var img = $(elem.parentNode.parentNode).find('.img-list');

    img[0].classList.remove('add_color');
}
