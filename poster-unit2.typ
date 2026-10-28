// Unit 2 poster: Argentina under Milei, growth and disinflation.
// Compile: devenv shell -- typst compile poster-unit2.typ
// Symbol rule: use #sym.* for characters a keyboard cannot type.

#set page(
  width: 11in,
  height: 17in,
  margin: (x: 0.58in, top: 0.34in, bottom: 0.26in),
  fill: rgb("#f2efe6"),
)
#set text(font: "Libertinus Serif", size: 8.5pt, fill: rgb("#1b1a17"))
#set par(leading: 0.56em, justify: true, spacing: 0.68em)

#let ink = rgb("#1b1a17")
#let paper = rgb("#f2efe6")
#let accent = rgb("#2f5d4a")
#let accent-bright = rgb("#83b7a3")
#let accent-soft = rgb("#d8e4dc")
#let muted = rgb("#6c675d")
#let rule = rgb("#c7c0b2")
#let dark-track = rgb("#2f3a35")
#let dark-muted = rgb("#a9b3ac")
#let dot = sym.dot.c

// References live in references-unit2.yaml so citations and links stay in one place.
#let refs = yaml("references-unit2.yaml")

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
  text(fill: rgb("#1f4a39"), weight: "semibold", x),
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
  #kicker("EXHIBIT BRIEF  /  UNIT 2  /  ECONOMIC GROWTH & PRODUCTIVITY")
][
  #text(font: "DejaVu Sans", size: 6.7pt, tracking: 0.06em, fill: muted)[
    ARGENTINA #dot JUL 2025
  ]
]

#v(0.10in)
#line(length: 100%, stroke: 1.6pt + ink)
#v(0.035in)
#line(length: 100%, stroke: 0.5pt + ink)
#v(0.16in)

#block(spacing: 0.10em)[
  #set par(leading: 0.1em, spacing: 0em)
  #text(size: 33pt, weight: "bold", tracking: -0.018em)[
    Milei Keeps Proving \
    His Critics Wrong
  ]
]

#v(0.11in)

#text(size: 9.9pt, fill: rgb("#413d36"))[
  How fiscal discipline and deregulation cut Argentina's inflation and
  restarted growth, and what the adjustment still costs.
]

#v(0.16in)

#grid(
  columns: (1fr, 1fr, 1fr, auto),
  column-gutter: 0.16in,
  align: left + horizon,
)[
  #kicker("ANALYST", c: muted) #h(0.05in) #text(weight: "bold")[Iskander Madikhan]
][
  #kicker("COURSE", c: muted) #h(0.05in) #text(weight: "bold")[Economics, Period 1A]
][
  #kicker("SOURCE", c: muted) #h(0.05in) Newsweek, Jul. 7, 2025#cite(1)#cite(7)
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

#let inflbar(value, label, sub, final: false) = block(
  height: 2.28in,
  width: 100%,
  align(bottom + center)[
    #text(size: 9pt, weight: "bold", fill: paper)[#label]
    #v(0.04in)
    #rect(
      width: 0.56in,
      height: value / 25.5 * 1.8in,
      fill: if final { paper } else { accent-bright },
      stroke: if final { 1.2pt + accent-bright } else { none },
    )
    #v(0.02in)
    #line(length: 100%, stroke: 0.5pt + rgb("#5a554b"))
    #v(0.05in)
    #text(font: "DejaVu Sans", size: 6.2pt, fill: dark-muted)[#sub]
  ],
)

#let panel(label, before, after, x1, x2, note) = [
  #text(font: "DejaVu Sans", size: 6.5pt, weight: "bold", tracking: 0.1em, fill: accent)[#label]
  #v(0.05in)
  #grid(columns: (auto, auto, 1fr), column-gutter: 0.07in, align: horizon)[
    #text(size: 15pt, weight: "bold", fill: muted)[#before]
    #text(size: 10pt, fill: muted)[#sym.arrow.r]
    #text(size: 20pt, weight: "bold", fill: accent)[#after]
  ]
  #v(0.11in)
  #block(width: 100%, height: 0.16in)[
    #place(left + horizon, rect(width: 100%, height: 0.7pt, fill: rule))
    #place(left + horizon, dx: x1 * 1% - 3pt, circle(radius: 3.2pt, fill: muted))
    #place(left + horizon, dx: x2 * 1% - 3.2pt, circle(radius: 3.2pt, fill: accent))
  ]
  #v(0.07in)
  #text(size: 6.5pt, fill: muted)[#note]
]

// ---------- body ----------

#grid(
  columns: (1fr, 1fr),
  column-gutter: 0.34in,
  row-gutter: 0.12in,
  align: (left + top, left + top),

  section(1, "Economic problem definition", [
    Argentina entered December 2023 with monthly inflation at 25.5%#cite(1),
    poverty at 53%#cite(1), and a central bank financing the treasury#cite(3).
    The problem is not one recession. It is a regime of #t[fiscal dominance], in
    which deficits are monetized, plus exchange and price controls that suppress
    supply. The stakeholders are low-income households, pensioners, savers, and
    small firms, because inflation is a tax on the money they hold.

    #v(0.06in)
    #text(size: 7.8pt, fill: muted)[
      #text(font: "DejaVu Sans", size: 6.4pt, weight: "bold", tracking: 0.09em, fill: accent)[TIMELINE]
      #h(0.06in) Milei takes office Dec. 2023. IMF program Apr. 2025.
    ]
  ]),

  section(2, "Underlying causes", [
    Three supply-side distortions explain the stagnation. Persistent deficits
    were monetized, so seigniorage became an #t[inflation tax]. The cepo
    #t[exchange controls] rationed dollars and distorted relative prices. Rent
    control, a form of #t[price controls], reduced the supply of housing. The
    result was low #t[capital formation], weak #t[total factor productivity],
    and a long record of stop-go growth#cite(1). These are policy choices, not
    resource endowments.
  ]),

  // ---- exhibit A: full width ----
  grid.cell(colspan: 2)[
    #block(width: 100%, fill: ink, inset: (x: 0.34in, y: 0.22in))[
      #set text(fill: paper)
      #grid(
        columns: (1fr, auto),
        align: (left + bottom, right + bottom),
      )[
        #kicker("EXHIBIT A / DISINFLATION", c: accent-bright)
        #v(0.05in)
        #par(leading: 0.95em)[
          #text(size: 19pt, weight: "bold", tracking: -0.01em)[
            Seventeen months from 25.5% to 1.5%.
          ]
        ]
      ][
        #text(font: "DejaVu Sans", size: 6.5pt, fill: dark-muted, tracking: 0.05em)[
          MONTHLY CPI #dot SELECTED MONTHS
        ]
      ]

      #v(0.06in)
      #text(size: 8.6pt, fill: dark-muted)[
        Annual inflation closed 2023 at 211.4%#cite(6). By May 2025 the monthly
        rate was 1.5%, the lowest in five years#cite(1)#cite(5), and the
        staircase below is consistent with a fiscal anchor that changed
        expectations.
      ]

      #v(0.16in)

      #grid(
        columns: (1fr,) * 6,
        column-gutter: 0.06in,
      )[
        #inflbar(25.5, [25.5%], [DEC 2023])
      ][
        #inflbar(11.0, [11.0%], [MAR 2024])
      ][
        #inflbar(4.6, [4.6%], [JUN 2024])
      ][
        #inflbar(3.5, [3.5%], [SEP 2024])
      ][
        #inflbar(2.7, [2.7%], [DEC 2024])
      ][
        #inflbar(1.5, [1.5%], [MAY 2025], final: true)
      ]

      #v(0.06in)
      #line(length: 100%, stroke: 0.4pt + rgb("#5a554b"))
      #v(0.06in)
      #text(font: "DejaVu Sans", size: 6.2pt, fill: dark-muted)[
        Sources: INDEC CPI report, Dec. 2024#cite(2); Newsweek (7 Jul 2025); Reuters
        (12 Jun 2025); countryeconomy.com#cite(6). Selected months, not a
        continuous series.
      ]
    ]
  ],

  section(3, "Economic consequences", [
    Inflation eroded #t[real wages] and pensions, and it hit low-income
    households hardest because they hold money and cannot index. Uncertainty
    shortened investment horizons, so productivity growth stalled. Poverty
    reached 53% in December 2023#cite(1). The cost of inaction compounds: each
    year of monetized deficits raises the inflation tax and lowers
    #t[potential output].
  ]),

  section(4, "Proposed solution", [
    Milei's program is a supply-side stabilization. He cut primary spending to
    deliver a #t[fiscal surplus], ended central-bank financing of the treasury,
    devalued the peso and lifted the cepo, and repealed rent control. A \$20
    billion IMF program anchors reserves#cite(3). The mechanism is a credibility
    shift: a hard budget constraint lowers #t[expected inflation], and
    deregulation raises the #t[return to capital], so investment and supply
    recover.
  ]),

  // ---- exhibit B: full width ----
  grid.cell(colspan: 2)[
    #block(width: 100%, stroke: 0.8pt + ink, inset: (x: 0.34in, y: 0.22in))[
      #grid(
        columns: (1fr, auto),
        align: (left + bottom, right + bottom),
      )[
        #kicker("EXHIBIT B / GROWTH AND ITS COST")
        #v(0.05in)
        #par(leading: 0.95em)[
          #text(size: 19pt, weight: "bold", tracking: -0.01em)[
            The turn is real. The cost is too.
          ]
        ]
      ][
        #text(font: "DejaVu Sans", size: 6.5pt, fill: muted, tracking: 0.05em)[
          BEFORE #sym.arrow.r AFTER
        ]
      ]

      #v(0.06in)
      #text(size: 8.6pt, fill: rgb("#413d36"))[
        Output swung from a 1.7% contraction in 2024#cite(4) to 7.6% growth in
        Q2 2025#cite(1), and poverty fell from its 53% peak#cite(1). Neither
        number means the adjustment is finished.
      ]

      #v(0.20in)

      #grid(
        columns: (1fr, 1pt, 1fr, 1pt, 1fr),
        column-gutter: 0.26in,
        align: (left + top, center + top, left + top, center + top, left + top),
      )[
        #panel(
          "REAL GDP GROWTH",
          [#sym.minus 1.7%],
          [+7.6%],
          3,
          96,
          [2024 #sym.arrow.r Q2 2025, year over year],
        )
      ][
        #rect(width: 1pt, height: 1.35in, fill: rule)
      ][
        #panel(
          "POVERTY",
          [53%],
          [38%],
          88,
          63,
          [Dec. 2023 peak #sym.arrow.r 2025],
        )
      ][
        #rect(width: 1pt, height: 1.35in, fill: rule)
      ][
        #panel(
          "RENTAL LISTINGS, BUENOS AIRES",
          [5,500],
          [15,300],
          34,
          96,
          [Before repeal #sym.arrow.r after, +180%],
        )
      ]

      #v(0.16in)
      #line(length: 100%, stroke: 0.4pt + rule)
      #v(0.05in)
      #text(font: "DejaVu Sans", size: 6.2pt, fill: muted)[
        Sources: Newsweek (7 Jul 2025); IMF country report (Nov. 2025). Poverty
        is the national rate; rental listings are traditional listings on
        Zonaprop as reported in Newsweek.
      ]
    ]
  ],

  section(5, "Positive outcomes & trade-offs", [
    The gains are large. Monthly inflation fell from 25.5% to 1.5% by May
    2025#cite(1), GDP grew 7.6% year-over-year in Q2 2025#cite(1), poverty fell
    to 38%#cite(1), and rental listings in Buenos Aires rose from about 5,500 to
    over 15,300 after rent control ended#cite(1). The trade-offs are real. The
    adjustment caused a 1.7% contraction in 2024#cite(4), real wages and
    pensions fell, inequality rose, and the peso remains overvalued with
    negative #t[net reserves]#cite(1). The #t[opportunity cost] is short-run
    consumption and social spending traded for credibility and long-run growth.
  ]),

  block(width: 100%, fill: accent, inset: (x: 0.22in, y: 0.17in))[
    #set text(fill: paper)
    #kicker("SECTION 6 / EXECUTIVE PITCH", c: rgb("#c8ddd4"))
    #v(0.08in)
    #text(size: 9.4pt, weight: "bold", tracking: -0.005em)[
      Argentina's problem was a policy regime that monetized deficits and taxed
      production through inflation, not a lack of resources.
    ]
    #v(0.1em)
    #text(size: 9.4pt, weight: "bold", tracking: -0.005em)[
      Milei's fiscal and deregulatory shock cut monthly inflation from 25.5% to
      1.5% and returned the economy to 7.6% growth, and the rent-control repeal
      shows how quickly supply responds when price controls end.
    ]
    #v(0.1em)
    #text(size: 9.4pt, weight: "bold", tracking: -0.005em)[
      The gain in consumer welfare is real, but it is not secure until reserves,
      investment, and the social cost of adjustment are addressed.
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
  #text(font: "DejaVu Sans", size: 6.3pt, fill: muted)[MRU UNIT 2]
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
