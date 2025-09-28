<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div>
	<input id="lebTestForSave" type="hidden" >
	<input id="popupPatientId" type="hidden" >
</div>
<div class="body-header">
    <ul class="uk-breadcrumb uk-h3" id="breadcrumb">
        <li id="breadcrumb-main-section"><span>${pageTitle}</span>
        </li>
    </ul>
    <div id="header-toolbar">
    	<button class="uk-button" type="button" id="p-btn-save">Save&nbsp;<i class="uk-icon-save"></i></button>
    	
    	
        <div id="p-card-navigator" style="display: inline;" >
            <div class="uk-button-group">
                <button class="uk-button" type="submit" id="p-visit-right"><a href=""><i class="uk-icon-arrow-right"></i></a></button>
                <button class="uk-button" type="submit" id="p-visit-left"><a href=""><i class="uk-icon-arrow-left"></i></a></button>
                
            </div>
            <span id="p-visit-count">40</span>&nbsp;/&nbsp;
            <span id="p-visit-current">1</span>
        </div>
       
    </div>
    </div>

<div id="p-card-view-pageX" style="display: block;">
    
</div>

<script src="<c:url value='/resources/doT.js' />"></script>
<script src="<c:url value='/resources/clinic/clinic.js' />"></script>
<link href="<c:url value='/resources/clinic/clinic.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.js' />"></script>
<link href="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/jquery-textcomplete/bootstrap.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/jquery-textcomplete/main.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/sketch.js' />"></script>
<jsp:include page="../../ClinicTemplates.jsp"></jsp:include>
<jsp:include page="FileViewNoSqlJs.jsp"></jsp:include>


  
 
 <%--  <script src="<c:url value='/resources/jquery-1.9.1.js' />"></script> --%>
<script src="<c:url value='/resources/jquery-ui.js' />"></script>


<!--  chart Part   -->


<!-- <!--     <link href="styles/kendo.common.min.css" rel="stylesheet" />
    <link href="styles/kendo.default.min.css" rel="stylesheet" />
    <link href="styles/kendo.dataviz.css" rel="stylesheet" />
    <link href="styles/kendo.dataviz.default.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/kendo.all.min.js"></script>

 <div id="example" class="k-content absConf">
    <div class="chart-wrapper" style="margin: auto;">
        <div id="chart"></div>
    </div>
    <script>
        function createChart() {
            $("#chart").kendoChart({
               /*  dataSource: {
                    transport: {
                        read: {
                            url: "../../content/dataviz/js/spain-electricity.json",
                            dataType: "json"
                        }
                    },
                    sort: {
                        field: "year",
                        dir: "asc"
                    }
                }, */
                title: {
                    text: " اتاق فکر "
                },
                legend: {
                    position: "top"
                },
                seriesDefaults: {
                    type: "column",
                    stack: true
                    
                   /*    type:"bar",
                    stack: true */
                },
                series:
                [{
                   // field: "nuclear",
                    name: "تعداد کل آقایان",
                    stack: "Male",
                     data: [4, 7.943, 7.848, 9.284, 9.263, 9.801, 3.890, 8.238, 9.552, 6.855,3.907, 7.943, 7.848, 9.284, 9.263, 9.801, 3.890, 8.238, 9.552, 6.855]
                     
                }, {
                   // field: "hydro",
                    name: "تعداد کل بانوان" ,
                    stack: "Male",
                     data: [6, 7.295, 7.175, 6.376, 8.153, 8.535, 5.247, 7.832, 4.3, 4.3,3.907, 7.943, 7.848, 9.284, 9.263, 9.801, 3.890, 8.238, 9.552, 6.855]
                }, {
                   // field: "wind",
                    name: "آقایان دارای کارت بازرگانی" ,
                   stack: "Female",
                     data: [2, 0.375, 1.161, 0.684, 3.7, 3.269, 1.083, 5.127, 3.690, 2.995,0.010, 0.375, 1.161, 0.684, 3.7, 3.269, 1.083, 5.127, 3.690, 2.995]
                }, {
                   // field: "wind",
                    name: "بانوان دارای کارت بازرگانی" ,
                   stack: "Female",
                     data: [2, 0.375, 1.161, 0.684, 3.7, 3.269, 1.083, 5.127, 3.690, 2.995,0.010, 0.375, 1.161, 0.684, 3.7, 3.269, 1.083, 5.127, 3.690, 2.995]
                }],
              
               seriesColors: ["#EF4C00", "#007BC3", "#76B800", "#FFAE00"],
              
                valueAxis: {
                    labels: {
                        format: "N0"
                    },
                   // majorUnit: 10000,
                    line: {
                        visible: false
                    }
                },
                categoryAxis: {
                    categories: [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011,2012,2013,2014,2015,2016,2017,2018,2019,2020],
                    labels: {
                        rotation: -90
                    },
                    majorGridLines: {
                        visible: false
                    }
                },
                
                tooltip: {
                    visible: true,
                    format: "N0",
                     template: "#= series.name #: #= value #"
                }
            });
        }

        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
    </script>
</div> --> 


<!--  PopUp Part 1  -->


<!-- <div id="mydialog" title="Create new user"  style="display:none"> -->
  
<!--     <p class="validateTips">All form fields are required.</p> -->
<!--   <form> -->
<!--   <fieldset> -->
<!--     <label for="name">Name</label> -->
<!--     <input type="text" name="name" id="name"> -->
<!--     <label for="email">Email</label> -->
<!--     <input type="text" name="email" id="email" value="" > -->
<!--     <label for="password">Password</label> -->
<!--     <input type="password" name="password" id="password" value=""> -->
<!--     </fieldset> -->
    
<!--   </form> -->
<!-- </div> -->


<!--  <div id="mydialog" title="Dialog Title" style="display:none"> Some text</div>   -->

  <!--  PopUp Part 2  -->
  
<%-- <center><h1>Modal Window Demo</h1></center>   --%>
  
<%-- <p><a class='activate_modal' name='first_window' href='#'>First modal window.</a></p>   --%>
<%-- <p><a class='activate_modal' name='second_window' href='#'>Second modal window.</a></p>   --%>
<%-- <p><a class='activate_modal' name='third_window' href='#'>tree modal window.</a></p>   --%>

  
<%-- <div id='mask' class='close_modal'></div>   --%>
  
<%-- <div id='first_window' class='modal_window' style="display:none">This is the first modal window --%>
<%-- <p><a class='activate_modal' name='second_window' href='#'>Second modal window.</a></p> --%>
<%-- </div>   --%>
<%-- <div id='second_window' class='modal_window' style="display:none">Welcome to the second modal window --%>
<%-- <p><a class='activate_modal' name='third_window' href='#'>3 modal window.</a></p> --%>
<%-- </div>   --%>
<%-- <div id='third_window' class='modal_window' style="display:none">Welcome to the third modal window --%>
<%-- </div>   --%>

 



<div id="p-kanban-view-page" class="p-kanban-visit" style="overflow-y: scroll;overflow-x:hidden ; width: 100%;" dir="ltr">

 
	<div class="uk-grid p-kanban">
		<div class="uk-width-5-5 p-kanban-card">
			<h1 id="p-kanban-static-header">
				Patient Information
				<div class="uk-icon-angle-up"></div>
			</h1>
		</div>
	</div>

	<div class="uk-grid p-kanban p-kanban-fixed" id="p-kanban-static">
		<div class="uk-width-1-5 p-kanban-card">
	        <div class="uk-panel uk-panel-box">
	            <div class="p-kanban-pin uk-badge uk-panel-badge">
	                <img alt="" src="<c:url value='/resources/clinic/pin-blue.png'/>">
	            </div>
	            <h3 class="uk-panel-title">اطلاعات بیمار</h3>
	            <div class="p-card-links">
	                <a class="p-card-details" href="#">Details</a>
	            </div>
	        </div>
	    </div>
	    <div class="uk-width-1-5 p-kanban-card">
	        <div class="uk-panel uk-panel-box">
	            <div class="p-kanban-pin uk-badge uk-panel-badge">
	                <img alt="" src="<c:url value='/resources/clinic/pin-blue.png'/>">
	            </div>
	            <h3 class="uk-panel-title">پرونده بیمار</h3>
	            <div class="p-card-links">
	                <a class="p-card-details" href="#">Details</a>
	            </div>
	        </div>
	    </div>
	    <div class="uk-width-1-5 p-kanban-card">
	        <div class="uk-panel uk-panel-box">
	            <div class="p-kanban-pin uk-badge uk-panel-badge">
	             <!--    <img alt="" src="<c:url value='/resources/clinic/pin-blue.png'/>">  -->
	            </div>
	            <h3 class="uk-panel-title">گزارش آزمایش ها</h3>
	            <div class="p-card-links">
	                <a class="p-card-details" href="#">Details</a>
	            </div>
	        </div>
	    </div>
	    <div class="uk-width-1-5 p-kanban-card">
	        <div class="uk-panel uk-panel-box">
	            <div class="p-kanban-pin uk-badge uk-panel-badge">
	                <img alt="" src="<c:url value='/resources/clinic/pin-blue.png'/>">
	            </div>
	            <h3 class="uk-panel-title">اطلاعات بالینی</h3>
	            <div class="p-card-links">
	                <a class="p-card-details" href="#">Details</a>
	            </div>
	        </div>
	    </div>
	    <div class="uk-width-1-5 p-kanban-card">
	        <div class="uk-panel uk-panel-box">
	            <div class="p-kanban-pin uk-badge uk-panel-badge">
	          <!--       <img alt="" src="<c:url value='/resources/clinic/pin-blue.png'/>"> -->
	            </div>
	            <h3 class="uk-panel-title"></h3>
	            <div class="p-card-links">
	            <!--     <a class="p-card-details" href="#">Details</a> -->
	            </div>
	        </div>
	    </div>
	</div>
    
    <div id = "uk-Complaint" class="uk-grid p-kanban">
		<div class="uk-width-5-5 p-kanban-card" >
			<h1 id="p-kanban-Complaint-header">
				Chief Complaint & Present illness
				<div class="uk-icon-angle-up"></div>
			</h1>
			
		</div>
	</div>
	<div class="uk-width-1-1" id="p-kanban-static-descript">
		<textarea name="p-descript" id="p-descript" style="width:100% !important; height:100px; text-align: left"  >&nbsp;</textarea>
    </div>
  	
	 <div class="uk-grid p-kanban">
		<div class="uk-width-5-5 p-kanban-card" >
			<h1 id="p-kanban-physical-header">
				Physical examination
				<div class="uk-icon-angle-up"></div>
			</h1>
	<!-- 		<div class="uk-width-1-1">
				<textarea name="p-PhysicalExam" id="p-PhysicalExam" style="width:100% !important; height:100px; direction: rtl; text-align: right"  >&nbsp;</textarea>
    		</div>  -->
    		<%-- <div class="uk-width-1-1">
				<canvas id="simple_sketch"  style="width:100% !important; height:120px;"></canvas>
			<script type="text/javascript">
			  $(function() {
			    $('#simple_sketch').sketch();
			  });
			</script>
    		</div>		 --%>
    		
		</div>
	</div>
	
	<div class="uk-width-1-1">
		 <textarea name="p-PhysicalExam" id="p-PhysicalExam" style="width:100% !important; height:100px; text-align: left"  >&nbsp;</textarea>
    </div>
    
	<div class="uk-grid p-kanban">
		<div class="uk-width-5-5 p-kanban-card">
			<h1 id="p-kanban-diagnosis-header">
				Diagnosis
				
			</h1>
		 <select name="p-diagnosis" id="p-diagnosis"  multiple="multiple">
		 </select>
		</div>
	 </div>
			 
	 <div class="uk-grid p-kanban p-kanban-fixed" id="p-diagnosis-cards"></div>
	 
				
		
	
	  <div class="uk-grid p-kanban">
		<div class="uk-width-5-5 p-kanban-card">
			<h1 id="p-kanban-PastMedical-header">
				Past Medical History
				
			</h1>
		 <select name="p-MedicalHistory" id="p-MedicalHistory"  multiple="multiple">
		 </select>
		</div>
	 </div>
	 <!-- <div class="uk-grid p-kanban p-kanban-fixed" id="p-medicalHistory-cards"></div> -->
	<!--   <select name="p-MedicalHistory" id="p-MedicalHistory" style="width:100% !important;" multiple="multiple">
	  </select> -->
	  <!-- <select name="p-MedicalHistory" id="p-MedicalHistory"   style="width:100% !important;" multiple="multiple">
	   </select> -->
	  
	 
 
	 
	<!--  <div class="uk-grid p-kanban p-kanban-fixed" id="p-medicalhistory-cards"></div> -->
			
	 <div class="uk-grid p-kanban">
		<div class="uk-width-5-5 p-kanban-card">
			<h1 id="p-kanban-drug-header">
				Drug
				
			</h1>
			
		</div>
	</div>
	<select name="p-drug" id="p-drug"  multiple="multiple">
	</select>

	<!--     
	<div class="uk-grid p-kanban"><div class="uk-width-5-5 p-kanban-card"><hr /></div></div>

    <div class="uk-grid p-kanban " id="p-kanban-main">
    </div> 
    -->
    
	<div class="uk-grid p-kanban">
		<div class="uk-width-5-5 p-kanban-card">
			<h1 id="p-kanban-static-header">
				Paraclinic
				
			</h1>
			<select name="p-medical-test" id="p-medical-test"  multiple="multiple">
			</select>
		</div>
		
		<div class="uk-width-1-5 p-kanban-card">
	        <div class="uk-panel uk-panel-box" id="p-lab_test">
	            <div class="p-kanban-pin uk-badge uk-panel-badge" >
	                <img alt="" src="<c:url value='/resources/clinic/pin-blue.png'/>">
	            </div>
	            <h3 class="uk-panel-title"> Lab Test </h3>
	        <!--     <div class="p-card-links">
	                <a class="p-card-details" href="#">Details</a>
	            </div> -->
	        </div>
	    </div>
	    <div class="uk-width-1-5 p-kanban-card">
	        <div class="uk-panel uk-panel-box" id="p-imaging">
	            <div class="p-kanban-pin uk-badge uk-panel-badge">
	                <img alt="" src="<c:url value='/resources/clinic/pin-blue.png'/>">
	            </div>
	            <h3 class="uk-panel-title"> Imaging </h3>
	          <!--   <div class="p-card-links">
	                <a class="p-card-details" href="#">Details</a>
	            </div> -->
	        </div>
	    </div>
	</div>
    <div class="uk-grid p-kanban p-kanban-unused " id="p-kanban-unused">

    </div>
    
    	<div class="uk-grid p-kanban">
			<div class="uk-width-5-5 p-kanban-card">
				<h1 id="p-kanban-static-header">
					Paraclinic Result
					
				</h1>
				<!-- <select name="p-last-medical-test" id="p-last-medical-test"  multiple="multiple">
				</select> -->	
				
			</div>
			<div class="uk-width-1-5 p-kanban-card">
	        <div class="uk-panel uk-panel-box" id="p-lab_test_result">
	           
	            <h3 class="uk-panel-title"> Lab Test Result </h3>
	            <div class="p-card-links">
	              <!--   <a class="p-card-details" href="#">Details</a> -->
	               <!--  <button onclick="openLabResult()" class="uk-button" type="button" id="p-btn-labResult">Result&nbsp;</button> -->
	              <!--   <p><a class='activate_modal' name='first_window' href='#'>First modal window.</a></p> -->
	            </div>
	        </div>
	    </div>
	    <div class="uk-width-1-5 p-kanban-card">
	        <div class="uk-panel uk-panel-box">
	            <div class="p-kanban-pin uk-badge uk-panel-badge">
	                <img alt="" src="<c:url value='/resources/clinic/pin-blue.png'/>">
	            </div>
	            <h3 class="uk-panel-title"> Imaging Result </h3>
	           <!--  <div class="p-card-links">
	                <a class="p-card-details" href="#">Details</a>
	            </div> -->
	        </div>
	    </div>
			 
		</div>
      <div class="uk-grid p-kanban p-kanban-unused " id="p-kanban-unused">

      </div>
</div>

<div id="p-labTest-view-page" style="display: none;">

      <%-- <jsp:include page="../LabTestResult/LabTestResultView.jsp"></jsp:include>  --%>
   
        <div id="p-labTest-view-page">
        </div>
    
</div>

<div id="divId" style="display: none;" >
<%-- <jsp:include page="../LabTestResult/LabTestResultView.jsp"/> --%>
<form action="">
<jsp:include page="../../../hrm/employee/Employee/EmployeeView.jsp"/>  
</form>

</div>


  <div id="dialog-modal" title="Basic modal dialog"  style="display:none">
    <%-- <jsp:include page="popup"/>  --%>
   </div>

<div id="dialog" style="display:none"  >
    <iframe id="myIframe" src="" width="400" height="400"></iframe>
</div>

<div id="resultdialog" style="display:none"  >
    <iframe id="resultmyIframe" src="" width="600" height="430"></iframe>
</div>
   <!--

   <!-- Change 3 files to direct to your web server URL 
   <link rel="stylesheet" href="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/scripts/style.css" type="text/css" media="screen" />
  <!-- <script type="text/javascript" src="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/scripts/jquery.js"></script> 
  <script type="text/javascript" src="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/scripts/scripts.js"></script> 
  <!-- End Header URLs 

 <body>
   <div id="header"><div class="wrap">
   <div id="slide-holder">
<div id="slide-runner">
	<!-- Add your Image URL's Here 
    <a href=""><img src="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/images/nature-photo.png" id="slide-img-1" class="slide" alt="" /></a>
    <a href=""><img src="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/images/nature-photo1.png" id="slide-img-2" class="slide" alt="" /></a>
    <a href=""><img src="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/images/nature-photo2.png" id="slide-img-3" class="slide" alt="" /></a>
    <a href=""><img src="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/images/nature-photo3.png" id="slide-img-4" class="slide" alt="" /></a>
    <a href=""><img src="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/images/nature-photo4.png" id="slide-img-5" class="slide" alt="" /></a>
    <a href=""><img src="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/images/nature-photo4.png" id="slide-img-6" class="slide" alt="" /></a>
	<a href=""><img src="http://iwebunlimited.com/examples/image_sliders/beautiful_jquery/images/nature-photo6.png" id="slide-img-7" class="slide" alt="" /></a> 
	<!-- End Image URL's 
	
    <div id="slide-controls">
     <p id="slide-client" class="text"><strong>post: </strong><span></span></p>
     <p id="slide-desc" class="text"></p>
     <p id="slide-nav"></p>
    </div>
</div>
   </div>
   <!--content featured gallery here 
   <script type="text/javascript">
    if(!window.slider) var slider={};slider.data=[
    {"id":"slide-img-1","client":"add your title here","desc":"add your description here"},
    {"id":"slide-img-2","client":"add your title here","desc":"add your description here"},
    {"id":"slide-img-3","client":"add your title here","desc":"add your description here"},
    {"id":"slide-img-4","client":"add your title here","desc":"add your description here"},
    {"id":"slide-img-5","client":"add your title here","desc":"add your description here"},
    {"id":"slide-img-6","client":"add your title here","desc":"add your description here"},
    {"id":"slide-img-7","client":"add your title here","desc":"add your description here"}];
   </script>
  </div></div>
 </body>

-->
 