/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyDate', ['$timeout', function ($timeout) {
        return {
            restrict: 'E',
            scope: {
                label: '@',
                partial: '@',
                field: '@',
                answer: '='
            },
            compile: function () {
            	$timeout(function(){
            		$(".pasha-datepicker").kendoDatePicker();
            		$(".pasha-datepicker").removeClass("pasha-datepicker");
            		
            		$(".k-datepicker").each(function(){
            			this.checkValidity = function(){
            				return true;
        				}
            		});
            	}, 500);
            	
            	
            	
            	return function(scope, element, attrs, ctrls){
                	if(scope.partial)
                		return;
                    var ctrl = _.last(_.compact(ctrls));
                    scope.currentQuestionNumber = ctrl.questionNumber || 1;
                    ctrl.questionNumber = scope.currentQuestionNumber + 1;
                }
            },
            require: ['^surveyPage', '?^surveyGroup'],
            templateUrl: '../../../../resources/questionnaire/views/directive/date.html',
            
        };
    }]);
})();
