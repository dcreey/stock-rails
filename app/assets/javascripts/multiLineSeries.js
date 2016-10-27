/**
 * Created by dcreey on 10/25/2016.
 */
window.multiLineSeries = {};
$(function(){
    function multiLineSeries(svgSelector, yAxisTitle, xAxisTitle){
        const svg = d3.select('svg'),
            margin = {top: 150, right: 30, bottom: 50, left: 50},
            width = parseInt(svg.style('width')) - margin.left - margin.right,
            height = parseInt(svg.style('height')) - margin.top - margin.bottom;

        var parseTime = d3.timeParse("%Y%m%d");

        var x = d3.scaleTime().range([0, width]),
            y = d3.scaleLinear().range([height, 0]),
            z = d3.scaleOrdinal(d3.schemeCategory10);

        var line = d3.line()
            .curve(d3.curveBasis)
            .x(function(d) { return x(d.date); })
            .y(function(d) { return y(d.yValue); });

        function create(data, title) {
            x.domain(d3.extent(data[0].values, function (d) {
                return d.date;
            }));

            y.domain([
                d3.min(data, function (c) {
                    return d3.min(c.values, function (d) {
                        return d.yValue;
                    });
                }),
                d3.max(data, function (c) {
                    return d3.max(c.values, function (d) {
                        return d.yValue;
                    });
                })
            ]);

            z.domain(data.map(function (c) {
                return c.id;
            }));

            const g = svg.append("g")
                .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

            g.append("g")
                .attr("class", "axis axis--x")
                .attr("transform", "translate(0," + height + ")")
                .call(d3.axisBottom(x).ticks(5))
                .append("text")
                .attr("transform", "translate(" + width / 2 + ",35)")
                .attr("y", 6)
                .attr("dy", "0.71em")
                .attr("fill", "#000")
                .text(xAxisTitle);

            g.append("g")
                .attr("class", "axis axis--y")
                .call(d3.axisLeft(y))
                .append("text")
                .attr("transform", "rotate(-90) translate(0,-50)")
                .attr("y", 6)
                .attr("dy", "0.71em")
                .attr("fill", "#000")
                .text(yAxisTitle);

            g.append("text")
                .attr("x", (width / 2))
                .attr("y", 0 - (margin.top / 2))
                .attr("class", "title")
                .text(title);

            var metric = g.selectAll(".metric")
                .data(data)
                .enter().append("g")
                .attr("class", "metric");

            metric.append("path")
                .attr("class", "line")
                .attr("d", function (d) {
                    return line(d.values);
                })
                .style("stroke", function (d) {
                    return z(d.id);
                });

            buildLegend(data, z);
        }

        function destroy(){
            svg.html('');
        }

        function buildLegend(data, color) {
            var legend = svg.append("g")
                .attr("class", "legend")
                .attr("height", 100)
                .attr("width", 100)
                .attr('transform', 'translate(-20,50)')

            legend.selectAll('rect')
                .data(data)
                .enter()
                .append("rect")
                .attr("x", width + 75)
                .attr("y", function(d, i){ return i *  20;})
                .attr("width", 10)
                .attr("height", 10)
                .style("fill", function(d) {return color(d.id);})
                .attr("data-name", function(d) { d.id; });

            legend.selectAll('text')
                .data(data)
                .enter()
                .append("text")
                .attr("x", width + 45)
                .attr("y", function(d, i){ return i *  20 + 9.4;})
                .text(function(d) {
                    var text = d.id.charAt(0).toUpperCase() + d.id.slice(1);
                    return text;
                });
        }

        return {
            create: create,
            destroy: destroy,
        }
    }
    window.multiLineSeries = multiLineSeries;
});
