'use strict';

/* jshint -W098 */
surveyModule.controller('surveyTestPageController', ['$scope',
    function ($scope) {
        $scope.answer = {};
        $scope.showAnswer = function () {
            console.log($scope.answer);
        };
        $scope.package = {
            name: 'survey'
        };
    }
]);

surveyModule.factory('Part', ['$resource',
   function($resource) {
       return $resource('survey/part/:id', {
   id: '@_id'
   }, {
       update: {
           method: 'PUT'
               }
           });
       }
   ]);

surveyModule.factory('Patient', ['$resource',
                              function($resource) {
                                  return $resource('survey/patient/:id/:recordNumber', {
                                	  id: '@_id',
                                	  recordNumber: '@_recordNumber'
                                	  
                              }, {
                                  update: {
                                      method: 'PUT'
                                          }
                                      });
                                  }
                              ]);
                              
surveyModule.factory('DataExcelExport', ['$resource',
                              function($resource) {
                                  return $resource('survey/exportToExcel/:id', {
                                	  id: '@_id',
                                	  recordNumber: '@_recordNumber'
                                	  
                              }, {
                                  update: {
                                      method: 'PUT'
                                          }
                                      });
                                  }
                              ]);                              