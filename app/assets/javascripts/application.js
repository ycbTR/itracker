// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .


jQuery(function () {
    $('form').on('click', '.remove_fields', function (event) {
        $(this).closest('.field').remove();
        return event.preventDefault();
    });
    return $('form').on('click', '.add_fields', function (event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $(this).before($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });
});


var ready;
ready = function () {

    $('.icon-calendar').click(function () {
        $(this).prev('.dpicker').focus();
    });

    initialize_range_datepicker();

    $('.datepicker.dpicker').ready(function () {
        var datepicker = $('.datepicker.dpicker').datepicker({
            format: "dd-mm-yyyy"
        }).on('changeDate',function (ev) {
                datepicker.hide();
            }).data('datepicker');
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);


initialize_range_datepicker = function () {

    var start_date = $('#dpd1').datepicker({
        format: "dd-mm-yyyy"
    }).on('changeDate',function (ev) {
            if (ev.date.valueOf() > end_date.date.valueOf()) {
                var newDate = new Date(ev.date)
                newDate.setDate(newDate.getDate() + 1);
                end_date.setValue(newDate);
            }
            start_date.hide();
            $('#dpd2')[0].focus();
        }).data('datepicker');
    var end_date = $('#dpd2').datepicker({
        format: "dd-mm-yyyy",
        onRender: function (date) {
            return date.valueOf() <= start_date.date.valueOf() ? 'disabled' : '';
        }
    }).on('changeDate',function (ev) {
            end_date.hide();
        }).data('datepicker');

};