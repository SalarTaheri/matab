/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyTable', [function directive() {
        return {
            restrict: 'E',
            transclude: true,
            scope: {
                rows: '@',
                title: '@',
                answer: '='
            },
            require: '^surveyPage',
            //columns: [],
            //compile: function (element, attr, linker) {
            //
            //    var cols = element.find('ng-transclude').children();
            //    _.forEach(cols, function (rawElem) {
            //        var elem = angular.element(rawElem);
            //        var label = elem.attr('label');
            //        elem.attr('label', '');
            //        elem.attr('partial', 'true');
            //        this.columns.push({label: label})
            //    })
            //},
            link: function(scope, element, attrs, ctrl, transclude){
                scope.currentQuestionNumber = ctrl.questionNumber || 1;
                ctrl.questionNumber = scope.currentQuestionNumber + 1;

                scope.element = element;

            },
            controller: function($scope, $timeout, $compile){
                $scope.index = 1;
                $scope.$watch('element', function(value) {
                    if(value){
                        var cols = $scope.element.find('ng-transclude').children();
                        $scope.columns = [];
                        _.forEach(cols, function (rawElem) {
                            var elem = angular.element(rawElem);
                            var label = elem.attr('label');
                            $scope.columns.push({label: label})
                        });


                        var tableColPlaceHolder = $scope.element.find('.table-col-place-holder');
                        var transcludes = $scope.element.find('ng-transclude').children();
                        _.forEach(transcludes, function (transclude) {
                            var elem = angular.element(transclude).clone();
                            elem.removeAttr('label');
                            tableColPlaceHolder.append(angular.element('<td/>').append($compile(elem)($scope)));
                        });

                        tableColPlaceHolder.append($scope.element.find('.table-col-action').detach());
                        $scope.element.find('.table-col-action-holder').remove();
                        $scope.element.find('ng-transclude').remove();

                    }
                });

                $scope.handleRow = function ($event) {
                    var elem  = angular.element($event.currentTarget);
                    var action = elem.data('action');
                    if(action == 'add'){
                        elem.find('.ripple-wrapper').remove();
                        var clone = elem.parent().parent().clone();

                        elem.data('action', 'remove');
                        elem.find('i').removeClass('mdi-content-add').addClass('mdi-content-clear');
                        elem.removeClass('btn-success').addClass('btn-default');
                        angular.element("*", clone).removeAttr("ng-repeat");
                        var questions = clone.find('[answer]');
                        questions.removeAttr('label');
                        _.forEach(questions, function (rawElem) {
                            var elem = angular.element(rawElem);
                            var field = elem.attr('field');
                            field = field.replace(/\[\d\]/, '[' + $scope.index + ']');
                            elem.attr('field', field);
                        });

                        var compiledElement = $compile(clone)($scope);
                        elem.parent().parent().parent().append(compiledElement);
                        $scope.index ++;
                    }
                    if(action == 'remove'){
                        elem.parent().parent().remove();
                    }

                };

            },
            templateUrl: '../../../../resources/questionnaire/views/directive/table.html'
        };
    }]);
})();
