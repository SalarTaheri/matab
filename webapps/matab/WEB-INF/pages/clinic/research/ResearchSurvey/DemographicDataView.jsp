
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<html>
<head>
</head>   
<base:surveyImport></base:surveyImport>    
<body ng-app="survey" ng-controller="surveyTestPageController">

	<input type="hidden" id="patientId" value="${patientId}">
	<div class="" >
	    <survey-page title="Demographic Data" answer="answer">
	        <survey-group title="Data Source" >
	            <survey-number label="Site Of Registery" field="Data_Source.Site_Of_Registery" answer="answer"></survey-number>
	            <survey-date label="Date Of Registry" field="Data_Source.Date_Of_Registry" answer="answer"></survey-date>
	            <survey-text label="Definite DX" field="Data_Source.Definite_DX" answer="answer"></survey-text>
	            
	            <survey-single-choice answer="answer" label="Source Of Registry" field="Data_Source.Source_Of_Registry" >
	                <survey-option label="patient" ></survey-option>
	                <survey-option label="family" ></survey-option>
	                <survey-option label="files" ></survey-option>
	                <survey-option label="other" ></survey-option>
	            </survey-single-choice>

	            <survey-single-choice answer="answer" label="Referal" field="Data_Source.Referal" >
	                <survey-option label="Dr.Zali" ></survey-option>
	                <survey-option label="Talegani Hospital" ></survey-option>
	            </survey-single-choice>

	            <survey-text label="Questioner" field="Data_Source.Questioner" answer="answer"></survey-text>
	            <survey-text label="Researcher" field="Data_Source.Researcher" answer="answer"></survey-text>
	            <survey-text label="Operator" field="Data_Source.Operator" answer="answer"></survey-text>
            
	        </survey-group>
	        <survey-group title="Pathological Block">
	            <survey-yes-no answer="answer" label="Pathological Report" field="Pathological_Block.Pathological_Report.value" >
		            <survey-text label="Path Lab Name" field="Pathological_Block.Path_Lab_Name" answer="answer"></survey-text>
	            	<survey-text label="Path Lab City" field="Pathological_Block.Path_Lab_City" answer="answer"></survey-text>
	            	<survey-date label="Report Date" field="Pathological_Block.Report_Date" answer="answer"></survey-date>
	            	<survey-text label="Report Serial Number" field="Pathological_Block.Report_Serial_Number" answer="answer"></survey-text>
	            	<survey-number label="Number Of Pathological Block" field="Pathological_Block.Number_Of_Pathological_Block" answer="answer"></survey-number>
	            </survey-yes-no>
	        </survey-group>
	        <survey-group title="Blood Sample" >
	            <survey-yes-no answer="answer" label="Blood Sample" field="Blood_Sample.Blood_Sample.value">
		            <survey-text label="Code of blood" field="Pathological_Block.Code_of_blood" answer="answer" partial="true"></survey-text>
	            </survey-yes-no>
	        </survey-group>
	        <survey-group title="Hostiptal Name" >
		            <survey-text label="Hostiptal Name" field="Hostiptal_Name.Hostiptal_Name" answer="answer"></survey-text>
		            <survey-text label="Medical Record Number" field="Hostiptal_Name.Medical_Record_Number" answer="answer"></survey-text>
		            <survey-date label="Adm Date" field="Hostiptal_Name.Adm_Date" answer="answer"></survey-date>
		            <survey-date label="Disch Date" field="Hostiptal_Name.Disch_Date" answer="answer"></survey-date>
	        </survey-group>
	        <survey-group title="Patient Identification" answer="answer">
		            <survey-text label="First Name" field="Patient_Identification.First_Name" answer="answer"></survey-text>
		            <survey-text label="Last Name" field="Patient_Identification.Last_Name" answer="answer"></survey-text>
		            <survey-text label="Father Name" field="Patient_Identification.Father_Name" answer="answer"></survey-text>
		            <survey-text label="ID Number" field="Patient_Identification.ID_Number" answer="answer"></survey-text>
		            <survey-text label="Issued From" field="Patient_Identification.Issued_From" answer="answer"></survey-text>
		            <survey-text label="Social Security Number" field="Patient_Identification.Social_Security_Number" answer="answer"></survey-text>
		            <survey-text label="Primary Insurance Payer" field="Patient_Identification.Primary_Insurance_Payer" answer="answer"></survey-text>
		            <survey-text label="Insurance Number" field="Patient_Identification.Insurance_Number" answer="answer"></survey-text>
		            
					<survey-group title="Address">
			            <survey-text label="State" field="Patient_Identification.Address.State" answer="answer"></survey-text>
			            <survey-text label="City or Village" field="Patient_Identification.Address.City_or_Village" answer="answer"></survey-text>
			            <survey-text label="Zip Code" field="Patient_Identification.Address.Zip_Code" answer="answer"></survey-text>
			            <survey-text label="Home" field="Patient_Identification.Address.Home" answer="answer"></survey-text>
			            <survey-text label="Job" field="Patient_Identification.Address.Job" answer="answer"></survey-text>
			            <survey-text label="Home Phone" field="Patient_Identification.Address.Home_Phone" answer="answer"></survey-text>
			            <survey-text label="Job Phone" field="Patient_Identification.Address.Job_Phone" answer="answer"></survey-text>
			            <survey-text label="Cell Phone" field="Patient_Identification.Address.Cell_Phone" answer="answer"></survey-text>
			            <survey-text label="Mail Box" field="Patient_Identification.Address.Mail_Box" answer="answer"></survey-text>
			            <survey-text label="E Mail" field="Patient_Identification.Address.E_Mail" answer="answer"></survey-text>
					</survey-group>
	        </survey-group>
	        <survey-group title="Secondary Contact" answer="answer">
				<survey-single-choice answer="answer" label="Relationship" field="Secondary_Contact.Relationship" >
	                <survey-option label="Son / Daughter" ></survey-option>
	                <survey-option label="Parent" ></survey-option>
	                <survey-option label="Grandparent" ></survey-option>
	                <survey-option label="Spouse" ></survey-option>
	                <survey-option label="Sibling" ></survey-option>
	                <survey-option label="Other Relation" ></survey-option>
	                <survey-option label="Friend" ></survey-option>
	                <survey-option label="Institution" ></survey-option>
	                <survey-option label="Doctor" ></survey-option>
	                <survey-option label="Other" ></survey-option>
	            </survey-single-choice>
				<survey-text label="First Name" field="Secondary_Contact.First_Name" answer="answer"></survey-text>	        
				<survey-text label="Last Name" field="Secondary_Contact.Last_Name" answer="answer"></survey-text>
				<survey-group title="Secondry Address">
			            <survey-text label="State" field="Secondary_Contact.Address.State" answer="answer"></survey-text>
			            <survey-text label="City or Village" field="Secondary_Contact.Address.City_or_Village" answer="answer"></survey-text>
			            <survey-text label="Zip Code" field="Secondary_Contact.Address.Zip_Code" answer="answer"></survey-text>
			            <survey-text label="Home" field="Secondary_Contact.Address.Home" answer="answer"></survey-text>
			            <survey-text label="Job" field="Secondary_Contact.Address.Job" answer="answer"></survey-text>
			            <survey-text label="Home Phone" field="Secondary_Contact.Address.Home_Phone" answer="answer"></survey-text>
			            <survey-text label="Job Phone" field="Secondary_Contact.Address.Job_Phone" answer="answer"></survey-text>
			            <survey-text label="Cell Phone" field="Secondary_Contact.Address.Cell_Phone" answer="answer"></survey-text>
			            <survey-text label="Mail Box" field="Secondary_Contact.Address.Mail_Box" answer="answer"></survey-text>
			            <survey-text label="E Mail" field="Secondary_Contact.Address.E_Mail" answer="answer"></survey-text>
				</survey-group>	        
	        </survey-group>
	        <survey-group title="Patient Personal Information" answer="answer">
	        	<survey-date label="Birth Date" field="Patient_Personal_Information.Birth_Date" answer="answer"></survey-date>
	        	<survey-number label="Age" field="Patient_Personal_Information.Age" answer="answer"></survey-number>
	        	<survey-text label="Place Of Birth" field="Patient_Personal_Information.Place_Of_Birth" answer="answer"></survey-text>
	            <survey-single-choice answer="answer" label="Sex" field="Patient_Personal_Information.Sex" >
	                <survey-option label="Male" ></survey-option>
	                <survey-option label="Female" ></survey-option>
	                <survey-option label="Other (Hermaphrodite)" ></survey-option>
	                <survey-option label="Transsexual" ></survey-option>
	                <survey-option label="Unkown" ></survey-option>
	            </survey-single-choice>

	            <survey-single-choice answer="answer" label="Marital Sataus" field="Patient_Personal_Information.Marital_Sataus" >
	                <survey-option label="Single" ></survey-option>
	                <survey-option label="Married" ></survey-option>
	                <survey-option label="Seperated" ></survey-option>
	                <survey-option label="Divorced" ></survey-option>
	                <survey-option label="Widowed" ></survey-option>
	                <survey-option label="Unkown" ></survey-option>
	            </survey-single-choice>

	            <survey-single-choice answer="answer" label="Ethnicity" field="Patient_Personal_Information.Ethnicity" >
	                <survey-option label="Fars" ></survey-option>
	                <survey-option label="Kord" ></survey-option>
	                <survey-option label="Lor" ></survey-option>
	                <survey-option label="Turk" ></survey-option>
	                <survey-option label="Balooch" ></survey-option>
	                <survey-option label="Torkaman" ></survey-option>
	                <survey-option label="Arab" ></survey-option>
	                <survey-option label="Gilani" ></survey-option>
	                <survey-option label="Mazandarani" ></survey-option>
	                <survey-option label="Afghan" ></survey-option>
	                <survey-option label="Unkown" ></survey-option>
	            </survey-single-choice>
	            <survey-single-choice answer="answer" label="Religion" field="Patient_Personal_Information.Religion" >
	                <survey-option label="Muslim" ></survey-option>
	                <survey-option label="Christian" ></survey-option>
	                <survey-option label="Jewish" ></survey-option>
	                <survey-option label="Bahai" ></survey-option>
	                <survey-option label="Zoroastrian" ></survey-option>
	                <survey-option label="Other" ></survey-option>
	                <survey-option label="Unkown" ></survey-option>
	            </survey-single-choice>
				<survey-number label="Weight (kg)" field="Patient_Personal_Information.Weight" answer="answer"></survey-number>
				<survey-number label="Height (cm)" field="Patient_Personal_Information.Height" answer="answer"></survey-number>
	            
	            <survey-single-choice answer="answer" label="Immigration Status" field="Patient_Personal_Information.Immigration_Status" >
	                <survey-option label="Original Iranian" ></survey-option>
	                <survey-option label="Immigrated to Iran" >
	                	<survey-text label="Immigration From" field="Patient_Personal_Information.Immigration_From" answer="answer"></survey-text>
	                </survey-option>
	            </survey-single-choice>
	            
	            
	        	<survey-text label="Occupation (current or must recent)" field="Patient_Personal_Information.Occupation" answer="answer"></survey-text>
	        	<survey-text label="Longest Occupation" field="Patient_Personal_Information.Longest_Occupation" answer="answer"></survey-text>
	        	<survey-text label="Industry" field="Patient_Personal_Information.Industry" answer="answer"></survey-text>
	        	<survey-text label="Longest Industry" field="Patient_Personal_Information.Longest_Industry" answer="answer"></survey-text>
	        	<survey-single-choice answer="answer" label="Education" field="Patient_Personal_Information.Education" >
	                <survey-option label="Illiterate" ></survey-option>
	                <survey-option label="Primary School" ></survey-option>
	                <survey-option label="High School" ></survey-option>
	                <survey-option label="Bachelor of Science" ></survey-option>
	                <survey-option label="Master of Science" ></survey-option>
	                <survey-option label="PhD - MD" ></survey-option>
	                <survey-option label="Unknown" ></survey-option>
	                <survey-option label="Other" >
	                	<survey-text label="If so please specify" field="Patient_Personal_Information.If_so_please_specify" answer="answer"></survey-text>
	                </survey-option>
	            </survey-single-choice>
	        	<survey-number label="Number Of Children" field="Patient_Personal_Information.Number_Of_Children" answer="answer"></survey-number>
	        	<survey-date label="Date of 1st Diagnosis" field="Patient_Personal_Information.Date_of_1st_Diagnosis" answer="answer"></survey-date>
	        	<survey-text label="First Diagnosis" field="Patient_Personal_Information.First_Diagnosis" answer="answer"></survey-text>
	        	<survey-single-choice answer="answer" label="Marital Sataus At Diagnosis" field="Patient_Personal_Information.Marital_Sataus_At_Diagnosis" >
	                <survey-option label="Single" ></survey-option>
	                <survey-option label="Married" ></survey-option>
	                <survey-option label="Seperated" ></survey-option>
	                <survey-option label="Divorced" ></survey-option>
	                <survey-option label="Widowed" ></survey-option>
	                <survey-option label="Unkown" ></survey-option>
	            </survey-single-choice>
	        </survey-group>
	        
	        
	    </survey-page>
	</div>
</body>