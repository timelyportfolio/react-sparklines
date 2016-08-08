# do the sparkline example
#  but try to leverage htmltools::tag
#  quickly discovered that the quotes will make this difficult
#  in the JSX
#  darn, this would have been a nicer, cleaner way

library(reactR)
library(htmltools)

browsable(attachDependencies(
  tagList(
    tags$div(id="sparkline1", style="height:60px;width:150px"),
    tags$div(id="sparkline2", style="height:60px;width:150px"),
    tags$script(
      babel_transform(
        sprintf(
"
var Sparklines = ReactSparklines.Sparklines;
var SparklinesLine = ReactSparklines.SparklinesLine;

ReactDOM.render(%s,document.getElementById('sparkline1'));

ReactDOM.render(%s,document.getElementById('sparkline2'));
",
          tag(
            "Sparklines",
            list(
              data="{[1,2,3,4,5]}",
              tag("SparklinesLine",list())
            )
          ),
          tag(
            "Sparklines",
            list(
              data=jsonlite::toJSON(runif(100)),
              tag("SparklinesLine",list())
            )
          )
        )
      )
    )
  ),
  list(
    html_dependency_react(),
    htmlDependency(
      name="react-sparklines",
      version="1.0",
      src=c(href="//cdn.rawgit.com/borisyankov/react-sparklines/master/build"),
      script="index.js"
    )
  )
))
