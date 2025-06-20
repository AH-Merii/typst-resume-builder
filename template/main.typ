// main.typ
#import "@local/resume-builder:0.2.0": *

#show: resume.with(
  name: "AbdulHamid Merii",
  profile-img-path: "../template/assets/profile_pic.jpg",
  linkedin: "https://www.linkedin.com/in/a-merii/",
  tagline: "Senior ML Engineer; expertise in MLOps, cloud infra, & E2E ML pipelines.",
  qr-codes: (
    (
      image: image("qr-codes/linkedin.svg"),
      link: "https://www.linkedin.com/in/a-merii/"
    ),
    (
      image: image("qr-codes/github.svg"),
      link: "https://github.com/AH-Merii"
    ),
  ),
  qr-spacing: 0.15in,  // Customize spacing between QR codes
  qr-height: 0.8in,    // Customize height of QR codes
  keywords: "machine learning, MLOps, AWS, Python, DevOps",
  icon-contact-header: (
    (image("icons/email.svg"),    link("mailto:ah_merii@outlook.com", "ah_merii@outlook.com")),
    (image("icons/phone.svg"),    link("tel:+447864058889", "+44 (7) 864058889")),
    (image("icons/github.svg"),   link("https://github.com/AH-Merii", "AH-Merii")),
    (image("icons/earth.svg"), "London, UK"),
  ),
)

#skills-section(
  (
    // Data Science & Machine Learning
    "Python", "Pandas", "Polars", "Numpy", "Sklearn",
    "PyTorch", "TensorFlow", "PyTorch Geometric", "Hugging Face",
    "ClearML",  "DVC", "Nextflow", "Biopython",
    
    // Visualization & Apps
    "Plotly", "Streamlit", "marimo", "Jupyter", "Altair",
    
    // Software Engineering & DevOps
    "DevOps","Git", "GitHub Actions", "Docker", "Make", "Terraform",
    "CI/CD", "AWS","Boto","SageMaker", "Cloud Computing", "Lambda", "MLOps",
    "Unit Testing", "Pytest", "OOP",
    
    // Linux & Command-Line Tools
    "Linux", "Neovim", "Sed", "JQ", "Requests", "Jira", "Agile",
    
    // Languages
    "English", "Arabic"  ),
  justify: false,
  annotation: "- All professional proficiency or above"
)

= Experience

#company-heading("Silence Therapeutics", start: "April 2021", end: "Present",  icon: image("icons/Silence.svg"))[
  #job-heading("Senior Machine Learning Engineer", location: "London, UK", start: "12/2022", end: "Present")[
    #bullet-list(
      [*Migrated & Optimized* ETL from *PySpark* to *Polars*, cutting runtime *15 h → \<2 min* using *5×* less compute, *reducing* cost up to *£40k* annually],
      [*Provisioned* *AWS SageMaker Studio* via *Terraform* and *on-boarded* team; integrated *marimo* notebooks for *1-click* kernel/instance switching & reproducible envs],
      [*Deployed* *ClearML* MLOps Platform on *AWS Fargate* utilizing *Terraform IaC*. *Configured* *SGs*, *IAM roles*, *VPCs*, and proxies. Enabled ML practitioners to reproduce experiments, collaborate on projects, scale models resulting in a *10x* increase in experiments.],
      [*Led* the development of ML projects/pipelines E2E, from identifying project requirements and partner dependencies to workload balancing, software implementation, engineering, testing, and configuring metrics, visualizations, and dashboards. (*Up to 2x performance boost*)],
      [*Coordinated* with *DevOps* team in developing, configuring, & testing the *ClearML autoscaler*, enabling on-demand, configurable compute resources that dynamically adapt & scale to multi-user loads. *Decreased* pipeline run-times from hours to *under 15 mins*.],
      [*Continuous Integration/Deployment* Pipeline Integration, *pull requests*, *code reviews*, *load/stress testing*, *unit/integration/e2e testing*.],
      [*Supervising* a *PhD* student's research on *RNA encoding* for enhanced ML predictions, in collaboration with the *Rosalind Franklin Institute*.],
      [*Led* strategic and technical guidance for bioinformaticians, statistical geneticists, data scientists on ML projects, *tripling ML projects*.],
    )
  ]
  

  #job-heading("Machine Learning Engineer", location: "London, UK", start: "04/2021", end: "12/2022")[
    #bullet-list(
      [*Directed* the consolidation of dispersed historical company data from *Excel* to *DVC*, integrating key external databases such as *NCBI* and *Ensembl*. Focused on rigorous data cleaning, formatting, and structuring in *third normal form* enhancing quality and reliability.],
      [*Data Version Control* for efficient dataset sharing among bioinformaticians, enhancing *reproducibility* & *traceability* in research workflows.],
      [*Introduced* comprehensive *SDLC* & *CI/CD* practices *GH Actions*, transitioning the team to structured, high-quality software development.],
      [*Led* collaboration with bioinformaticians to establish data/ML pipelines for *siRNA activity*, improving *gene silencing* research efficiency.],
      [*Standardized* *Python* project setups with *Cookiecutter* templates and streamlined deployments across environments using *Terraform*.],
      [*Designed* custom ML project evaluation metrics & visualization library with *Plotly*, enhancing insights & consistency for bioinformaticians.],
    )  ]
]

#company-heading("Khatib & Alami", start: "August 2020", end: "April 2021", icon: image("icons/KA.svg"))[
  #job-heading("Data Scientist", location: "Beirut, Lebanon")[
    #bullet-list(
      [*Trained* Satellite Imagery *Multi-Temporal Change Detection Segmentation Model* using *SpaceNet 7* Dataset.],
      [*Managed* building-construction dataset labelling; *trained* & *deployed* building-construction segmentation *POC*],
      [*Built* satellite imagery segmentation pipeline (roads & buildings) using *Solaris* & *PyTorch*],
      [*Trained* an *Arabic OCR classifier* used for digital archiving using *Google Tesseract*, to be used on over *100,000* documents.],
  )]
]

#company-heading("ArabiaGIS", start: "June 2019", end: "August 2020", icon: image("icons/AGIS.svg"), below: 0em)[
  #job-heading("Junior Data Scientist", location: "Beirut, Lebanon")[
  ]
]

= Projects

#bullet-list(
  [*Agentic Meta-Analysis Paper Extractor*: Built *marimo* app extracting *structured clinical trial data* from PDFs using Google *Gemini* AI and *PydanticAI* for schema validation],
  [*Protein Function Prediction using GNNs*: Utilized *3D protein data* from *PDB* and trained *GNN* achieving an *fmax score 0.6*.],
  [*Supercharge My Shell (SMS)*: Developed reproducible portable development environment, supports *WSL2*, *Debian* & *Arch*],
)

= Education

#school-heading("University of Leeds", start: "2017", end: "2018")[
  #degree-heading("Masters in Robotics & Mechatronics", location: "Leeds, UK")[]
]

#school-heading("American University of Sharjah", start: "2013", end: "2016")[
  #degree-heading("BSc in Mechanical Engineering", location: "Sharjah, UAE")[]
]

