<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@page contentType="text/html;charset=UTF-8" %>

<script type="text/javascript">
var pageDataSource = {
//    isStatic:false,
    title:"Data Source",
    qs:[
        {
            title:"Site Of Registery",
            type:"text",
        },
        {
            title:"Date Of Registry",
            type:"date",
        },
        {
            title:"Definite DX4444",
            type:"text",
        },
        {
            title:"Source Of Registry",
            type:"checkboxes",
            options:[
                "Patient",
                "Family",
                "Files",
                {
                    title:"Other",
                    type:"text",
                }
            ]

        },
        {
            title:"Referal",
            type:"checkboxes",
            options:[
                "Dr. Zali",
                "Talegani Hospital",
                {
                    title:"Other",
                    type:"text",
                }
            ]

        },
        {
            title:"Questioner",
            type:"text",
        },
        {
            title:"Researcher",
            type:"text",
        },
        {
            title:"Operator",
            type:"text",
        },
        {
            title:"Pathological Block",
            type:"group",
            qs:[
                {
                    title:"Pathological Report",
                    type:"yesno",
                },
                {
                    title:"Path. Lab. Name",
                    type:"text",
                },
                {
                    title:"Path. Lab. City",
                    type:"text",
                },
                {
                    title:"Report Date",
                    type:"date",
                },
                {
                    title:"Report Serial Number",
                    type:"text",
                },
                {
                    title:"Number Of Pathological Block",
                    type:"number",
                },
            ]
        },
        {
            title:"Blood Sample",
            type:"yesnoif",
            ifYes:"Code of blood",
        },
        {
            title:"Hostiptal Name",
            type:"group",
            qs:[
                {
                    title:"Name",
                    type:"text",
                },
                {
                    title:"Medical Record Number",
                    type:"text",
                },
                {
                    title:"Adm Date",
                    type:"date",
                },
                {
                    title:"Disch Date",
                    type:"date",
                },
            ]
        },
    ]
};
var pagePatientIdentification = {
//    isStatic:true,
    title:"Patient Identification",
    qs:[
        {
            title:"First Name",
            type:"text",
        },
        {
            title:"Last Name",
            type:"text",
        },
        {
            title:"Father Name",
            type:"text",
        },
        {
            title:"ID Number",
            type:"text",
        },
        {
            title:"Issued From",
            type:"text",
        },
        {
            title:"Social Security Number",
            type:"text",
        },
        {
            title:"Primary Insurance Payer",
            type:"selectbox",
            multiple:true,
            max:2,
            options:[
                "Not Insured",
                { title:"Private Insurance", ifYes:"Name", type:"text"},
                "Insured, Governmental",
                "Insured, Social Security",
                "Insured, Military",
                "Insured, Charity",
                "Unkown",
            ]
        },
        {
            title:"Insurance Number",
            type:"text",
        },
        {
            title:"Address",
            type:"group",
            qs:[
                {
                    title:"State",
                    type:"text",
                },
                {
                    title:"City or Village",
                    type:"text",
                },
                {
                    title:"Zip Code",
                    type:"text",
                },
                {
                    title:"Home",
                    type:"text",
                },
                {
                    title:"Job",
                    type:"text",
                },
                {
                    title:"Home Phone",
                    type:"text",
                },
                {
                    title:"Job Phone",
                    type:"text",
                },
                {
                    title:"Cell Phone",
                    type:"text",
                },
                {
                    title:"Mail Box",
                    type:"text",
                },
                {
                    title:"E-Mail",
                    type:"text",
                },
            ]
        },
    ]
};
var pageSecondaryContact = {
//    isStatic:true,
    title:"Secondary Contact",
    qs:[
        {
            title:"Relationship",
            type:"selectbox",
            url:"",
            options:[
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
            title:"First Name",
            type:"text",
        },
        {
            title:"Last Name",
            type:"text",
        },
        {
            title:"Address",
            type:"group",
            qs:[
                {
                    title:"State",
                    type:"text",
                },
                {
                    title:"City or Village",
                    type:"text",
                },
                {
                    title:"Zip Code",
                    type:"text",
                },
                {
                    title:"Home",
                    type:"text",
                },
                {
                    title:"Job",
                    type:"text",
                },
                {
                    title:"Home Phone",
                    type:"text",
                },
                {
                    title:"Job Phone",
                    type:"text",
                },
                {
                    title:"Cell Phone",
                    type:"text",
                },
                {
                    title:"Mail Box",
                    type:"text",
                },
                {
                    title:"E-Mail",
                    type:"text",
                },
            ]
        },
    ]
};
var pagePatientPersonalInformation = {
//    isStatic:true,
    title:"Patient Personal Information",
    qs:[
        {
            title:"Birth Date",
            type:"date",
        },
        {
            title:"Age",
            type:"number",
        },
        {
            title:"Place Of Birth",
            type:"text",
        },
        {
            title:"Sex",
            type:"selectbox",
            options:[
                "Male",
                "Female",
                "Other (Hermaphrodite)",
                "Transsexual",
                "Unkown",
            ]
        },
        {
            title:"Marital Sataus",
            type:"selectbox",
            options:[
                "Single",
                "Married",
                "Seperated",
                "Divorced",
                "Widowed",
                "Unkown",
            ]
        },
        {
            title:"Ethnicity",
            type:"selectbox",
            multiple:true,
            max:4,
            options:[
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
            title:"Religion",
            type:"selectbox",
            options:[
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
            title:"Weight (kg)",
            type:"number",
        },
        {
            title:"Height (cm)",
            type:"number",
        },
        {
            title:"Immigration Status",
            type:"radio",
            options:[
                "Original Iranian",
                "Immigrated to Iran",
            ]
        },
        {
            title:"Immigration From",
            type:"text",
        },
        {
            title:"Occupation (current or must recent)",
            type:"text",
        },
        {
            title:"Longest Occupation",
            type:"text",
        },
        {
            title:"Industry",
            type:"text",
        },
        {
            title:"Longest Industry",
            type:"text",
        },
        {
            title:"Education",
            type:"selectbox",
            options:[
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
            title:"Number of Children",
            type:"number",
        },
        {
            title:"Date of 1st Diagnosis",
            type:"date",
        },
        {
            title:"1st Diagnosis",
            type:"date",
        },
        {
            title:"Marital Sataus at Diagnosis",
            type:"selectbox",
            options:[
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
//    isStatic:true,
    title:"Mediacal History",
    qs:[
        {
            title:"HBV Vaccination",
            type:"group",
            qs:[
                {
                    title:"Vaccination",
                    type:"yesno",
                },
                {
                    title:"Date",
                    type:"date",
                }
            ]
        },
        {
            title:"History of any important disease",
            type:"yesnoif",
        },
        {
            title:"History of Surgery",
            type:"yesnoif",
        },
        {
            title:"History of Hospitalization",
            type:"yesnoif",
        },


    ]
};
var pageRiskFactorBeforeDX = {
//    isStatic:true,
    title:"Risk factor before DX",
    qs:[
        {
            title:"Hemodialysis",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Transfusion",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Cupping",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Tattooing",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Needle Stick",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Blood Slashing",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Periodontal Procedures",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"High Risk Sexuality",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Shared Shaving Razors",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Travel in the past 6 month",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Recent Exposure to Icterus Hepatitis",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"UGI Endoscopy",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"LGI Endoscopy",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Exposure to Chemical Weapone",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"History of prison",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },


    ]
};
var pageFamilialHistory = {
//    isStatic:true,
    title:"Familial History",
    qs:[
        {
            title:"Familial History",
            type:"simple_matrix",
            q:[
                {
                    type:"selectbox",
                    title:"Familial History",
                    options:[
                        "Y",
                        "N",
                        "U",
                    ]
                }
            ],
            cols:["Acute Hepatitis", "Chronic Hepatitis", "Wilson", "Hemochro Matosis", "NAFLD", "H. Cancer", "Autoimmune disease", "other"],
            rows:["Father", "Mother", "Spouse", "Children", "Brother", "Sister", "other"],
        },
    ]
};
var pageHistoryOfOtherAutoimmuneDiseases = {
//    isStatic:true,
    title:"History Of Other Autoimmune Diseases",
    qs:[
        {
            title:"Autoimmune Hemolytic Anemia",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"DM 1",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Autoimmune Thyroiditis",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Graves' Disease",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Wegner's Granulomatosis",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Autoimmune Polyglandular Syndrome",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Celiac Disease",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Ulcerative Colitis",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Sjogren's Syndrome",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Systemic Lupus Erythematouse",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"ITP",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Alopecic",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Vitiligo",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Persistent Anemia",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Pemphigus Vulgaris",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Mixed Connective Tissue Disease",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"RA (Rheumatoid Arthritis)",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Sickle Cell Anemia",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Lymphoproliferative Syndrome",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Nail Dystrophy",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Membranoproliferative Glomerulonephritis",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Immune Complex-Mediated Glomerulonephritis",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Other",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
    ]
};
var pagePostDrugHistoryBeforeDX = {
//    isStatic:true,
    title:"Post Drug History Before DX",
    qs:[
        {
            title:"Methyldopa",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Nitrofurantoine",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Diclophenac",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Oxyphenistatin",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Statin",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Minoxidine",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Astaminophen",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Halothane",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Isoniazide",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Sodiom Valproate",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Phenytoin",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Chlorpromazine",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Amiodarone",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Erythromycin",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"OCP",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Co-Trimoxazole",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Statins (HMG COA Redoctaseinhibitors)",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Steroid Anabolics",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"TPN",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Herbal/Alternative Medicine Medication",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
        {
            title:"Other",
            type:"selectbox",
            options:[
                "Yes",
                "No",
                "Unkown",
            ]
        },
    ]
};
var pageHabitualHistory = {
//    isStatic:true,
    title:"Habitual History",
    qs:[
        {
            title:"Habits",
            type:"checkboxes",
            options:[
                "Cigarette",
                "Hookah",
                "Pipe",
                "Alcohol Use",
                "Drug Abuse"
            ]

        },
        {
            title:"Cigarette",
            type:"tabular",
            cols:[
                "Averege  Cigarette Per Day",
                "Approximate Age Started",
                "Approximate Age Stopped",
                "Pack / Year",
            ],
            rows:3
        },
        {
            title:"Drug Abuse",
            type:"tabular",
            cols:[
                {
                    title:"Drug Type",
                    type:"selectbox",
                    options:[
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
                    title:"Way of usage",
                    type:"selectbox",
                    options:[
                        "Inhalation",
                        "Orally",
                        "IV",
                        "Other"
                    ]
                },
            ],
            rows:3
        }
    ]
};
var pageSymptomsAndSignsAtOnset = {
    title:"Symptoms and Signs at Onset",
    qs:[
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
                },
                {
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
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ],
                    ifYesQuestion:{
                        yes:"Yes",
                        title:"If yes",
                        type:"radio",
                        options:[
                            "Before meal",
                            "After meal",
                            "Both"
                        ]
                    }
                },
                {
                    title:"Vomiting",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Anorexia",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Appetite",
                    type:"selectbox",
                    options:[
                        "NL",
                        "Increase",
                        "decrease",
                        "Unk",
                    ]
                },
                {
                    title:"Weight loss",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Weakness/Fatgue",
                    type:"selectbox",
                    options:[
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
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Pruritus",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Skin Pigmentation",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Palmar Erythema",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Spider angioma",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Sparse body hair",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Exanthema",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Petechia/Purpura",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Skin rash",
                    type:"selectbox",
                    options:[
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
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Sub flower cataract",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Dysarthria",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Dysphagia",
                    type:"selectbox",
                    options:[
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
                    options:[
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
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"White stool",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Dark urine",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Hematemesis",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Melena",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Rectorrhagia",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Spelenomegaly",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Abdominal pain/tenderness",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Hepatomegaly",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Caput medusa",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Umbilical hernia",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Abdominal mass",
                    type:"selectbox",
                    options:[
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
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Amenorrhea",
                    type:"selectbox",
                    options:[
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
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Arthralgia/Artheritis",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Musle cramp",
                    type:"selectbox",
                    options:[
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
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Loss of fine motor control",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Chorea",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Encephalopathy",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Rigidity",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Gait disturbance",
                    type:"selectbox",
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Alternation in handwirting",
                    type:"selectbox",
                    options:[
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
                    options:[
                        "Yes",
                        "No",
                        "Unkown",
                    ]
                },
                {
                    title:"Personality disorder",
                    type:"selectbox",
                    options:[
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
            title:"Date",
            type:"text",
        },
        {
            title:"Echo of Liver",
            type:"checkboxes",
            options:[
                "NL",
                "Increase",
                "Decrease",
                "Heterogeny",
                "Homogen",
                "Fatty",
                "Coarse",

            ]
        }
    ]

};
var pageCBC = {
    title:"CBC",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"WBC",
            type:"text",
        },
        {
            title:"Hgb",
            type:"text",
        },
        {
            title:"Hct",
            type:"text",
        },
        {
            title:"MCV",
            type:"text",
        },
        {
            title:"MCH",
            type:"text",
        },
        {
            title:"PLT",
            type:"text",
        },
        {
            title:"CRP qualitative",
            type:"text",
        },
        {
            title:"CRP quantitative",
            type:"text",
        },
        {
            title:"ESR",
            type:"text",
        },
        {
            title:"Other",
            type:"text",
        },

    ]

};
var pageAscitis = {
    title:"Ascitis",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"GLU",
            type:"text",
        },
        {
            title:"WBC",
            type:"text",
        },
        {
            title:"PMC",
            type:"text",
        },
        {
            title:"MN",
            type:"text",
        },
        {
            title:"RBC",
            type:"text",
        },
        {
            title:"LDH",
            type:"text",
        },
        {
            title:"SAAG",
            type:"text",
        },
        {
            title:"Other",
            type:"text",
        },

    ]

};
var pageLFT = {
    title:"LFT",
    qs:[
        {
            title:"Date",
            type:"date",
        },
        {
            title:"Bil-T",
            type:"text",
        },
        {
            title:"Bil-D",
            type:"text",
        },
        {
            title:"AST",
            type:"text",
        },
        {
            title:"ALT",
            type:"text",
        },
        {
            title:"ALK-ph",
            type:"text",
        },
        {
            title:"PT",
            type:"text",
        },
        {
            title:"PTT",
            type:"text",
        },
        {
            title:"INR",
            type:"text",
        },
        {
            title:"Albumin",
            type:"text",
        },
        {
            title:"Pr-Total",
            type:"text",
        },
        {
            title:"GGT",
            type:"text",
        },
        {
            title:"Amylase",
            type:"text",
        },
        {
            title:"Other",
            type:"text",
        },

    ]

};
var pageBiochemistry = {
    title:"Biochemistry",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"Na",
            type:"text",
        },
        {
            title:"K",
            type:"text",
        },
        {
            title:"Ca",
            type:"text",
        },
        {
            title:"P",
            type:"text",
        },
        {
            title:"BUN",
            type:"text",
        },
        {
            title:"Cr",
            type:"text",
        },
        {
            title:"TG",
            type:"text",
        },
        {
            title:"Chol",
            type:"text",
        },
        {
            title:"HDL",
            type:"text",
        },
        {
            title:"LDL",
            type:"text",
        },
        {
            title:"VLDL",
            type:"text",
        },
        {
            title:"Uric Acid",
            type:"text",
        },
        {
            title:"FBS",
            type:"text",
        },
        {
            title:"HbA1C",
            type:"text",
        },
        {
            title:"CPK",
            type:"text",
        },
        {
            title:"LDH",
            type:"text",
        },
        {
            title:"Other",
            type:"text",
        },

    ]

};
var pageIronAndCopperIndices = {
    title:"Iron and Copper Indices",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"Serum Iron",
            type:"text",
        },
        {
            title:"TIBC",
            type:"text",
        },
        {
            title:"Ferritin",
            type:"text",
        },
        {
            title:"Serum CU",
            type:"text",
        },
        {
            title:"Ceruloplasmin",
            type:"text",
        },
        {
            title:"24 Urine CU",
            type:"text",
        },
        {
            title:"Other",
            type:"text",
        },

    ]

};
var pageThyroidFunction = {
    title:"Thyroid Function",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"T3",
            type:"text",
        },
        {
            title:"T4",
            type:"text",
        },
        {
            title:"FT3",
            type:"text",
        },
        {
            title:"FT4",
            type:"text",
        },
        {
            title:"TSH",
            type:"text",
        },
        {
            title:"T3RU",
            type:"text",
        },
        {
            title:"Other",
            type:"text",
        },

    ]

};
var pageAutoAntibody = {
    title:"Auto Antibody",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"ANA",
            type:"text",
        },
        {
            title:"ASMA",
            type:"text",
        },
        {
            title:"AMA",
            type:"text",
        },
        {
            title:"ACNA",
            type:"text",
        },
        {
            title:"P-ANCA",
            type:"text",
        },
        {
            title:"Anti-dsDNA",
            type:"text",
        },
        {
            title:"Anti-ssDNA",
            type:"text",
        },
        {
            title:"Anti-LKM1",
            type:"text",
        },
        {
            title:"Anti-LC1",
            type:"text",
        },
        {
            title:"Antiactin Ab(AAA)",
            type:"text",
        },
        {
            title:"Anti-SLA/LP",
            type:"text",
        },
        {
            title:"Other",
            type:"text",
        },

    ]

};
var pageTumorMarkers = {
    title:"Tumor Markers",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"AFP",
            type:"text",
        },
        {
            title:"CEA",
            type:"text",
        },
        {
            title:"CA19-9",
            type:"text",
        },
        {
            title:"CA125",
            type:"text",
        },
        {
            title:"Other",
            type:"text",
        },

    ]

};
var pageElectroPhoresis = {
    title:"Electro Phoresis",
    qs:[
        {
            title:"Date",
            type:"text",
        },
        {
            title:"Pr of serum",
            type:"group",
            qs:[
                {
                    title:"Alb",
                    type:"group",
                    qs:[
                        {
                            title:"%",
                            type:"text",
                        },
                        {
                            title:"gr/dl",
                            type:"text",
                        },
                    ]
                }

            ]
        },

    ]

};

var pageTashkhis = {
    title:"tashkhis",
    qs:[
        {
            title:"Date",
            type:"date",
        },
        {
            title:"tosif",
            type:"textarea",
            cols:"100",
            rows:"8",
            width:"400px",
            height:"90px",
            dir:"rtl",
        }
    ]
};

var pageSymptomsAndSignsAtOnsetFollowUp = jQuery.extend(true, {}, pageSymptomsAndSignsAtOnset);
pageSymptomsAndSignsAtOnsetFollowUp.title = "Follow Up";

</script>