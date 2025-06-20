// resume.typ
#import "constants.typ": *
#import "helpers.typ": *
#import "state.typ": __get, __set

// Main resume function
#let resume(
  name: "YOUR NAME HERE",
  tagline: none,
  profile-img-path: none,  // optional profile pic for the header
  linkedin: none, // optional linkedin url
  paper: "us-letter",
  heading-font: HEADING_FONT,
  body-font: BODY_FONT,
  body-size: BODY_SIZE,
  icon-contact-header: none,
  keywords: "",
  // QR codes with optional links
  // Format: 
  //   - Single: image("qr.png") or (image: image("qr.png"), link: "https://example.com")
  //   - Multiple: ((image: image("qr1.png"), link: "https://example1.com"), 
  //                (image: image("qr2.png"), link: "https://example2.com"))
  qr-codes: none, // check out https://qrframe.kylezhe.ng/ for QR code generation
  qr-spacing: 0.1in,  // Space between QR codes
  qr-height: 0.5in,   // Height of each QR code
  body
) = {
  // Document setup, mostly metadata in a PDF
  set document(
    title: "Résumé/CV of " + name,
    author: name,
    keywords: keywords,
  )

  // Page setup, including header and footer
  set page(
    paper: paper,
    margin: PAGE_MARGIN,
    header-ascent: -30%,
    numbering: "1 / 1",
    header: context {
      if here().page() == 1 and icon-contact-header != none {
        grid(
          columns: (1fr, auto),
          [],
          text(
            size: HEADER_SIZE,
            make-icon-header(icon-contact-header)
          )
        )
      }
    },
    footer: context {
      let multi_page = counter(page).final().first() > 1
      let date = datetime.today().display("[month repr:long] [day], [year]")
      text(size: FOOTER_SIZE, weight: FOOTER_TEXT_WEIGHT, font: heading-font)[
        #grid(
          columns: (1fr, 1fr, 1fr),
          align: (left, center, right + horizon),
          // left column
          [Last updated: #date],
          // center column
          if multi_page { counter(page).display(both: true, "1 of 1") },
          // right column - UPDATED to handle multiple QR codes
          if qr-codes != none {
            move(dy: -0.38in, {
              // Helper function to render a single QR code
              let render-qr = (qr-item) => {
                let qr-content = none
                let qr-link = none
                
                // Handle different input formats
                if type(qr-item) == dictionary {
                  qr-content = qr-item.at("image", default: none)
                  qr-link = qr-item.at("link", default: none)
                } else {
                  // Assume it's just an image
                  qr-content = qr-item
                }
                
                if qr-content != none {
                  let qr-box = box(height: qr-height, qr-content)
                  if qr-link != none {
                    link(qr-link, qr-box)
                  } else {
                    qr-box
                  }
                }
              }
              
              // Check if qr-codes is an array or single item
              if type(qr-codes) == array {
                // Multiple QR codes
                grid(
                  columns: qr-codes.len(),
                  column-gutter: qr-spacing,
                  align: horizon,
                  ..qr-codes.map(qr => render-qr(qr))
                )
              } else {
                // Single QR code
                render-qr(qr-codes)
              }
            })
          } else {
            [ ]
          }
        )
      ]
    },
  )

  // Global text settings
  set text(font: body-font, size: body-size, weight: BODY_WEIGHT, fallback: true)
  set par(justify: true)

  // Heading styles
  set heading(numbering: none)
  show heading.where(level: 1): it => {
    block(
      above: SECTION_HEADING_SPACE_ABOVE,
      below: SECTION_HEADING_SPACE_BELOW,
      breakable: false,
      [
        #text(size: SECTION_HEADING_SIZE, weight: SECTION_HEADING_WEIGHT, font: heading-font)[
          #context {
          if heading.numbering != none {
            counter(heading).display()
          }
        }
          #upper(it.body)
        ]
        #hrule(stroke: SECTION_HEADING_HRULE_STROKE)
      ]
    )
  }

  // Save our settings needed in other functions
  __set("heading-font", heading-font)

  // Main Headline with optional icon
  let icon_spacing = if profile-img-path != none { HEADLINE_ICON_SPACING } else { 0em }
  
  grid(
    columns: (auto, auto, 2fr),
    column-gutter: (icon_spacing, 0.5em),
    align: (left + horizon, left + bottom, right + bottom),
    
    // first column, optional icon
    if profile-img-path != none {
      block(
        clip: true,
        radius: HEADLINE_NAME_SIZE / 2,
        width: HEADLINE_NAME_SIZE,
        height: HEADLINE_NAME_SIZE,
        image(profile-img-path, fit: "cover", width: HEADLINE_NAME_SIZE, height: HEADLINE_NAME_SIZE)
      )
    },
    
    // second column, name (with optional link)
    {
      let headline_text = text(size: HEADLINE_NAME_SIZE, weight: HEADLINE_NAME_WEIGHT, font: heading-font, fill: HEADLINE_NAME_COLOR)[#smallcaps(name)]
      if linkedin != none { link(linkedin, headline_text) } else { headline_text }
    },
    
    // third column, tagline
    text(size: TAGLINE_SIZE, style: TAGLINE_STYLE, weight: TAGLINE_WEIGHT)[#tagline]
  )  
  hrule(stroke: HEADLINE_HRULE_STROKE)

  // The rest of the content
  body
}

// Alias resume to cv for non-Americans
#let cv = resume

// Creates a skills section with customizable separator and spacing between skills
// Optional annotation argument, adds annotation ex: - all skills are of proffesion..
// Output: Python | AWS | Docker | Git | Linux - all skills are of professional proficiency or higher
#let skills-section(
  skills,
  font: SKILLS_FONT,
  size: SKILLS_SIZE,
  weight: SKILLS_WEIGHT,
  separator: SKILLS_SEPARATOR,
  separator-spacing: SKILLS_SEPARATOR_SPACING,
  line-spacing: SKILLS_LINE_SPACING,
  word-spacing: SKILLS_WORD_SPACING,
  justify: SKILLS_JUSTIFY,
  annotation: none,
  annotation-separator: none,
) = {
  // Create the section header
  heading(level: 1)[Skills]
  
  // Create the separator with custom spacing and styling
  let sep = box(
    baseline: -0.15em, // Align with text baseline
    [#h(separator-spacing)#separator#h(separator-spacing)]
  )
  
  // Format skills with custom text flow
  block(
    spacing: line-spacing,
    text(font: font, size: size, weight: weight)[
      #set par(
        justify: justify, // Fill width
        leading: line-spacing, // Line height
        spacing: word-spacing, // Word spacing
      )
      #skills.join(sep)
      #if annotation != none [
        #annotation-separator#annotation
      ]
    ]
  )
}

#let bullet-list(
  ..items,
  font: BULLET_LIST_FONT,
  size: BULLET_LIST_SIZE,
  weight: BULLET_LIST_WEIGHT,
  marker: BULLET_LIST_MARKER,
  marker-color: BULLET_LIST_MARKER_COLOR,
  indent: BULLET_LIST_INDENT,
  line-spacing: BULLET_LIST_LINE_SPACING,
  body-indent: BULLET_LIST_BODY_INDENT, 
  word-spacing: BULLET_LIST_WORD_SPACING,
  wrapped-line-spacing: BULLET_LIST_WRAPPED_LINE_SPACING,
) = {
  // Apply text styling
  set text(
    font: font,
    size: size,
    weight: weight,
    spacing: word-spacing,
  )

  set par(
    leading: wrapped-line-spacing,
  )
  
  // Apply list styling
  set list(
    marker: text(fill: marker-color)[#marker],
    indent: indent,  // Overall list indentation
    body-indent: body-indent,  // Gap between marker and text
    spacing: line-spacing,  // Space between different bullets
  )
  
  // Create the list
  list(..items.pos())
}

#let company-heading(name, start: none, end: none, icon: none, body, below: COMPANY_BLOCK_BELOW) = {
  let icon_spacing = if icon != none { COMPANY_ICON_SPACING } else { 0em }
  block(
    below: below,
    breakable: false,

    grid(
      columns: (auto, auto, 1fr, auto),
      column-gutter: (icon_spacing, 0.5em),
      row-gutter: 0.5em,
      align: (left + horizon, left + horizon, right + horizon),

      // first column, optional icon
      if icon != none { box(height: COMPANY_ICON_SIZE, icon) },

      // second column, company name
      context text(
        weight: COMPANY_NAME_WEIGHT,
        size: COMPANY_NAME_SIZE,
        font: __get("heading-font"),
        name
      ),

      // third column, dots
      if start != none {
        repeat(h(0.3em) + "." + h(0.3em))
      } else {
        []
      },

      // fourth column, optional dates
      context text(
        weight: COMPANY_DATE_WEIGHT,
        size: COMPANY_DATE_SIZE,
        font: __get("heading-font"),

        if start != none {
          [#start -- #end]
        } else {
          [ ]
        }
      ),

      // second row, company content
      grid.cell(colspan: 4, body)
    )
  )
}


// Alias to school heading
#let school-heading = company-heading

#let job-heading(title, location: none, start: none, end: none, comment: none, body) = {
  block(
    above: JOB_BLOCK_ABOVE,
    below: JOB_BLOCK_BELOW,
    breakable: false,

    // heading
    grid(
      columns: (auto, auto, auto, 1fr, auto),
      gutter: 0.5em,
      align: (left + horizon, right + horizon),

      // first column, title
      context text(
        style: JOB_NAME_STYLE,
        weight: JOB_NAME_WEIGHT,
        size: JOB_NAME_SIZE,
        fill: black,
        font: __get("heading-font"),
        title
      ),

      // second column, job comment ellipsis
      if comment != none { [ ... ] },

      // third column, job comment ellipsis
      if comment != none { [ #comment ] },

      // fourth column, hfill
      h(1fr),

      // fifth column, optional location
      context text(
        style: JOB_LOCATION_STYLE,
        weight: JOB_LOCATION_WEIGHT,
        size: JOB_LOCATION_SIZE,
        font: __get("heading-font"),

        if location != none and start != none {
          [#location#[;] #h(0.25em)#start#if end != none [ -- #end]]
        } else if location != none {
          location
        } else if start != none {
          [#start#if end != none [ -- #end]]
        }
      ),

      grid.cell(colspan: 5, body)
    )
  )
}

// Alias to degree heading
#let degree-heading = job-heading