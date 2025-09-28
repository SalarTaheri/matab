/**
 * Created by Rasoul on 3/16/2015.
 */

(function () {
    'use strict';
     surveyModule.filter('NumberPadding', [function () {
        return function (number, len) {
            var num = parseInt(number, 10);
            len = parseInt(len, 10);
            if (isNaN(num) || isNaN(len)) {
                return number;
            }
            num = '' + num;
            while (num.length < len) {
                num = '0'+num;
            }
            return num;
        };
    }]);
})();