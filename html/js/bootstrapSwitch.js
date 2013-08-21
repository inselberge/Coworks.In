/**
 * Created by JetBrains PhpStorm.
 * User: Carl "Tex" Morgan
 * Date: 8/20/13
 * Time: 2:14 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
$('.change-color-switch').bootstrapSwitch('setOnClass', 'danger');
$('.change-color-switch').bootstrapSwitch('setOffClass', 'default');
$('.change-color-switch').bootstrapSwitch('setAnimated', true);
$('.change-color-switch').on('switch-change', function (e, data) {
    var $el = $(data.el)
        , value = data.value;
    console.log(e, $el, value);
});