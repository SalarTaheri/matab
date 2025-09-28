/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyColumn', [function directive() {
        return {
            restrict: 'E',
            require: 'surveyTable',
            link: function (scope, element, attrs, ctrl) {
                //ctrl.pushColumn(
                //    {
                //        label: attrs['label']
                //    });
            }
        };
    }]);
})();
