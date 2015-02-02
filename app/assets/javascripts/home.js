$(function () {


var match = $.inArray(htmlthing, steps);

var steps = [
    "very sad",
    "sad",
    "not so sad",
    "happy",
    "very happy"
];

$(function() {
    $(".ap-test").slider({
        value: 1,
        min: 0,
        max: 4,
        step: 1,
        slide: function(event, ui) {
            $("#hint").html(steps[ui.value]);
        }
    });
    $("#hint").val(steps[$(".ap-test").slider("value")]);
});







/*var text = {
    1: "bad",
    2: "okay",
    3: "better",
    4: "great",
    5: "awesome"
};
var $sliderText = $('#hint');

var refresh = function (e) {
    $sliderText.text(text[$('.ap-test').slider('value')]);
};
$(function () {
    $('.ap-test').slider({
        min: 1,
        max: 5,
        slide: refresh,
        change: refresh
    });
    refresh();
});*/





});
