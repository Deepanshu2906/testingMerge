sap.ui.define(["jquery.sap.global", "sap/ui/core/library"], function (jQuery) {
  "use strict";
  sap.ui.getCore().initLibrary({
    name: "custom.map",
    version: "1.0.0",
    dependencies: ["sap.ui.core"],
    types: [],
    interfaces: [],
    controls: ["project1.custom.map.LeafletMap"],
    elements: [],
  });
  return custom.map;
});
