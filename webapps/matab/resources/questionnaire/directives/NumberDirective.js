/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyNumber', [function () {
        return {
            restrict: 'E',
            scope: {
                label: '@',
                field: '@',
                partial: '@',
                answer: '='
            },
            require: ['^surveyPage', '?^surveyGroup'],
            link: function(scope, element, attrs, ctrls){
            	if(scope.partial)
            		return;
                var ctrl = _.last(_.compact(ctrls));
                scope.currentQuestionNumber = ctrl.questionNumber || 1;
                ctrl.questionNumber = scope.currentQuestionNumber + 1;
            },
            templateUrl: '../../../../resources/questionnaire/views/directive/number.html'
        };
    }]);
})();
