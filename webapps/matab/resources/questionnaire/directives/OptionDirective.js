/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyOption', [function directive() {
        return {
            restrict: 'E',
            //scope: {
            //    label: '@',
            //    value: '?@'
            //},
            require: ['?^surveySingleChoice', '?^surveyMultiChoice'],
            link: function(scope, element, attrs, ctrls){
                var ctrl = _.last(_.compact(ctrls));
                ctrl.pushOption(
                    {
                        label: attrs['label'],
                        value: attrs['value'] || attrs['label']
                    });
            }
        };
    }]);
})();
