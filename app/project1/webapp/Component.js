/**
 * eslint-disable @sap/ui5-jsdocs/no-jsdoc
 */

sap.ui.define([
        "sap/ui/core/UIComponent",
        "sap/ui/Device",
        "project1/model/models"
    ],
    function (UIComponent, Device, models) {
        "use strict";

        return UIComponent.extend("project1.Component", {
            metadata: {
                manifest: "json"
            },

            /**
             * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
             * @public
             * @override
             */
            init: function () {
                let that = this;
                // call the base component's init function
                UIComponent.prototype.init.apply(this, arguments);
                

                // enable routing
                this.getRouter().initialize();

                // set the device model
                this.setModel(models.createDeviceModel(), "device");

                let oModel = this.getModel();
                // console.log("myModel default : ", oModel);
                
                // let x = new sap.ui.model.json.JSONModel({});
                // x.loadData("/odata/v4/nauticalcv-srv").then(function(){console.log(x)
                //     oModel = x.value;
                //     console.log("myModel default after : ", oModel);
                //     ;})

                let VHParams = [
                    {
                        sEntitySet: "VOYTYP",
                        sValueHelpName: "sVoyageTypes",
                        sModelAlias: "voyagetypes",
                        label: "sVoyageType",
                        description:"sVoyageTypeText",
                        skey:"VOYCD",
                        sDes:"VOYDES",

                    },
                    {
                        sEntitySet: "CarTypeSet",
                        sValueHelpName: "sCargoTypes",
                        sModelAlias: "cargotypes",
                        label:"sCargoType",
                        description:"sCargoTypeText",
                        skey:"Carcd",
                        sDes:"Cardes",
                    },
                    {
                        sEntitySet: "CurTypeSet",
                        sValueHelpName: "sCurrencyTypes",
                        sModelAlias: "currencytypes",
                        label:"sCurrencyType",
                        description:"sCurrencyTypeText",
                        skey:"Navoycur",
                        sDes:"Navoygcurdes",
                    },
                    {
                        sEntitySet: "BidTypeSet",
                        sValueHelpName: "sBidTypes",
                        sModelAlias: "bidtypes",
                        label: "sBidType",
                        description:"sBidTypeText",
                        skey:"DomvalueL",
                        sDes:"Ddtext",
                    },
                    {
                        sEntitySet: "CargoUnitSet",
                        sValueHelpName: "sCargoUnits",
                        sModelAlias: "cargounit",
                        label:"sCargoUnit",
                        description:"sCargoUnitText",
                        skey:"Uom",
                        sDes:"Uomdes",
                    }
                ]

                VHParams.forEach(e => {
                    that.setModel(models.initValueHelpModel(oModel, e.sEntitySet, e.sValueHelpName, e.label,e.description, e.skey, e.sDes), e.sModelAlias);
                })

                // //Set up voyagetypes
                // this.setModel(models.initVoyageTypeModel(oModel), "voyagetypes");
        
                // //Set up cargotypes
                // this.setModel(models.initCargoTypeModel(oModel), "cargotypes");
        
                //Set up currencytypes
                // this.setModel(models.initCurrencyTypeModel(oModel), "currencytypes");
        
                //Set up Bidtypes
                // this.setModel(models.initBidTypeModel(oModel), "bidtypes");
        
                //Set up CargoUnits
                // this.setModel(models.initCargoUnitModel(oModel), "cargounit");
              },
            
        });
    }
);