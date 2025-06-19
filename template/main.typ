// main.typ
#import "@local/resume-builder:0.1.0": *

#show: resume.with(
  name: "AbdulHamid Merii",
  profile-img-path: "../template/assets/profile_pic.jpg",
  tagline: "Senior ML Engineer; expertise in MLOps, cloud infra, & E2E ML pipelines.",
  keywords: "machine learning, MLOps, AWS, Python, DevOps",
  icon-contact-header: (
    (image("icons/email.svg"),    link("mailto:ah_merii@outlook.com", "ah_merii@outlook.com")),
    (image("icons/phone.svg"),    link("tel:+447864058889", "+44 (7) 864058889")),
    (image("icons/github.svg"),   link("https://github.com/AH-Merii", "AH-Merii")),
    (image("icons/earth.svg"), "London, UK"),
  ),
)

// updated skills section  to be part ofa function
#skills-section(
  (
    "Python", "Pandas", "Numpy", "Sklearn", "PyTorch", "TensorFlow", 
    "PyTorch Geometric", "Hugging Face", "Node", "Biopython", "Plotly", "Streamlit",
    "AWS", "Cloud Computing", "CI/CD", "Pytest", "Docker", "Make", 
    "Unit Testing", "Lambda", "OOP", "Linux", "Neovim", "Git", "Sed", "JQ", "Requests",
    "Terraform", "ClearML", "MLOps", "DVC", "Jira", "GitHub Actions", "Jupyter", "Agile",
    "English", "Arabic"
  ),
  font: "Helvetica",           // Different font
  size: 10pt,                  // Smaller size
  weight: "regular",           // Lighter weight (instead of "light")
  separator: "•",              // Bullet instead of pipe
  separator-spacing: 0.15em,   // Much tighter spacing
)

= Old Skills Section

*Programming & ML:* Python, Pandas, Numpy, Sklearn, PyTorch, TensorFlow, PyTorch Geometric, Hugging Face, Node, Biopython, Plotly, Streamlit

*Cloud & DevOps:* AWS, Cloud Computing, CI/CD, Pytest, Docker, Make, Unit Testing, Lambda, OOP, Linux, Neovim, Git, Sed, JQ, Requests

*MLOps & Tools:* Terraform, ClearML, MLOps, DVC, Jira, GitHub Actions, Jupyter, Agile

*Languages:* English, Arabic – All professional proficiency or above

= Experience

#company-heading("Silence Therapeutics", start: "December 2022", end: "Present",  icon: image("icons/Silence.svg"))[
  #job-heading("Senior Machine Learning Engineer", location: "London, UK")[
    - Deployed ClearML MLOps Platform on AWS Fargate utilizing Terraform IaC. Configured SGs, IAM roles, VPCs, and proxies. Enabled ML practitioners to reproduce experiments, collaborate on projects, scale models resulting in a 10x increase in experiments.
    - Led the development of ML projects/pipelines E2E, from identifying project requirements and partner dependencies to workload balancing, software implementation, engineering, testing, and configuring metrics, visualizations, and dashboards. (Up to 2x perf boost)
    - Coordinated with DevOps team in developing, configuring, & testing the ClearML autoscaler, enabling on-demand, configurable compute resources that dynamically adapt & scale to multi-user loads. Decreased pipeline run-times from hours to under 15 mins.
    - Continuous Integration/Deployment Pipeline Integration, pull requests, code reviews, load/stress testing, unit/integration/e2e testing.
    - Supervising a PhD student's research on RNA encoding for enhanced ML predictions, in collaboration with the Rosalind Franklin Institute.
    - Led strategic and technical guidance for bioinformaticians, statistical geneticists, data scientists on ML projects, doubling ML projects.
  ]
]

#company-heading("Silence Therapeutics", start: "April 2021", end: "December 2022", icon: image("icons/Silence.svg"))[
  #job-heading("Machine Learning Engineer", location: "London, UK")[
    - Directed the consolidation of dispersed historical company data from Excel to DVC, integrating key external databases such as NCBI and Ensembl. Focused on rigorous data cleaning, formatting, and structuring in third normal form enhancing quality and reliability.
    - Data Version Control for efficient dataset sharing among bioinformaticians, enhancing reproducibility & traceability in research workflows.
    - Introduced comprehensive SDLC & CI/CD practices GH Actions, transitioning the team to structured, high-quality software development.
    - Led collaboration with bioinformaticians to establish data/ML pipelines for siRNA activity, improving gene silencing research efficiency.
    - Standardized Python project setups with Cookiecutter templates and streamlined deployments across environments using Terraform.
    - Designed custom ML project evaluation metrics & visualization library with Plotly, enhancing insights & consistency for bioinformaticians.
  ]
]

#company-heading("Khatib & Alami", start: "August 2020", end: "April 2021", icon: image("icons/KA.svg"))[
  #job-heading("Data Scientist", location: "Beirut, Lebanon")[
    - Trained Satellite Imagery Multi-Temporal Change Detection and Segmentation Model using SpaceNet 7 Dataset.
    - Managed labeling of Building Construction Dataset; trained, and deployed Building Construction Segmentation POC.
    - Created Data Pipeline for Satellite Imagery Segmentation for Road Network Classification and Building Footprint Segmentation using Solaris and PyTorch.
    - Trained an Arabic OCR classifier used for digital archiving using Google Tesseract, to be used on over 100,000 documents.
  ]
]

#company-heading("ArabiaGIS", start: "June 2019", end: "August 2020", icon: image("icons/AGIS.svg"))[
  #job-heading("Junior Data Scientist", location: "Beirut, Lebanon")[
  ]
]

#company-heading("Pacific Marine Research Center", start: "July 2005", end: "August 2009", icon: image("icons/microscope.svg"))[
  #job-heading("Research Assistant", location: "San Diego, California",
    comment: [Contributed to 7 published studies. #footnote[Visit https://amirapatel.org/publications for full list of publications.]]
  )[]
]

= Projects

*Audio File Summarization:* Utilized Amazon Bedrock, deployed to AWS Lambda for scalable automation, event-driven operations.

*Protein Function Prediction using GNNs:* Utilized 3D protein data from PDB and trained GNN achieving an fmax score 0.6.

*Supercharge My Shell (SMS):* Developed lightweight portable development environment, supports WSL2, Debian & Arch.

= Education

#school-heading("University of Leeds", start: "2017", end: "2018")[
  #degree-heading("Masters in Robotics & Mechatronics", location: "Leeds, UK")[]
]

#school-heading("American University of Sharjah", start: "2013", end: "2016")[
  #degree-heading("BSc in Mechanical Engineering", location: "Sharjah, UAE")[]
]

