var trace1 = {
  labels: ["Hillary Clinton", "Donald Trump"],
  values: [65844241,62979031],
  type: 'pie'
};

var data = [trace1];

var layout1 = {
  title: `2016 Votes `,
};

Plotly.newPlot("plot1", data, layout);

var trace2 = {
    labels: ["Joe Biden", "Donald Trump"],
    values: [79531835,73532410],
    type: 'pie'
  };
  
  var data = [trace2];
  
  var layout2 = {
    title: `2020 Votes: ${county_state}`,
  };
  
  Plotly.newPlot("plot2", data, layout);
