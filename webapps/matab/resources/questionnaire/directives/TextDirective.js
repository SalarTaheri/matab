/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyText', [function () {
        return {
            restrict: 'E',
            scope: {
                label: '@',
                partial: '@',
                field: '@',
                answer: '='
            },
            require: ['^surveyPage', '?^surveyGroup'],
            templateUrl: '../../../../resources/questionnaire/views/directive/text.html',
            link: function(scope, element, attrs, ctrls){
            	if(scope.partial)
            		return;
                var ctrl = _.last(_.compact(ctrls));
                scope.currentQuestionNumber = ctrl.questionNumber || 1;
                ctrl.questionNumber = scope.currentQuestionNumber + 1;
            }
        };
    }]);
})();
