funciton init()

var trace1 = {
  labels: ["Hillary Clinton", "Donald Trump"],
  values: [`${dem_votes}`,`${rep_votes}`],
  type: 'pie'
};

var data = [trace1];

var layout = {
  title: `2016 Votes: ${county_state} `,
};

Plotly.newPlot("plot1", data, layout);

var trace2 = {
    labels: ["Joe Biden", "Donald Trump"],
    values: [`${dem_votes}`,`${rep_votes}`],
    type: 'pie'
  };
  
  var data = [trace2];
  
  var layout = {
    title: `2020 Votes: ${county_state}`,
  };
  
  Plotly.newPlot("plot2", data, layout);
