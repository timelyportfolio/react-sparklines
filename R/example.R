library(reactR)
library(htmltools)

browsable(attachDependencies(
  tagList(
    tags$div(id="sparkline1", style="height:60px;width:150px"),
    tags$div(id="sparkline2", style="height:60px;width:150px"),
    tags$script(babel_transform(sprintf(
"
var Sparklines = ReactSparklines.Sparklines;
var SparklinesLine = ReactSparklines.SparklinesLine;

ReactDOM.render(
  <Sparklines data={[1,2,3,4,5]}>
    <SparklinesLine />
  </Sparklines>,
  document.getElementById('sparkline1')
);

ReactDOM.render(
  <Sparklines data={%s}>
    <SparklinesLine />
  </Sparklines>,
  document.getElementById('sparkline2')
);
"
    ,jsonlite::toJSON(runif(100)))))
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
