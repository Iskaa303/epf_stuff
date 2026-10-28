// Unit 1 poster: DOJ v. Apple and the Microsoft comparison.
// Compile: devenv shell -- typst compile poster.typ
// Symbol rule: use #sym.* for characters a keyboard cannot type.

#set page(
  width: 11in,
  height: 17in,
  margin: (x: 0.58in, top: 0.34in, bottom: 0.26in),
  fill: rgb("#f4f1e9"),
)
#set text(font: "Libertinus Serif", size: 8.5pt, fill: rgb("#1b1a17"))
#set par(leading: 0.56em, justify: true, spacing: 0.68em)

#let ink = rgb("#1b1a17")
#let paper = rgb("#f4f1e9")
#let accent = rgb("#8a2c1d")
#let accent-bright = rgb("#dd8465")
#let accent-soft = rgb("#e7d3ca")
#let muted = rgb("#6c675d")
#let rule = rgb("#c7c0b2")
#let dark-track = rgb("#3a3731")
#let dark-muted = rgb("#a79f92")
#let dot = sym.dot.c

// References live in references.yaml so citations and links stay in one place.
#let refs = yaml("references.yaml")

// Clickable source marker, e.g. superscript 3 linked to reference 3.
// Inline marker: superscript [n] that jumps to the reference entry below.
#let cite(n, c: accent) = link(
  label("ref-" + str(n)),
  super(text(font: "DejaVu Sans", size: 5.4pt, weight: "bold", fill: c, "[" + str(n) + "]")),
)

#let domain(url) = url.replace("https://", "").replace("http://", "").split("/").first()

#let reflist(items, start) = {
  for (i, r) in items.enumerate() {
    block(spacing: 0.03em, breakable: false)[
      #text(size: 6.1pt)[
        #text(font: "DejaVu Sans", size: 5.9pt, weight: "bold", fill: accent)[#(start + i).]
        #h(0.03in)
        #link(r.url)[#r.title]
        #text(size: 5.9pt, fill: muted)[, #r.source. #link(r.url)[#text(fill: accent)[#domain(r.url)]]]
      ]
      #label("ref-" + str(start + i))
    ]
    v(0.055in)
  }
}

// Highlighted formal vocabulary. Every term below is used in an argument.
#let t(x) = box(
  fill: accent-soft,
  outset: (x: 2pt, y: 1.1pt),
  radius: 0.5pt,
  text(fill: rgb("#732315"), weight: "semibold", x),
)

#let kicker(x, c: accent) = text(
  font: "DejaVu Sans", size: 6.7pt, weight: "bold",
  tracking: 0.13em, fill: c, x,
)

// ---------- header ----------

#grid(
  columns: (1fr, auto),
  align: (left + bottom, right + bottom),
)[
  #kicker("EXHIBIT BRIEF  /  UNIT 1  /  MONOPOLY & MARKET POWER")
][
  #text(font: "DejaVu Sans", size: 6.7pt, tracking: 0.06em, fill: muted)[
    UNITED STATES V. APPLE INC. #dot FILED 21 MAR 2024
  ]
]

#v(0.10in)
#line(length: 100%, stroke: 1.6pt + ink)
#v(0.035in)
#line(length: 100%, stroke: 0.5pt + ink)
#v(0.16in)

#block(spacing: 0.10em)[
  #set par(leading: 0.08em)
  #text(size: 32pt, weight: "bold", tracking: -0.018em)[
    Apple's iPhone Is Not a Monopoly \
    the Way Windows Was
  ]
]

#v(0.11in)

#text(size: 9.9pt, fill: rgb("#413d36"))[
  A market-definition defense of the government's 2024 Section 2 suit, and the
  narrow interoperability remedy that follows from it.
]

#v(0.16in)

#grid(
  columns: (1fr, 1fr, 1fr, auto),
  column-gutter: 0.16in,
  align: left + horizon,
)[
  #kicker("ANALYST", c: muted) #h(0.05in) #text(weight: "bold")[#text("Iskander Madikhan")]
][
  #kicker("COURSE", c: muted) #h(0.05in) #text(weight: "bold")[Economics, Period #text("1A")]
][
  #kicker("SOURCE", c: muted) #h(0.05in) TechCrunch, Mar. 21, 2024#cite(1)
][
  #box(fill: accent, inset: (x: 7pt, y: 3pt))[
    #text(font: "DejaVu Sans", size: 6.5pt, weight: "bold", tracking: 0.1em, fill: paper)[
      6-STAGE ANALYSIS
    ]
  ]
]

#v(0.13in)
#line(length: 100%, stroke: 0.5pt + rule)
#v(0.15in)

// ---------- helpers ----------

#let section(num, title, body) = block(breakable: false)[
  #grid(
    columns: (0.3in, 1fr),
    column-gutter: 0.11in,
    align: (left + top, left + top),
  )[
    #block(width: 0.3in, height: 0.3in, fill: accent)[
      #set align(center + horizon)
      #text(size: 11.5pt, weight: "bold", fill: paper)[#num]
    ]
  ][
    #text(font: "DejaVu Sans", size: 7.5pt, weight: "bold", tracking: 0.1em, fill: accent, upper(title))
    #v(0.045in)
    #body
  ]
]

#let strip(name, sub, value, display, ref) = {
  grid(
    columns: (2.5in, 1fr, 0.78in),
    column-gutter: 0.13in,
    align: (left + horizon, left + horizon, right + horizon),
  )[
    #text(size: 9.6pt, weight: "bold")[#name]
    #linebreak()
    #text(font: "DejaVu Sans", size: 6.4pt, fill: dark-muted)[#sub]#cite(ref, c: accent-bright)
  ][
    #block(width: 100%, height: 0.20in)[
      #place(top + left, rect(width: 100%, height: 100%, fill: dark-track))
      #place(top + left, rect(width: value * 1%, height: 100%, fill: accent-bright))
      #for p in (25, 50, 75) [
        #place(
          top + left,
          dx: p * 1% - 0.5pt,
          rect(width: 1pt, height: 100%, fill: rgb("#f4f1e94d")),
        )
      ]
      #place(
        top + left,
        dx: value * 1% - 1pt,
        rect(width: 2.2pt, height: 100%, fill: paper),
      )
    ]
  ][
    #text(size: 13.5pt, weight: "bold")[#display]
  ]
}

#let waffle(apple, samsung) = {
  let cells = ()
  for i in range(100) {
    let c = if i < apple {
      accent
    } else if i < apple + samsung {
      ink
    } else {
      rgb("#d9d3c5")
    }
    cells.push(rect(width: 0.105in, height: 0.105in, fill: c))
  }
  grid(columns: (0.105in,) * 10, gutter: 0.015in, ..cells)
}

// ---------- body ----------

#grid(
  columns: (1fr, 1fr),
  column-gutter: 0.34in,
  row-gutter: 0.12in,
  align: (left + top, left + top),

  section(1, "Economic problem definition", [
    On March 21, 2024, the Department of Justice, 16 states, and the District of
    Columbia sued Apple under Section 2 of the Sherman Act#cite(2), alleging that the company maintained monopoly
    power in the US premium smartphone market. Proving that takes two steps: a
    properly defined #t[relevant market], then a durable share of it protected
    by #t[barriers to entry]. The second step is where the Microsoft parallel
    breaks. Windows ran on more than 90% of the world's PCs and had no viable
    substitute#cite(1). The iPhone holds a majority of US units#cite(3) and a
    minority of global ones#cite(3). The stakeholders are iPhone buyers, app
    developers, and rival handset makers.

    #v(0.06in)
    #text(size: 7.8pt, fill: muted)[
      #text(font: "DejaVu Sans", size: 6.4pt, weight: "bold", tracking: 0.09em, fill: accent)[TIMELINE]
      #h(0.06in) App Store opens 2008. DOJ suit filed 21 Mar 2024#cite(2).
    ]
  ]),

  section(2, "Underlying causes", [
    The case rests on a market definition, not on a price. The DOJ draws the
    line at the US border and at the premium tier#cite(2), then names three
    forces that hold users in place: #t[switching costs] from apps, data, and a new
    interface; #t[network effects] from iMessage and FaceTime; and Apple's
    control of App Store distribution. All three exist. The dispute is whether
    they #t[foreclose] rivals or simply reflect #t[product differentiation].
    Integration is also the supply-side reason the iPhone wins: one firm designs
    the chip, the OS, and the services together. Android already supplies the
    substitute: Samsung alone holds 18% of US units#cite(3), and low-cost Android
    makers hold most of the global market#cite(1), so developers do not face a
    single gatekeeper.
  ]),

  // ---- exhibit A: full width ----
  grid.cell(colspan: 2)[
    #block(width: 100%, fill: ink, inset: (x: 0.34in, y: 0.22in))[
      #set text(fill: paper)
      #grid(
        columns: (1fr, auto),
        align: (left + bottom, right + bottom),
      )[
        #kicker("EXHIBIT A / MARKET POWER", c: accent-bright)
        #v(0.05in)
        #par(leading: 0.95em)[
          #text(size: 19pt, weight: "bold", tracking: -0.01em)[
            Share depends on where you draw the line.
          ]
        ]
      ][
        #text(font: "DejaVu Sans", size: 6.5pt, fill: dark-muted, tracking: 0.05em)[
          SAME COMPANY #dot FOUR MEASURES
        ]
      ]

      #v(0.06in)
      #text(size: 8.6pt, fill: dark-muted)[
        A Section 2 claim needs durable dominance over a defined market. On the
        broadest honest measure, Apple holds under a quarter of global phone
        units; Windows held more than nine in ten PCs.
      ]

      #v(0.15in)

      #strip("Microsoft Windows", "PC operating systems, worldwide, 1990s", 90, [>90%], 1)
      #v(0.07in)
      #strip("iPhone, US revenue", "DOJ allegation, 2024", 70, [>70%], 2)
      #v(0.07in)
      #strip("iPhone, US units", "Q4 2023, Counterpoint Research", 64, [64%], 3)
      #v(0.07in)
      #strip("iPhone, global units", "Q4 2023, Counterpoint Research", 23, [23%], 3)

      #v(0.08in)
      #line(length: 100%, stroke: 0.4pt + rgb("#5a554b"))
      #v(0.07in)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
      )[
        #text(font: "DejaVu Sans", size: 6.2pt, fill: dark-muted)[
          Sources: TechCrunch (21 Mar 2024); DOJ complaint; Counterpoint Research
          Q4 2023; Goldman Sachs estimate via The Register (2012). The 90% figure
          is "well over 90%" in the original.
        ]
      ][
        #text(font: "DejaVu Sans", size: 6.2pt, weight: "bold", fill: accent-bright)[
          TICK MARKS = 25%
        ]
      ]
    ]
  ],

  section(3, "Economic consequences", [
    A ruling that accepts a narrow market makes share alone close to sufficient
    for liability. That shifts the expected return on integration: bundling
    security or privacy features becomes a legal risk once the bundle sells
    well. Consumers get slower feature delivery, and developers get unsettled
    platform rules. The long-term cost is a loss of #t[dynamic efficiency],
    because the
    investment that produced the iPhone is the same investment a remedy would
    penalize. Inaction has a cost too. Years of litigation freeze platform
    decisions, and the chilling effect arrives before any verdict. The
    #t[deadweight loss] is hard to size, because Apple's price premium reflects
    quality as well as market power.
  ]),

  section(4, "Proposed solution", [
    Drop the breakup and prescribe a narrow #t[interoperability] remedy.
    First, require Apple to support cross-platform RCS messaging, which it began
    doing with iOS 18#cite(6), so the blue and green bubble gap stops working as
    a switching cost. Second, require notarized third-party app distribution on
    the same security terms as the App Store, the model the EU Digital Markets
    Act forced in March 2024#cite(5). Third, require global and contestable-market
    evidence before a Section 2 claim can rest on share alone.

    #v(0.06in)
    The mechanism attacks the switching cost instead of the firm's size. Lower
    switching costs raise the #t[elasticity of demand] Apple faces, which
    constrains price without a regulator setting it.
  ]),

  // ---- exhibit B: full width ----
  grid.cell(colspan: 2)[
    #block(width: 100%, stroke: 0.8pt + ink, inset: (x: 0.34in, y: 0.22in))[
      #grid(
        columns: (1fr, auto),
        align: (left + bottom, right + bottom),
      )[
        #kicker("EXHIBIT B / MARKET DEFINITION")
        #v(0.05in)
        #par(leading: 0.95em)[
          #text(size: 19pt, weight: "bold", tracking: -0.01em)[
            One market, two pictures.
          ]
        ]
      ][
        #text(font: "DejaVu Sans", size: 6.5pt, fill: muted, tracking: 0.05em)[
          EACH SQUARE = 1% OF UNITS SHIPPED
        ]
      ]

      #v(0.06in)
      #text(size: 8.6pt, fill: rgb("#413d36"))[
        Draw the border around the United States and Apple looks dominant. Draw
        it around the planet and the market is fragmented, with a rival platform
        that developers already support.
      ]

      #v(0.14in)

      #grid(
        columns: (1fr, 1fr, 1.15fr),
        column-gutter: 0.3in,
        align: (left + top, left + top, left + top),
      )[
        #text(font: "DejaVu Sans", size: 6.6pt, weight: "bold", tracking: 0.1em, fill: accent)[UNITED STATES #dot Q4 2023]
        #v(0.02in)
        #text(size: 26pt, weight: "bold", tracking: -0.03em)[64#text(size: 15pt)[%]]
        #v(0.02in)
        #text(font: "DejaVu Sans", size: 6.4pt, fill: muted)[APPLE SHARE OF UNITS]
        #v(0.12in)
        #waffle(64, 18)
      ][
        #text(font: "DejaVu Sans", size: 6.6pt, weight: "bold", tracking: 0.1em, fill: accent)[WORLD #dot Q4 2023]
        #v(0.02in)
        #text(size: 26pt, weight: "bold", tracking: -0.03em)[23#text(size: 15pt)[%]]
        #v(0.02in)
        #text(font: "DejaVu Sans", size: 6.4pt, fill: muted)[APPLE SHARE OF UNITS]
        #v(0.12in)
        #waffle(23, 16)
      ][
        #text(font: "DejaVu Sans", size: 6.6pt, weight: "bold", tracking: 0.1em, fill: muted)[READ THE GAP]
        #v(0.07in)
        #text(size: 8.6pt)[
          The US number depends on a narrow market. Global units put Apple at 23%
          against Samsung at 16%#cite(3), with low-cost Android makers holding
          the rest. A firm with a fifth of a contested global market is not in
          the position Microsoft occupied in 2000, when its software ran on an
          estimated 97% of computing devices#cite(4).
        ]
        #v(0.12in)
        #text(font: "DejaVu Sans", size: 6.4pt, fill: muted)[
          #text(weight: "bold", fill: ink)[LEGEND] #h(0.08in)
          #box(width: 7pt, height: 7pt, fill: accent) Apple #h(0.1in)
          #box(width: 7pt, height: 7pt, fill: ink) Samsung #h(0.1in)
          #box(width: 7pt, height: 7pt, fill: rgb("#d9d3c5")) Others
        ]
      ]

      #v(0.12in)
      #line(length: 100%, stroke: 0.4pt + rule)
      #v(0.05in)
      #text(font: "DejaVu Sans", size: 6.2pt, fill: muted)[
        Source: Counterpoint Research, US and global smartphone shipments, Q4
        2023, as reported by TechCrunch (21 Mar 2024). Percentages are rounded
        and may not total 100.
      ]
    ]
  ],

  section(5, "Positive outcomes & trade-offs", [
    The gains show up in #t[consumer surplus]: easier exit makes Apple compete
    harder on price and features, and alternative app stores and payment
    processors can enter. The costs are real. The #t[opportunity cost] is the
    security and privacy spending that integration funds, and sideloading widens
    the attack surface because notarization is a weaker check than App Store
    review. Apple may also recover lost App Store rent from developers through
    higher tooling fees. The remedy trades some product quality for more
    competition, and that trade should be measured rather than assumed.
  ]),

  block(width: 100%, fill: accent, inset: (x: 0.22in, y: 0.17in))[
    #set text(fill: paper)
    #kicker("SECTION 6 / EXECUTIVE PITCH", c: rgb("#f0c9bd"))
    #v(0.08in)
    #text(size: 9.4pt, weight: "bold", tracking: -0.005em)[
      The DOJ's suit treats the iPhone as the next Windows, but the market
      evidence does not support the parallel: Windows held over 90% of PC
      operating systems worldwide, while the iPhone holds about 64% of US units
      and 23% globally against an Android rival that developers already support.
    ]
    #v(0.1em)
    #text(size: 9.4pt, weight: "bold", tracking: -0.005em)[
      The better remedy is narrow interoperability, RCS messaging and notarized
      third-party app distribution, backed by a market-definition test that
      demands global and contestable-market evidence.
    ]
    #v(0.1em)
    #text(size: 9.4pt, weight: "bold", tracking: -0.005em)[
      That combination lowers switching costs and consumer prices and opens
      distribution, while keeping the integration that iPhone buyers pay for.
    ]
  ],
)

#v(0.08in)
#line(length: 100%, stroke: 0.5pt + rule)
#v(0.06in)

// ---------- citations ----------

#grid(
  columns: (auto, 1fr),
  column-gutter: 0.16in,
  align: (left + top, left + top),
)[
  #kicker("SOURCES", c: accent)
  #v(0.04in)
  #text(font: "DejaVu Sans", size: 6.3pt, fill: muted)[MRU UNIT 1]
  #v(0.06in)
  #text(font: "DejaVu Sans", size: 5.9pt, fill: muted)[
    Each bracketed number is a clickable link to its source below.
    Highlighted text marks formal economic vocabulary.
  ]
][
  #set par(justify: false, leading: 0.52em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.28in,
    row-gutter: 0.05em,
  )[
    #reflist(refs.slice(0, 4), 1)
  ][
    #reflist(refs.slice(4), 5)
  ]
]
