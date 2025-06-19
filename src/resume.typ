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
  thumbnail: none, // check out https://qrframe.kylezhe.ng/ for QR code generation
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
          // right column
          if thumbnail != none {
            move(dy: -0.25in, box(height: 0.5in, thumbnail))
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

  // Table style
  set table(
    stroke: none,
    fill: (x, y) => {
      if y == 0 {
        TABLE_HEADER_COLOR
      } else if calc.rem(y, 2) == 0 {
        TABLE_ZEBRA_COLOR_0
      } else {
        TABLE_ZEBRA_COLOR_1
      }
    },
  )

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
// Output: Python | AWS | Docker | Git | Linux (formatted across page width)
#let skills-section(
  skills,
  font: BODY_FONT,
  size: BODY_SIZE,
  weight: BODY_WEIGHT,
  separator: sym.divides, // defaults to | as a separator
  separator-spacing: 0.5em,
  line-spacing: 0.8em,  // Space between lines of skills
  word-spacing: 0.05em,  // Additional spacing between words for better fill
  justify: true,
) = {
  // Create the section header
  heading(level: 1)[Skills]
  
  // Create the separator with custom spacing and styling
  let sep = box(
    baseline: -0.15em,  // Align with text baseline
    [#h(separator-spacing)#separator#h(separator-spacing)]
  )
  
  // Format skills with better text flow
  block(
    spacing: line-spacing,
    text(font: font, size: size, weight: weight)[
      #set par(
        justify: justify,  // Fill width
        leading: line-spacing,  // Line height
        spacing: word-spacing,  // Word spacing
      )
      #skills.join(sep)
    ]
  )
}

#let company-heading(name, start: none, end: none, icon: none, body) = {
  let icon_spacing = if icon != none { COMPANY_ICON_SPACING } else { 0em }
  block(
    below: COMPANY_BLOCK_BELOW,
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

