/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyYesNo', [function () {
        return {
            restrict: 'E',
            transclude: true,
            scope: {
                label: '@',
                field: '@',
                answer: '='
            },
            require: ['^surveyPage', '?^surveyGroup'],
            templateUrl: '../../../../resources/questionnaire/views/directive/yesNo.html',
            link: function(scope, element, attrs, ctrls){
                var ctrl = _.last(_.compact(ctrls));
                scope.currentQuestionNumber = ctrl.questionNumber || 1;
                ctrl.questionNumber = scope.currentQuestionNumber + 1;
            }
        };
    }]);
})();
