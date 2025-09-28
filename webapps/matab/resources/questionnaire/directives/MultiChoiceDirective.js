/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyMultiChoice', [function () {
        return {
            restrict: 'E',
            transclude: true,
            scope: {
                label: '@',
                //options: '@',
                field: '@',
                answer: '='
            },
            require: ['^surveyPage', '?^surveyGroup'],
            templateUrl: '../../../../resources/questionnaire/views/directive/multiChoice.html',
            link: function($scope, element, attrs, ctrls){
                if($scope.label){
                    var ctrl = _.last(_.compact(ctrls));
                    $scope.currentQuestionNumber = ctrl.questionNumber || 1;
                    ctrl.questionNumber = $scope.currentQuestionNumber + 1;
                }
            },
            controller: function($scope, $parse, $filter, Part){
                var options = [];
                this.pushOption = function (option) {
                    option.id = $filter('ToValidId')(option.label);
                    options.push(option);
                    $scope.fixedOptions = options;
                };

                $scope.uniq_name = new Date().getMilliseconds();
            }
        };
    }]);
})();
