sap.ui.define(
  ["jquery.sap.global"],
  function (jQuery) {
    "use strict";

    var MarineMapRenderer = {
      apiVersion: 2,
    };

    MarineMapRenderer.render = function (oRm, oControl) {
      // oRm is the Ui5 Render Manager
      oRm.openStart("iframe");
      oRm.class("container");

      oRm.attr("name", "marinetraffic");
      oRm.attr("id", "marinetraffic");
      oRm.attr("scrolling", "no");
      oRm.attr(
        "src",
        "https://www.marinetraffic.com/en/ais/embed/zoom:4/centery:23/centerx:85/maptype:0/shownames:false/mmsi:0/shipid:0/fleet:/fleet_id:/vtypes:/showmenu:true/remember:false"
      );
      oRm.attr("width", "auto");
      oRm.attr("height", "auto");
      // oRm.attr("frameborder", "1");
      oRm.openEnd("iframe");
      oRm.close("iframe");
      // oRm.openStart("div");
      // oRm.class("map-container");
      // oRm.openEnd("div");
      // oRm.openStart("div");
      // oRm.class("map-frame");
      // oRm.openEnd("div");
      // oRm.openStart("div");
      // // // oRm.write('id="map"'); // set it hardcoded
      // oRm.attr('id', 'map');
      // oRm.openEnd("div");
      // // oRm.style("height", oControl.getHeight());
      // // oRm.style("width", oControl.getWidth());
      // oRm.close("div");
      // oRm.close("div");
      // oRm.close("div");
      // oRm.close("div");
      // oRm.write('<div class="container"><div class="map-container"><div class="map-frame"><div id="map"></div></div></div></div>');
      //oRm.write('<iframe name="marinetraffic" id="marinetraffic" scrolling="no" src="https://www.marinetraffic.com/en/ais/embed/zoom:9/centery:37.446/centerx:24.9467/maptype:1/shownames:false/mmsi:0/shipid:0/fleet:/fleet_id:/vtypes:/showmenu:true/remember:false" width="100%" height="450" frameborder="1">Browser does not support embedded objects.<br/>Visit directly <a href="http://www.marinetraffic.com/">www.marinetraffic.com</a></iframe>');
    };

    return MarineMapRenderer;
  },
  true
);
