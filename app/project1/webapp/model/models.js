sap.ui.define(
    ["sap/ui/model/json/JSONModel", "sap/ui/Device"],
    /**
     * provide app-view type models (as in the first "V" in MVVC)
     *
     * @param {typeof sap.ui.model.json.JSONModel} JSONModel
     * @param {typeof sap.ui.Device} Device
     *
     * @returns {Function} createDeviceModel() for providing runtime info for the device the UI5 app is running on
     */
    function (JSONModel, Device) {
      "use strict";
  
      return {
        createDeviceModel: function () {
          var oModel = new JSONModel(Device);
          oModel.setDefaultBindingMode("OneWay");
          return oModel;
        },
        // initVoyageTypeModel: function (oModel) {
        //   const oVoyageTypeModel = new JSONModel({
        //     sVoyageTypes: [],
        //   });

        //     let oVoyageTypeContext = oModel.bindList("/VoyTypeSet");
        //     oVoyageTypeContext.requestContexts().then(function(context)  {
        //       context.forEach(item=>{
        //         oVoyageTypeModel.getData().sVoyageTypes.push(item.getObject());
                
        //       })
        //     })
        //   return oVoyageTypeModel;
        // },

        
        initValueHelpModel: function (oModel, sEntitySet, sValueHelpName, sValueLabel,sValueText, skey, sDes) {
          let oValueHelpObject = {};
          oValueHelpObject[sValueHelpName] = [];
          const oValueHelpModel = new JSONModel(oValueHelpObject);
          let oValueHelpContext = oModel.bindList("/" + sEntitySet);

          // console.log(sEntitySet,sValueHelpName,sValueLabel, sValueText, skey, sDes);
          oValueHelpContext.requestContexts().then(function(context) {
            
            context.forEach(item => {
              // console.log(item.getObject()[skey],item.getObject()[sDes]);
              
              let entry = {};
              entry[sValueLabel] = item.getObject()[skey];
              entry[sValueText] = item.getObject()[sDes];
              // console.log(entry);
              oValueHelpModel.getData()[sValueHelpName].push( entry);
            });
            // console.log(oValueHelpModel.getData())
          });
          return oValueHelpModel;
        },
      
  
        // initCargoTypeModel: function (oModel) {
        //   const oCargoTypeModel = new JSONModel({
        //     sCargoTypes: [],
        //   });
        //   oModel.read("/CarTypeSet", {
        //     success: function (oCargoTypeData) {
        //       oCargoTypeData.results.forEach((element) => {
        //         oCargoTypeModel.getData().sCargoTypes.push({
        //           sCargoType: element.Carcd,
        //           sCargoTypeText: element.Cardes,
        //         });
        //       });
        //     },
        //     error: function (oResponse) {
        //       // TODO - Error Handling
        //     },
        //   });
        //   return oCargoTypeModel;
        // },
  
        // initCurrencyTypeModel: function (oModel) {
        //   const oCurrencyTypeModel = new JSONModel({
        //     sCurrencyTypes: [],
        //   });
        //   oModel.read("/CurTypeSet", {
        //     success: function (oCurrencyTypeData) {
        //       // console.log(oCurrencyTypeData);
        //       oCurrencyTypeData.results.forEach((element) => {
        //         oCurrencyTypeModel.getData().sCurrencyTypes.push({
        //           sCurrencyType: element.Navoycur,
        //           sCurrencyTypeText: element.Navoygcurdes,
        //         });
        //       });
        //     },
        //     error: function (oResponse) {
        //       // TODO - Error Handling
        //     },
        //   });
        //   return oCurrencyTypeModel;
        // },
  
        // initBidTypeModel: function (oModel) {
        //   const oBidTypeModel = new JSONModel({
        //     sBidTypes: [],
        //   });
        //   oModel.read("/BidTypeSet", {
        //     success: function (oBidTypeData) {
        //       oBidTypeData.results.forEach((element) => {
        //         oBidTypeModel.getData().sBidTypes.push({
        //           sBidType: element.DomvalueL,
        //           sBidTypeText: element.Ddtext,
        //         });
        //       });
        //     },
        //     error: function (oResponse) {
        //       // TODO - Error Handling
        //     },
        //   });
        //   return oBidTypeModel;
        // },
        // initCargoUnitModel: function (oModel) {
        //   const oCargoUnitModel = new JSONModel({
        //     sCargoUnits: [],
        //   });
        //   oModel.read("/CargoUnitSet", {
        //     success: function (oCargoUnitData) {
        //       oCargoUnitData.results.forEach((element) => {
        //         oCargoUnitModel.getData().sCargoUnits.push({
        //           sCargoUnit: element.Uom,
        //           sCargoUnitText: element.Uomdes,
        //         });
        //       });
        //     },
        //     error: function (oResponse) {
        //       // TODO - Error Handling
        //     },
        //   });
        //   return oCargoUnitModel;
        // },
      };
    }
  );
  