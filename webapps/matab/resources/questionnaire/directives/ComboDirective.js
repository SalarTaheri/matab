/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyCombo', ['$timeout', function ($timeout) {
    	var surveyPageCtrl;
        return {
            restrict: 'E',
            scope: {
                label: '@',
                partial: '@',
                field: '@',
                answer: '='
            },
            compile: function (tElem, tAttrs) {
            	var kendo;
            	$timeout(function(){          		
            		var first = $(".pasha-combo").first();
            		first.removeClass("pasha-combo");
            		kendo = first.kendoComboBox({
                             placeholder: "Select ...",
                             dataTextField: "ComboCaption",
                             dataValueField: "ComboID",
                             filter: "contains",
                             autoBind: false,
                             minLength: 3,
                             type:"GET",
                             dataSource: {
                                 type: "json",
                                 serverFiltering: true,
                                 transport: {
                                     read: {
                                         dataType:"json",
                                         contentType:"application/json; charset=utf-8",
                                         url: "combo/loadAllDepartmentByUser",
                                     }
                                 }
                             }
                         });
            		
            		//$(".pasha-datepicker").kendoDatePicker();
            		$(".k-combobox").each(function(){
            			this.checkValidity = function(){
            				return true;
        				}
            		});
            		
            		if(surveyPageCtrl)
            			surveyPageCtrl.registerKendoComboBox(tAttrs.field, kendo);
            	});
            	
            	return function(scope, element, attrs, ctrls){
            		surveyPageCtrl =  ctrls[0];            		
                	if(scope.partial)
                		return;
                    var ctrl = _.last(_.compact(ctrls));
                    scope.currentQuestionNumber = ctrl.questionNumber || 1;
                    ctrl.questionNumber = scope.currentQuestionNumber + 1;                
                }
            },
            require: ['^surveyPage', '?^surveyGroup'],
            templateUrl: '../../../../resources/questionnaire/views/directive/combo.html',
            
        };
    }]);
})();
