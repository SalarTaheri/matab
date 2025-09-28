<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page contentType="text/html;charset=UTF-8"%>

<script type="text/javascript">
var pageDataSource = {
		title : "Data Source",
		qs : [
				{
					title : "Site Of Registery",
					type : "text",
				},
				{
					title : "Date Of Registry",
					type : "date",
				},
				{
					title : "Definite DX",
					type : "text",
				},
				{
					title : "Source Of Registry",
					type : "checkboxes",
					options : [
					           "Patient", 
					           "Family",
					           "Files", 
					           {
					        	   title : "Other", 
					        	   type : "text",
					           }
					]
					
				},
				{
					title : "Referal",
					type : "checkboxes",
					options : [
					           "Dr. Zali", 
					           "Talegani Hospital",
					           {
					        	   title : "Other", 
					        	   type : "text",
					           }
					]
					
				},
				{
					title : "Questioner",
					type : "text",
				},
				{
					title : "Researcher",
					type : "text",
				},
				{
					title : "Operator",
					type : "text",
				},
				{
					title : "Pathological Block",
					type : "group",
					qs : [
							{
								title : "Pathological Report",
								type : "yesno",
							},
							{
								title : "Path. Lab. Name",
								type : "text",
							},
							{
								title : "Path. Lab. City",
								type : "text",
							},
							{
								title : "Report Date",
								type : "date",
							},
							{
								title : "Report Serial Number",
								type : "text",
							},
							{
								title : "Number Of Pathological Block",
								type : "number",
							},
					]
				},
				{
					title : "Blood Sample",
					type : "yesnoif",
					ifYes: "Code of blood",
				},
				{
					title : "Hostiptal Name",
					type : "group",
					qs : [
							{
								title : "Name",
								type : "text",
							},
							{
								title : "Medical Record Number",
								type : "text",
							},
							{
								title : "Adm Date",
								type : "date",
							},
							{
								title : "Disch Date",
								type : "date",
							},						
					]
				},
		]
	};
var pagePatientIdentification = {
		title : "Patient Identification",
		qs : [
				{
					title : "First Name",
					type : "text",
				},
				{
					title : "Last Name",
					type : "text",
				},
				{
					title : "Father Name",
					type : "text",
				},
				{
					title : "ID Number",
					type : "text",
				},
				{
					title : "Issued From",
					type : "text",
				},
				{
					title : "Social Security Number",
					type : "text",
				},
				{
					title : "Primary Insurance Payer",
					type : "selectbox",
					multiple: true,
					max: 2,
					options: [
						"Not Insured",
						{ title: "Private Insurance", ifYes: "Name", type:"text"},
						"Insured, Governmental",
						"Insured, Social Security",
						"Insured, Military",
						"Insured, Charity",
						"Unkown",							
					]
				},
				{
					title : "Insurance Number",
					type : "text",
				},
				{
					title : "Address",
					type : "group",
					qs : [
							{
								title : "State",
								type : "text",
							},
							{
								title : "City or Village",
								type : "text",
							},
							{
								title : "Zip Code",
								type : "text",
							},
							{
								title : "Home",
								type : "text",
							},						
							{
								title : "Job",
								type : "text",
							},						
							{
								title : "Home Phone",
								type : "text",
							},						
							{
								title : "Job Phone",
								type : "text",
							},						
							{
								title : "Cell Phone",
								type : "text",
							},						
							{
								title : "Mail Box",
								type : "text",
							},						
							{
								title : "E-Mail",
								type : "text",
							},						
					]
				},
		]
	};
var pageSecondaryContact = {
		title : "Secondary Contact",
		qs : [
				{
					title : "Relationship",
					type : "selectbox",
					url : "",
					options: [
						"Son / Daughter",						
						"Parent",						
						"Grandparent",						
						"Spouse",						
						"Sibling",						
						"Other Relation",						
						"Friend",						
						"Institution",						
						"Doctor",						
						"Other",						
					]
				},
				{
					title : "First Name",
					type : "text",
				},
				{
					title : "Last Name",
					type : "text",
				},				
				{
					title : "Address",
					type : "group",
					qs : [
							{
								title : "State",
								type : "text",
							},
							{
								title : "City or Village",
								type : "text",
							},
							{
								title : "Zip Code",
								type : "text",
							},
							{
								title : "Home",
								type : "text",
							},						
							{
								title : "Job",
								type : "text",
							},						
							{
								title : "Home Phone",
								type : "text",
							},						
							{
								title : "Job Phone",
								type : "text",
							},						
							{
								title : "Cell Phone",
								type : "text",
							},						
							{
								title : "Mail Box",
								type : "text",
							},						
							{
								title : "E-Mail",
								type : "text",
							},						
					]
				},
		]
	};
var pagePatientPersonalInformation = {
		title : "Patient Personal Information",
		qs : [
				{
					title : "Birth Date",
					type : "date",
				},
				{
					title : "Age",
					type : "number",
				},
				{
					title : "Place Of Birth",
					type : "text",
				},
				{
					title : "Sex",
					type : "selectbox",
					options: [
						"Male",						
						"Female",						
						"Other (Hermaphrodite)",						
						"Transsexual",						
						"Unkown",						
					]
				},
				{
					title : "Marital Sataus",
					type : "selectbox",
					options: [
						"Single",						
						"Married",						
						"Seperated",						
						"Divorced",						
						"Widowed",		
						"Unkown",
					]
				},
				{
					title : "Ethnicity",
					type : "selectbox",
					multiple : true,
					max: 4,
					options: [
						"Fars",						
						"Kord",						
						"Lor",						
						"Turk",						
						"Balooch",		
						"Torkaman",		
						"Arab",		
						"Gilani",		
						"Mazandarani",		
						"Afghan",		
						"Unkown",
					]
				},
				{
					title : "Religion",
					type : "selectbox",
					options: [
						"Muslim",						
						"Christian",						
						"Jewish",						
						"Bahai",						
						"Zoroastrian",		
						"Other",		
						"Unkown",
					]
				},
				{
					title : "Weight (kg)",
					type : "number",
				},
				{
					title : "Height (cm)",
					type : "number",
				},				
				{
					title : "Immigration Status",
					type : "radio",
					options : [
					           "Original Iranian", 
					           "Immigrated to Iran",
					]
				},				
				{
					title : "Immigration From",
					type : "text",
				},				
				{
					title : "Occupation (current or must recent)",
					type : "text",
				},	
				{
					title : "Longest Occupation",
					type : "text",
				},	
				{
					title : "Industry",
					type : "text",
				},	
				{
					title : "Longest Industry",
					type : "text",
				},	
				{
					title : "Education",
					type : "selectbox",
					options: [
						"Illiterate",						
						"Primary School",						
						"High School",						
						"Bachelor of Science",						
						"Master of Science",		
						"PhD - MD",		
						"Other",
						"Unknown",
					]
				},
				{
					title : "Number of Children",
					type : "number",
				},	
				{
					title : "Date of 1st Diagnosis",
					type : "date",
				},	
				{
					title : "1st Diagnosis",
					type : "date",
				},	
				{
					title : "Marital Sataus at Diagnosis",
					type : "selectbox",
					options: [
						"Single",						
						"Married",						
						"Seperated",						
						"Divorced",						
						"Widowed",		
						"Unkown",
					]
				},
		]
	};
var pageMediacalHistory = {
		title : "Mediacal History",
		qs : [
				{
					title : "HBV Vaccination",
					type : "group",
					qs : [
					      {
					    	  	title : "Vaccination",
								type : "yesno",
					      },
					      {
					    	  	title : "Date",
								type : "date",
					      }
					]
				},
				{
					title : "History of any important disease",
					type : "yesnoif",
				},
				{
					title : "History of Surgery",
					type : "yesnoif",
				},
				{
					title : "History of Hospitalization",
					type : "yesnoif",
				},
				
				
		]
	};
var pageRiskFactorBeforeDX  = {
		title : "Risk factor before DX",
		qs : [
				{
					title : "Hemodialysis",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Transfusion",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Cupping",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Tattooing",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Needle Stick",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Blood Slashing",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Periodontal Procedures",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "High Risk Sexuality",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Shared Shaving Razors",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Travel in the past 6 month",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Recent Exposure to Icterus Hepatitis",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "UGI Endoscopy",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "LGI Endoscopy",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "Exposure to Chemical Weapone",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				{
					title : "History of prison",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},
				
				
		]
	};
var pageFamilialHistory = {
		title : "Familial History",
		qs : [
				{
					title : "Familial History",
					type : "simple_matrix",
					q: [
						 {
							type : "selectbox",
							title : "Familial History",
							options: [
								"Y",						
								"N",						
								"U",
							]
						}
					],
					cols : ["Acute Hepatitis", "Chronic Hepatitis", "Wilson", "Hemochro Matosis", "NAFLD", "H. Cancer", "Autoimmune disease", "other"],
					rows : ["Father", "Mother", "Spouse", "Children", "Brother", "Sister", "other"],						
				},					
		]
	};
var pageHistoryOfOtherAutoimmuneDiseases = {
		title : "History Of Other Autoimmune Diseases",
		qs : [
				{
					title : "Autoimmune Hemolytic Anemia",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "DM 1",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Autoimmune Thyroiditis",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Graves' Disease",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Wegner's Granulomatosis",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Autoimmune Polyglandular Syndrome",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Celiac Disease",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Ulcerative Colitis",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Sjogren's Syndrome",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Systemic Lupus Erythematouse",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "ITP",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Alopecic",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Vitiligo",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Persistent Anemia",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Pemphigus Vulgaris",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Mixed Connective Tissue Disease",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "RA (Rheumatoid Arthritis)",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Sickle Cell Anemia",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Lymphoproliferative Syndrome",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Nail Dystrophy",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Membranoproliferative Glomerulonephritis",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Immune Complex-Mediated Glomerulonephritis",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Other",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
		]
	};
var pagePostDrugHistoryBeforeDX = {
		title : "Post Drug History Before DX",
		qs : [
				{
					title : "Methyldopa",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Nitrofurantoine",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Diclophenac",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Oxyphenistatin",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Statin",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Minoxidine",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Astaminophen",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Halothane",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Isoniazide",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Sodiom Valproate",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Phenytoin",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Chlorpromazine",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Amiodarone",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Erythromycin",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "OCP",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Co-Trimoxazole",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Statins (HMG COA Redoctaseinhibitors)",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Steroid Anabolics",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "TPN",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Herbal/Alternative Medicine Medication",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
				{
					title : "Other",
					type : "selectbox",
					options: [
						"Yes",						
						"No",						
						"Unkown",
					]
				},				
		]
	};
var pageHabitualHistory = {
		title : "Habitual History",
		qs : [
				{
					title : "Habits",
					type : "checkboxes",
					options : [
					           "Cigarette", 
					           "Hookah",
					           "Pipe", 
					           "Alcohol Use", 
					           "Drug Abuse"					           
					]
					
				},	
				{
					title: "Cigarette",
					type: "tabular",
					cols: [
							"Averege  Cigarette Per Day",
							"Approximate Age Started",
							"Approximate Age Stopped",
							"Pack / Year",
					],
					rows : 3
				},
				{
					title: "Drug Abuse",
					type: "tabular",
					cols: [
							{
								title: "Drug Type",
								type : "selectbox",
								options : [
								           "Opium", 
								           "Heroin",
								           "Grass", 
								           "Cannabis", 
								           "Ecstasy",					           
								           "Other"					           
								]
							},
							"Approximate Age Started",
							"Approximate Age Stopped",
							{
								title: "Way of usage",
								type : "selectbox",
								options : [
								           "Inhalation", 
								           "Orally",
								           "IV", 
								           "Other"					           
								]
							},
					],
					rows : 3
				}
		]
	};
var pageSymptomsAndSignsAtOnset = {
        title:"Symptoms and Signs at Onset",
        qs : [
            {
                title:"Vital Sign",
                type:"group",
                qs:[
                    {
                        title:"Weight",
                        type:"text",
                    },
                    {
                        title:"Blood Pressure",
                        type:"text",
                    },{
                        title:"Waist",
                        type:"text",
                    },

                ]

            },
            {
                title:"General Symptom",
                type:"group",
                qs:[
                    {
                        title:"Nausea",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ],
                        ifYesQuestion : {
                        	yes: "Yes",
                        	title: "If yes",
                        	type:"radio",
                        	options: [
	                            "Before meal",
	                            "After meal",
	                            "Both"
                           ]
                        }
                    },
                    {
                        title:"Vomiting",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Anorexia",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Appetite",
                        type:"selectbox",
                        options: [
                            "NL",
                            "Increase",
                            "decrease",
                            "Unk",
                        ]
                    },
                    {
                        title:"Weight loss",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Weakness/Fatgue",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },

                ]

            },
            {
                title:"Skin",
                type:"group",
                qs:[
                    {
                        title:"lcter",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Pruritus",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Skin Pigmentation",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Palmar Erythema",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Spider angioma",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Sparse body hair",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Exanthema",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Petechia/Purpura",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Skin rash",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },

                ]

            },
            {
                title:"Head and Neck",
                type:"group",
                qs:[
                    {
                        title:"Kayser fleisher ring(KF ring)",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Sub flower cataract",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Dysarthria",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Dysphagia",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },

                ]

            },
            {
                title:"Chest",
                type:"group",
                qs:[
                    {
                        title:"Gynecomastia",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },

                ]

            },
            {
                title:"Abdomen",
                type:"group",
                qs:[
                    {
                        title:"Acitis",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"White stool",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Dark urine",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Hematemesis",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Melena",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Rectorrhagia",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Spelenomegaly",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Abdominal pain/tenderness",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Hepatomegaly",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Caput medusa",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Umbilical hernia",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Abdominal mass",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },

                ]

            },
            {
                title:"Genitourinay System",
                type:"group",
                qs:[
                    {
                        title:"Testicular atrophy",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Amenorrhea",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },

                ]

            },
            {
                title:"Limbs",
                type:"group",
                qs:[
                    {
                        title:"Edema",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Arthralgia/Artheritis",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Musle cramp",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },

                ]

            },
            {
                title:"Neurologic Sign and Symptoms",
                type:"group",
                qs:[
                    {
                        title:"Tremor",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Loss of fine motor control",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Chorea",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Encephalopathy",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Rigidity",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Gait disturbance",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Alternation in handwirting",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },

                ]

            },
            {
                title:"Psychiatric Sign and Symptom",
                type:"group",
                qs:[
                    {
                        title:"Depression",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },
                    {
                        title:"Personality disorder",
                        type:"selectbox",
                        options: [
                            "Yes",
                            "No",
                            "Unkown",
                        ]
                    },

                ]

            },
            {
                title:"Other",
                type:"text",

            },
        ]
    };
var pageSonography = {
        title:"Sonography",
        qs:[
            {
                title : "Date",
                type : "text",
            },
            {
                title : "Echo of Liver",
                type : "checkboxes",
                options:[
                    "NL",
                    "Increase",
                    "Decrease",
                    "Heterogeny",
                    "Homogen",
                    "Fatty",
                    "Coarse",

                ]
            },
            {
                title : "Hepatic Lesion",
                type : "yesno",
            },
            {
                title : "Liver Size",
                type: "group",
                qs :[
                    {
                        title : "",
                        type:"selectbox",
                        options: [
                                "NL",
                                "Increase",
                                "Decrease",
                        ]
                    },
                    {
                        title:"Size",
                        type : "text",
                    }
                ]
            },
            {
                title : "Spleen Size",
                type: "group",
                qs :[
                    {
                        title : "",
                        type:"selectbox",
                        options: [
                                "NL",
                                "Increase",
                                "Decrease",
                        ]
                    },
                    {
                        title:"Size",
                        type : "text",
                    }
                ]
            },
            {
                title : "Dilatation of Biliary Duct",
                type : "yesnoif",
            },
            {
                title : "Ascites",
                type : "yesno",
            },
            {
                title : "Portal vein diameter",
                type: "group",
                qs :[
                    {
                        title : "",
                        type:"selectbox",
                        options: [
                            "Increase",
                            "Decrease",
                        ]
                    },
                    {
                        title:"Size",
                        type : "text",
                    }
                ]
            },{
                title : "Other",
                type : "text"
            }


        ]

    };
var pageCBC = {
        title:"CBC",
        qs:[
            {
                title : "Date",
                type : "text",
            },
            {
                title : "WBC",
                type : "text",
            },
            {
                title : "Hgb",
                type : "text",
            },
            {
                title : "Hct",
                type : "text",
            },
            {
                title : "MCV",
                type : "text",
            },
            {
                title : "MCH",
                type : "text",
            },
            {
                title : "PLT",
                type : "text",
            },
            {
                title : "CRP qualitative",
                type : "text",
            },
            {
                title : "CRP quantitative",
                type : "text",
            },
            {
                title : "ESR",
                type : "text",
            },
            {
                title : "Other",
                type : "text",
            },

        ]

    }; 
var pageAscitis = {
        title:"Ascitis",
        qs:[
            {
                title : "Date",
                type : "text",
            },
            {
                title : "GLU",
                type : "text",
            },
            {
                title : "WBC",
                type : "text",
            },
            {
                title : "PMC",
                type : "text",
            },
            {
                title : "MN",
                type : "text",
            },
            {
                title : "RBC",
                type : "text",
            },
            {
                title : "LDH",
                type : "text",
            },
            {
                title : "SAAG",
                type : "text",
            },
            {
                title : "Other",
                type : "text",
            },

        ]

    };
var pageLFT = {
        title:"LFT",
        qs:[
            {
                title : "Date",
                type : "text",
            },
            {
                title : "Bil-T",
                type : "text",
            },
            {
                title : "Bil-D",
                type : "text",
            },
            {
                title : "AST",
                type : "text",
            },
            {
                title : "ALT",
                type : "text",
            },
            {
                title : "ALK-ph",
                type : "text",
            },
            {
                title : "PT",
                type : "text",
            },
            {
                title : "PTT",
                type : "text",
            },
            {
                title : "INR",
                type : "text",
            },
            {
                title : "Albumin",
                type : "text",
            },
            {
                title : "Pr-Total",
                type : "text",
            },
            {
                title : "GGT",
                type : "text",
            },
            {
                title : "Amylase",
                type : "text",
            },
            {
                title : "Other",
                type : "text",
            },

        ]

    };
var pageBiochemistry = {
        title:"Biochemistry",
        qs:[
            {
                title : "Date",
                type : "text",
            },
            {
                title : "Na",
                type : "text",
            },
            {
                title : "K",
                type : "text",
            },
            {
                title : "Ca",
                type : "text",
            },
            {
                title : "P",
                type : "text",
            },
            {
                title : "BUN",
                type : "text",
            },
            {
                title : "Cr",
                type : "text",
            },
            {
                title : "TG",
                type : "text",
            },
            {
                title : "Chol",
                type : "text",
            },
            {
                title : "HDL",
                type : "text",
            },
            {
                title : "LDL",
                type : "text",
            },
            {
                title : "VLDL",
                type : "text",
            },
            {
                title : "Uric Acid",
                type : "text",
            },
            {
                title : "FBS",
                type : "text",
            },
            {
                title : "HbA1C",
                type : "text",
            },
            {
                title : "CPK",
                type : "text",
            },
            {
                title : "LDH",
                type : "text",
            },{
                title : "Other",
                type : "text",
            },

        ]

    };
var pageIronAndCopperIndices = {
        title:"Iron and Copper Indices",
        qs:[
            {
                title : "Date",
                type : "text",
            },
            {
                title : "Serum Iron",
                type : "text",
            },
            {
                title : "TIBC",
                type : "text",
            },
            {
                title : "Ferritin",
                type : "text",
            },
            {
                title : "Serum CU",
                type : "text",
            },
            {
                title : "Ceruloplasmin",
                type : "text",
            },
            {
                title : "24 Urine CU",
                type : "text",
            },
            {
                title : "Other",
                type : "text",
            },

        ]

    };   
var pageThyroidFunction =  {
        title:"Thyroid Function",
        qs:[
            {
                title : "Date",
                type : "text",
            },
            {
                title : "T3",
                type : "text",
            },
            {
                title : "T4",
                type : "text",
            },
            {
                title : "FT3",
                type : "text",
            },
            {
                title : "FT4",
                type : "text",
            },
            {
                title : "TSH",
                type : "text",
            },
            {
                title : "T3RU",
                type : "text",
            },
            {
                title : "Other",
                type : "text",
            },

        ]

    };
var pageAutoAntibody =  {
        title:"Auto Antibody",
        qs:[
            {
                title : "Date",
                type : "text",
            },
            {
                title : "ANA",
                type : "text",
            },
            {
                title : "ASMA",
                type : "text",
            },
            {
                title : "AMA",
                type : "text",
            },
            {
                title : "ACNA",
                type : "text",
            },
            {
                title : "P-ANCA",
                type : "text",
            },
            {
                title : "Anti-dsDNA",
                type : "text",
            },
            {
                title : "Anti-ssDNA",
                type : "text",
            },
            {
                title : "Anti-LKM1",
                type : "text",
            },
            {
                title : "Anti-LC1",
                type : "text",
            },
            {
                title : "Antiactin Ab(AAA)",
                type : "text",
            },
            {
                title : "Anti-SLA/LP",
                type : "text",
            },
            {
                title : "Other",
                type : "text",
            },

        ]

    }; 
var pageTumorMarkers =   {
        title:"Tumor Markers",
        qs:[
            {
                title : "Date",
                type : "text",
            },
            {
                title : "AFP",
                type : "text",
            },
            {
                title : "CEA",
                type : "text",
            },
            {
                title : "CA19-9",
                type : "text",
            },
            {
                title : "CA125",
                type : "text",
            },
            {
                title : "Other",
                type : "text",
            },

        ]

    };   
var pageElectroPhoresis = {
        title:"Electro Phoresis",
        qs:[
            {
                title:"Pr of serum",
                type:"simple_matrix",
                q:[
                    {
                        title:"Pr of serum",
                        type:"text",
                    }
                ],
                cols:["%", "gr/dl"],
                rows:["Alb", "α1", "α2", "β", "γ"],
            },
            {
                title:"Antitrypsin",
                type:"simple_matrix",
                q:[
                    {
                        title:"Antitrypsin",
                        type:"text",
                    }
                ],
                cols:["%", "gr/dl"],
                rows:[ "α1", "α2", "β", "γ"],
            },
            {
                title:"lg",
                type:"simple_matrix",
                q:[
                    {
                        title:"lg",
                        type:"text",
                    }
                ],
                cols:["%", "gr/dl"],
                rows:[ "lgA","lgM","lgG","lgE"],
            },
            {
                title:"Other",
                type:"text",
            },
        ]

    };
var pageUgiEndoscopy = {

    title:"UGI ENDOSCOPY",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"VARICE",
            type:"yesno",
        },
        {
            title:"Portal Hypertension",
            type:"yesno",
        },
        {
            title:"Other",
            type:"text",
        }
    ]


};

var pageColonoscopy = {
    title:"COLONOSCOPY",
    qs:[
        {
            title: "Date",
            type:"text",
        },
        {
            title:"Mucosal Apearence",
            type:"selectbox",
            options:[
                "Normal",
                "Loss of Vascularity",
                "Fragility",
                "UIser",
                "Polyp",
                "Cancer",
            ],
        },
        {
            title:"Dx",
            type:"text",
        },
        {
            title:"Other",
            type:"text",
        }
    ]
};

var pageErcp ={
    title:"ERCP",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"Sphincterotomy",
            type:"yesnoif",
        },
        {
            title:"Balloon dilation",
            type:"yesnoif",
        },
        {
            title:"Common bile duct",
            type:"selectbox",
            options:[
                "NI",
                "Dilation",
                "Stericture",
                "Narrowing",
                "Irregularity",
            ],
        },
        {
            title:"Pancreatice duct",
            type:"selectbox",
            options:[
                "NI",
                "Dilation",
                "Stericture",
                "Narrowing",
                "Irregularity",
            ],
        },
        {
            title:"Cystic duct",
            type:"selectbox",
            options:[
                "NI",
                "Dilation",
                "Stericture",
                "Narrowing",
                "Irregularity",
            ],
        },
        {
            title : "Intra hepatic duct",
            type : "group",
            qs :[
                {
                    title : "Common hepatic duct",
                    type:  "selectbox",
                    options: [
                        "NI",
                        "Dilation",
                        "Stericture",
                        "Narrowing",
                        "Irregularity",
                    ]
                },
                {
                    title : "Right hepatic duct",
                    type:  "selectbox",
                    options: [
                        "NI",
                        "Dilation",
                        "Stericture",
                        "Narrowing",
                        "Irregularity",
                    ]
                },
                {
                    title : "Left hepatic duct",
                    type:  "selectbox",
                    options: [
                        "NI",
                        "Dilation",
                        "Stericture",
                        "Narrowing",
                        "Irregularity",
                    ]
                }
            ]

        },
        {
            title : "Other",
            type : "text",
        },
    ],
};
var pageCtScan ={
    title : "CT SCAN",
    qs :[
        {
            title : "Date",
            type : "text",
        },
        {
            title : "Hepatic Lesion",
            type : "yesno",
        },
        {
            title : "Liver Size",
            type: "group",
            qs :[
                {
                    title : "",
                    type:"selectbox",
                    options: [
                        "NL",
                        "Increase",
                        "Decrease",
                    ]
                },
                {
                    title:"Size",
                    type : "text",
                }
            ]
        },
        {
            title : "Spleen Size",
            type: "group",
            qs :[
                {
                    title : "",
                    type:"selectbox",
                    options: [
                        "NL",
                        "Increase",
                        "Decrease",
                    ]
                },
                {
                    title:"Size",
                    type : "text",
                }
            ]
        },
        {
            title : "Other",
            type : "text",
        }
    ],
};

var pageMRI = {
    title : "MRI",
    qs : [
        {
            title : "Date",
            type : "text",
        },
        {
            title : "NL",
            type : "yesno",
        },
        {
            title : "CBD",
            type :"group",
            qs :[
                {
                    title : "",
                    type : "selectbox",
                    options :[
                            "Dilation",
                            "Beading",
                            "Stenosis",
                    ]
                },
                {
                    title :"Other",
                    type : "text",
                },
            ]
        },
        {
            title : "Intra hepatic duct",
            type :"group",
            qs :[
                {
                    title : "",
                    type : "selectbox",
                    options :[
                            "Dilation",
                            "Beading",
                            "Stenosis",
                    ]
                },
                {
                    title :"Other",
                    type : "text",
                },
            ]
        },
        {
            title : "Pancreatic duct",
            type :"group",
            qs :[
                {
                    title : "",
                    type : "selectbox",
                    options :[
                            "Dilation",
                            "Beading",
                            "Stenosis",
                    ]
                },
                {
                    title :"Other",
                    type : "text",
                },
            ]
        },
        {
            title :"Other",
            type : "text",
        }
    ]
};
var pageDrugHistoryAfterDX = {
    title :"Drug History after Dx",
    qs : [

        {
            title : "Drug History after Dx",
            type : "simple_matrix",
            q: [
                {
                    type : "text",
                    title : "Drug History after Dx",
                }
            ],
            cols : ["Dose(mg per Day)", "Start Date", "End Date", "Duration of Use", "Intolerance", "Intolerance Cause"],
            rows : ["Lamivudine", "Interferon", "Peg Interferon(Pegaferon,Pegasys)", "Adefovir(Adesera,Hepsera,Biofovir)", "UDCA(Ursobil,Ursoflor)",
                "Predsinose", "Azethioprine(Imuran)","Ribavirin","Ciprofloxacin","Metronidazol","Mesalamine","Tenofovir","Entecovir","Teloprevir","Boceprevir"],
        },
    ]
};

var pageVirtalMarker ={
    title :"Virtal Marker",
    qs :[
        {
            title:"Hepatitis A",
            type : "group",
            qs : [
                {
                    title : "Anti HAV lgG",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis A",
            type : "group",
            qs : [
                {
                    title : "Anti HAV lgM",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis B",
            type : "group",
            qs : [
                {
                    title : "HBs Ag",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis B",
            type : "group",
            qs : [
                {
                    title : "HBs Ab",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis B",
            type : "group",
            qs : [
                {
                    title : "Anti HBc",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis B",
            type : "group",
            qs : [
                {
                    title : "HBe Ag",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis B",
            type : "group",
            qs : [
                {
                    title : "HBe Ab",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis B",
            type : "group",
            qs : [
                {
                    title : "PCR",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis B",
            type : "group",
            qs : [
                {
                    title : "Viral Load",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis B",
            type : "group",
            qs : [
                {
                    title : "Geno Type",
                    type :"text",
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis C",
            type : "group",
            qs : [
                {
                    title : "Anti HCV",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis C",
            type : "group",
            qs : [
                {
                    title : "PCR",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis C",
            type : "group",
            qs : [
                {
                    title : "Viral Load",
                    type :"selectbox",
                    options:[
                            "-",
                            "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis C",
            type : "group",
            qs : [
                {
                    title : "Geno Type",
                    type :"text",
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis D",
            type : "group",
            qs : [
                {
                    title : "Anti HDV lgM",
                    type :"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis D",
            type : "group",
            qs : [
                {
                    title : "PCR",
                    type :"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis D",
            type : "group",
            qs : [
                {
                    title : "Geno Type",
                    type :"text",
                },
                {
                    title : "Date",
                    type : "text",
                }
            ]
        },
        {
            title:"Hepatitis E",
            type:"group",
            qs:[
                {
                    title:"Anti HEV lgM",
                    type:"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title:"Date",
                    type:"text",
                }
            ]
        },
        {
            title:"Hepatitis E",
            type:"group",
            qs:[
                {
                    title:"Anti HEV lgG",
                    type:"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title:"Date",
                    type:"text",
                }
            ]
        },

        {
            title:"CMV",
            type:"group",
            qs:[
                {
                    title:"Anti HEV lgM",
                    type:"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title:"Date",
                    type:"text",
                }
            ]
        },
        {
            title:"CMV",
            type:"group",
            qs:[
                {
                    title:"Anti HEV lgG",
                    type:"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title:"Date",
                    type:"text",
                }
            ]
        },

        {
            title:"EBV",
            type:"group",
            qs:[
                {
                    title:"Anti HEV lgM",
                    type:"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title:"Date",
                    type:"text",
                }
            ]
        },
        {
            title:"EBV",
            type:"group",
            qs:[
                {
                    title:"Anti HEV lgG",
                    type:"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title:"Date",
                    type:"text",
                }
            ]
        },

        {
            title:"HIV",
            type:"group",
            qs:[
                {
                    title:"Anti HEV lgM",
                    type:"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title:"Date",
                    type:"text",
                }
            ]
        },
        {
            title:"HIV",
            type:"group",
            qs:[
                {
                    title:"Anti HEV lgG",
                    type:"selectbox",
                    options:[
                        "-",
                        "+",
                    ]
                },
                {
                    title:"Date",
                    type:"text",
                }
            ]
        },
        {
            title : "Other",
            type : "text",
        }
    ]
};

var  pagePathology = {
    title : "Pathology",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"Biliary Disease",
            type:"checkboxes",
            options:[
                "Large Bile Duct Obstructuins Pattern",
                "Bile Duct Damage with or without Granoloma (Compatible with Pragressive PBC)",
                "Bile Duct Loss/ Ductular Proliferation /Cholestasis (Compatible with Pragressive PBC)",
                "Above Feature Coexisting with prominent interface Hepatitis (Compatible woth overlap syndrome)",
                "Bile Duct Loss/ Peri Ductal Concentric Fibrosis(PSC be considered)",
                "Compatible with Infectious Chlangitis",
                "Ductopenia, Clinical Correlation Needed",
            ],
        },
        {
            title : "Acute Hepatitis Pattern",
            type : "group",
            qs :[
                {
                   title : "With Panacinar/ Multiacinar Necrosis",
                    type : "checkbox",
                }
            ]
        },
        {
            title : "Chronic Hepatitis",
            type : "group",
            qs : [
                {
                    title : "Grade",
                    type : "text",
                },
                {
                    title : "Inteface Heptitis",
                    type : "text",
                },
                {
                    title : "Confluent Necrosis",
                    type : "text",
                },
                {
                    title : "Spotty Lytic Necrosis",
                    type : "text",
                },
                {
                    title : "Portal Inflammation",
                    type : "text",
                },
                {
                    title : "stage",
                    type : "text",
                },
            ]
        },
        {
            title :"Seatosis/ Steatohepatitis",
            type :"group",
            qs : [
                {
                    title : "Activity Score",
                    type :"text",
                },
                {
                    title : "Stage",
                    type : "text",
                }
            ]
        },
        {
            title:"Siderosis",
            type:"group",
            qs:[
                {
                    title:"Grade",
                    type:"text",
                },
                {
                    title:"Stage",
                    type:"text",
                }

            ]
        },
        {
            title : "Cholestasis( Isolated)",
            type : "text",
        },
        {
            title : "Vascular Disorders",
            type :"checkboxes",
            options : [
                "Vasculitis",
                "Peliosis Hepatis",
                "Compatible with Passive Congestion, Venous Obstruction",
            ]
        },
        {
            title:"Cirrhosis",
            type : "text",
        },
        {
            title :"Mass Lesion Compatible With",
            type:"checkboxes",
            options : [
                    "Necrotic/ Fibrous Nodule",
                    "Heterotopia",
                    "Endometrial Cyct (Endometrioma)",
                    "Benign Nerve Sheath Tumors",
                    "Sarcoid Pseudotumor",
                    "Abscess",
                    "Parasistic Cyst",
                    "Hydatid Cyst",
                    "Ciliated Foregut Cyst",
                    "Alimentary Duplication Cyst",
                    "Pseudocysts (Panreatic,Traumtiv)",
                    "Accessory Lobe",
            ]
        },
        {
            title:"Benign Neoplasm and Tumor-Like Masses",
            type:"group",
            qs:[
                {
                    title:"Hepato Cellulr",
                    type:"checkboxes",
                    options:[
                        "Hepatocellular Adenoma",
                        "Focal Nodular Hyperplasia",
                        "Nodular Regenerative Hyperplasia",
                    ]
                },
                {
                    title:"Cholango-Cellular",
                    type:"checkboxes",
                    options:[
                        "Bile Duct Hamartoma(Von Meyenburg Complex)",
                        "Bile Duct Adenoma",
                        "Biliary Cysts",
                        "Bilary Cystadenoma",
                    ]
                },
                {
                    title:"Vascular",
                    type:"checkboxes",
                    options:[
                        "Hemangioma",
                        "Infantile Hemangioenothelioma",
                        "lymohangioma",
                    ]
                },
                {
                    title:"Fatty Tumors",
                    type:"checkboxes",
                    options:[
                        "Angiomyolipoma(and related tumors)",
                        "Focal(Hepatocellular) Fatty Change",
                    ]
                },
                {
                    title:"Other",
                    type:"checkboxes",
                    options:[
                        "Solitary Fibrous Tumor",
                        "Inflammatory Myofibriblastic Tumor(Pseudotumor)",
                        "Leiomyoma",
                    ]
                },
            ]

        },
        {
            title :"Malignant Neoplasm",
            type:"group",
            qs : [
                {
                    title : "Primary",
                    type : "checkboxes",
                    options : [
                            "Hepatocellulr Carcinoma",
                            "Fibromellar Variant",
                            "Hepaoblastoma Epithlial Type",
                            "Cholangiocarcinoma",
                            "Intraductal Variant(Bilary Papillomatosis)",
                            "Cholangiocellular Variant",
                            "Angiosarcoma",
                            "Epithelioid Hemangioendothelioma",


                    ]
                },
                {
                    title : "Metastatic",
                    type : "checkboxes",
                    options : [
                            "Adenocarcinoma",
                            "Lymphoma",
                            "Leukemia",
                            "Other",
                    ]
                }
            ]
        },
        {
            title : "Other",
            type : "text",
        },



    ]
}


var pageSymptomsAndSignsAtOnsetFollowUp = jQuery.extend(true, {}, pageSymptomsAndSignsAtOnset);
pageSymptomsAndSignsAtOnsetFollowUp.title = "Follow Up";
var pageMrcp = jQuery.extend(true, {}, pageMRI);
pageMrcp.title = "MRCP";
var pages = 
	[   /*
	    pageDataSource,
		pagePatientIdentification,
		pageSecondaryContact,
		pagePatientPersonalInformation,
		pageMediacalHistory,
		pageRiskFactorBeforeDX,
		pageFamilialHistory,
		pageHistoryOfOtherAutoimmuneDiseases,
		pagePostDrugHistoryBeforeDX,
		pageHabitualHistory,
		pageSymptomsAndSignsAtOnset,
		pageSymptomsAndSignsAtOnsetFollowUp,*/
		pageSonography,
        /*pageUgiEndoscopy,
        pageColonoscopy,
        pageErcp,
        pageCtScan,
        pageMRI,
        pageMrcp,
        */
        pageDrugHistoryAfterDX,
        /*
        pageCBC,
        pageAscitis,
        pageLFT,
        pageBiochemistry,
        pageIronAndCopperIndices,
        pageThyroidFunction ,
        pageAutoAntibody,
        pageTumorMarkers,
        pageElectroPhoresis,
        */
        pageVirtalMarker,
        pagePathology

    ];
	
	$(function(){
		renderPages(pages);
	});

	
</script>