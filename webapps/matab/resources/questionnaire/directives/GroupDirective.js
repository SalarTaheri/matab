/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyGroup', ['$compile', function directive($compile) {
        return {
            restrict: 'E',
            transclude: true,
            scope: {
                title: '@'
            },
            require: '^surveyPage',
            link: function(scope, element, attrs, ctrl){
                scope.currentQuestionNumber = ctrl.questionNumber || 1;
                ctrl.questionNumber = scope.currentQuestionNumber + 1;
                ctrl.pushSection(attrs['title']);
            },
            controller: function($scope){
                $scope.currentQuestionNumber = $scope.$parent.questionNumber || 1;
                $scope.$parent.questionNumber = $scope.currentQuestionNumber + 1;
            },
            templateUrl: '../../../../resources/questionnaire/views/directive/group.html'
        };
    }]);
})();
