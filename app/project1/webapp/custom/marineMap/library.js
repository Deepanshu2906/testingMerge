sap.ui.define(["jquery.sap.global", "sap/ui/core/library"], function (jQuery) {
  "use strict";
  sap.ui.getCore().initLibrary({
    name: "custom.marineMap",
    version: "1.0.0",
    dependencies: ["sap.ui.core"],
    types: [],
    interfaces: [],
    controls: ["project1.custom.marineMap.MarineMap"],
    elements: [],
  });
  return custom.marineMap;
});
