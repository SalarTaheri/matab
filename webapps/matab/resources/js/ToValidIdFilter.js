/**
 * Created by Rasoul on 3/16/2015.
 */

(function () {
    'use strict';
    angular.module('mean.survey').filter('ToValidId', [function () {
        return function (id) {
            return id.replace(/\s/ig,"_").replace(/\(/ig,"_").replace(/\)/ig,"_").replace(/\//ig,"_");
        };
    }]);
})();