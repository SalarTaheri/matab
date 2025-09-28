
(function () {
    'use strict';
    surveyModule.directive('spy', ['$location', '$anchorScroll', function directive($location, $anchorScroll) {
        return {
            restrict: "A",
            require: "^scrollSpy",
            link: function(scope, elem, attrs, affix) {
                elem.click(function () {
                    $location.hash(attrs.spy);
                    $anchorScroll();
                });

                affix.addSpy({
                    id: attrs.spy,
                    in: function() {
                        elem.addClass('active');
                    },
                    out: function() {
                        elem.removeClass('active');
                    }
                });
            }
        };
    }]);
})();
