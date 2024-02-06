sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("project1.controller.View1", {
            onInit: function () {

            },
            onSelect: function (oEvent) {
                let selctedItem = oEvent.getSource().getSelectedItem();
                console.log(selctedItem);
                let oContext = selctedItem.getBindingContext();
                oContext.delete().catch(function (oError) {
                    if (!oError.canceled) {
                      // Error was already reported to message model
                    }
                  });
    }
});
    })
