/**
 * Created by Rasoul on 3/15/2015.
 */

(function () {
    'use strict';
    surveyModule.directive('surveyPage', [function directive() {
        return {
            restrict: 'E',
            transclude: true,
            scope: {
                answer: '=',
                title: '@',
                patientId: '@',
                recordNumber: '@'
                //save: '&'
            },
            compile: function () {
	            return {
	                post : function(scope, element, attributes){
	                	/*	
	                    scope.$watch('myDirectiveWatch', function(newVal, oldVal){
	                        if (newVal !== oldVal) {
	                            // Do stuff ...
	                        }
	                    });*/
	                    $.material.init();	
	                    
	                }
	            }
                
            },
            controller: function($scope, $parse, $filter, Part, Patient, DataExcelExport){
                this.sections = [];
                $scope.kendoComboBox = [];
                
                this.registerKendoComboBox = function (field, kendo) {
                	if(kendo && kendo.length == 1){
                		var pre = _.find($scope.kendoComboBox, { 'field': field});
                		if(!pre)
                			$scope.kendoComboBox.push({'field': field, 'kendo' : kendo});
                	}                    
                };

                $scope.sections = [];
                this.pushSection = function (section) {
                    $scope.sections.push(section);
                };

                $scope.goToSection = function (section) {
                    $scope.currSection = section;
                    var sec = $filter('ToValidId')(section);
                    $('html,body').animate({scrollTop: $('#' + sec).offset().top - 150}, 800);
                };
				
                $scope.save = function() {
                    var Answers = {};
                    for(var path in $scope.answer){
                        $parse(path).assign(Answers, $scope.answer[path]);
                    }
                    var part = new Part({
                        title:$scope.title,
                        patientId:$('#patientId').val(),
                        _id:$scope.part_id,
                        answers: Answers
                    });
                    if($scope.part_id){
                    	part.$update(function(response) {
                    		if(response.state=='success'){
                    			alertify.success(response.message);
                    		}else{
                    			alertify.error("result.errors");
                    		}
                    	});
                    
                    }else{
                    	part.$save(function(response) {
                    		if(response.state=='success'){
                    			alertify.success(response.message);
                    		}else{
                    			alertify.error("result.errors");
                    		}
                    		
                    	});
                    }

                };

                $scope.load = function() {

                    Patient.get({id:$('#patientId').val(),recordNumber:$('#recordNumber').text()}, function(part) {
                        $scope.answer = window.flat.flatten(part.answers);                        
                        $scope.part_id=part._id;
                        
                        _.forEach($scope.kendoComboBox, function(item) {
							var val = $scope.answer[item.field];
							item.kendo.data("kendoComboBox").value(val);
						});
                        
                        //console.log($scope.answer);
                    });
                };

				$scope.nextRecord = function() {
					var x=parseInt($('#recordNumber').text()) ;
					x=x+1;
					$('#recordNumber').text(x.toString());
					$scope.load();
				}
				
				$scope.previousRecord = function() {
					var x=parseInt($('#recordNumber').text()) ;
					if(x-1<0){
						$('#recordNumber').text("1000");
					}else{
					x=x-1;
						$('#recordNumber').text(x.toString());
					}
					$scope.load();
				}

				$scope.exportToExcel = function() {
					 var table = document.getElementById('testTable');
					 DataExcelExport.get({id:$('#patientId').val()}, function(data) {
					
					 
	            	  var uri = 'data:application/vnd.ms-excel;base64,'
    					, template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>'+data.exportMessage+'</table></body></html>'
    					, base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    					, format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
						var ctx = {worksheet: $scope.title || 'Worksheet', table: table.innerHTML}
						window.location.href = uri + base64(format(template, ctx))    
					 console.log('-----------------------------------------');
                    });
				}

				$scope.backUrl = function() {
                    //Patient.get({id:$('#patientId').val()}, function(part) {
                    //    console.log(part);
                    //    console.log(part.part);
                    //    console.log(part.answers);
                    //    $scope.answer = window.flat.flatten(part.answers);
                    //    console.log($scope.answer);
                    //});
                     window.location=basePath+'/'+$('#patientId').val();
                     console.log(basePath+'/'+$('#patientId').val());
                };
				
                $scope.clean = function() {
                    $scope.answer = {};
                    _.forEach($scope.kendoComboBox, function(item) {						
						item.kendo.data("kendoComboBox").value(null);
					});
                };

                //$scope.currentPageNumber = $scope.$parent.pageNumber || 1;
                //$scope.$parent.pageNumber = $scope.currentPageNumber + 1;
            },
            templateUrl: '../../../../resources/questionnaire/views/directive/page.html'
        };
    }]);
})();
