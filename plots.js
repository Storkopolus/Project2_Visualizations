//set colors for use in pie charts
var colors = ['rgb(165,0,38)', 'rgb(49,54,149)']
//Add 2016 candidates and total votes
var trace1 = {
  labels: ["Hillary Clinton", "Donald Trump"],
  values: [65844241,62979031],
  type: 'pie'
};
//put trace info into a variable
var data1 = [trace1];
//set layout for first pie chart
var layout1 = {
  title: `2016 Votes `,
  marker: {
    color: colors
  }
};
//add new pie chart to plot1 div tag
Plotly.newPlot("plot1", data1, layout);
//add 2020 candidates and total votes
var trace2 = {
    labels: ["Joe Biden", "Donald Trump"],
    values: [79531835,73532410],
    type: 'pie'
  };
  //put trace info into a variable
  var data2 = [trace2];
  //set layout for second pie chart
  var layout2 = {
    title: `2020 Votes`,
    marker: {
      color: colors
    }
  };
//add new pie chart to plot2 div tag
Plotly.newPlot("plot2", data2, layout);
