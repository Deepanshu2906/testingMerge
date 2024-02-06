/* checksum : 18624bbeb713553e9eb257f67589d572 */
using { Country, Currency, managed, cuid, temporal, sap.common.CodeList as CodeList} from '@sap/cds/common';
namespace db;


// Voyage header date  Table

entity NAVOYGH {

        VOYNO      : Integer64  ; // Voyage Number
        VOYNM      : String(40); // Voyage Name
        VNOMTK     : String(20); // Nomination Number
        REFDOC     : String(10); //   Document Ref
        DOCIND     : Int16; // Ref Doc. ind  --> /Ingenx/REF_DOC
        VESSN      : String(20); // Vessel Name
        VIMO       : String(20); // Vessel IMO Number --> TWS Vehicle Master
        CHTYP      : String(5); // Charter Type
        CHPNO      : String(10); // Freight Contract -> SAP Freight Contract
        CURRKEYS   : String(5); // Currency Key
        FRTCO      : Decimal; //   Freight Cost for the Voyage
        VSTAT      : String(20); // Voyage Status
        VOYTY      : String(4); // Voyage Type   -> VOYTYP
        CARTY      : String(4); // Vessel Type -> CARTYP
        CURR       : String(3); // Currency  --> NAVOYGUR
        FREGHT     : Decimal; // 11   Historical Freight Cost
        PARTY      : String(10); // CHarter Party Agreement
        BIDTYPE    : String(2); // Bid type --> BIDTYPE
        FRCOST     : Decimal; // Plan Freight cost
        FRTU       : String(10); // Freight Unit
        FRCOST_ACT : Decimal; // Actual Freight cost
        ZDELETE    : String(1); //  Genral flag
        REF_VOYNO  : String(20); //  REF VOYAGE No.

}


// Voyage Item level data 
entity NAVOYGIP  {

      key  VOYNO : Association to one NAVOYGH;   //>  NAVOYGH-VOYNM
        
      key  VLEGN  : Int64; // Numeric( 10)
        PORTC  : String(10); // Internation Unified Port code - unique
        PORTN  : String(10); // commnon used port name
        LOCNAM : String(10); // ref for Oil TSW   --> OIJNOMI-LOCNAM
        PDIST  : Decimal; // distnce betwenn two port from API
        VSPEED : Decimal; // (The speed of the vessel from Vessel Master/Manual Input)
        PPDAYS : Decimal; // Port days (Proposed from Historic Data/or Manual Input)
        VSDAYS : Decimal; // Sea Dys( Proposed from Historic Data/or Manual Input)
        VETAD  : Date; // ETA
        VETAT  : Time; // Time+A14:L25
        VETDD  : Date; // Manual entry (ETD)
        VETDT  : Time; //   Time ( manual)
        VWEAD  : Decimal; // Weather Delay Sea
        PSTAT  : String(5); // Status (In Planning, Vetting in Progress, Vetting Completed, Voyage Commenced)
        MATNR  : String(40); // Material Number
        MAKTX  : String(40); // Material Description
        CARGS  : Decimal(12); // Cargo Size
        CARGU  : String(10); // unit of measure ment
        OTHCO  : Decimal; //  additional charge for voyage
        FRCOST : Decimal; // total freight cost
        TOTCO  : Decimal; // totDecimal
        combinedKey : String;
        

}
//Bid details for voyage
entity ITEM_BID  {

         VOYNO     : Association to NAVOYGH {VOYNO}; // unique voyage no.
     key   ZCODE     : String(10); // This field is a text field allowing users to enter Data.
        VALUE     : String(50); // head data of biding details
        CVALUE    : Currency; //  Revaluation amount on back-posting to a previous period
        CUNIT     : String(5); // currency key unit   --> NAVOYGCUR
        CODE_DESC : String(50); // code description
        REV_BID   : String(1); // relevant for Biding
        GOOD      : String(1); // Good to have
        MAND      : String(1); // Active/ Inactive
        MUST      : String(1); // Must Not have
        ZMIN      : Decimal(3); // minimum score
        ZMAX      : Decimal(3); // MAximum Score

}

// Cost code Item details saved in  Table NAVOYGCIT
entity NAVOYGCIT  {
        VOYNO      : Association to NAVOYGH {VOYNO}; // unique voyage no.
       key VLEGN      : Int64; // NUMERIC(10)   Unique leg Number
        COSTCODE   : String(4); //Unique cost code --> NAVOTGC
        COSTU      : String(10);
        PRCUNIT    : String(3); //
        PROCOST    : Currency; // projection Cost
        COSTCURR   : String(5); //CUKY
        CSTCODES   : String(35); // Cost code description  --> NAVOTGC
        COST_CHECK : String(1); // Relevant for biding
}

// @cds.external : true
// @m.IsDefaultEntityContainer : 'true'
// @sap.supported.formats : 'atom json xlsx'
// service NAUTIMARINE_TRAFFIC_API_SRV {};

// @cds.external : true
// @cds.persistence.skip : true
// @sap.content.version : '1'
// entity NAUTIMARINE_TRAFFIC_API_SRV.EsPathCollection {
//   @sap.unicode : 'false'
//   @sap.label : 'Latitude'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Latitude : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Path ID'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   PathId : String(2) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Longitude'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Longitude : String(10) not null;
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.addressable : 'false'
// @sap.content.version : '1'
// entity NAUTIMARINE_TRAFFIC_API_SRV.es_route_map {
//   @sap.unicode : 'false'
//   @sap.label : 'From Port ID'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key IvFromPort : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'To Port ID'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key IvToPort : String(10) not null;
//   marineApiRoute : NAUTIMARINE_TRAFFIC_API_SRV.marineApiRoute not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Optimized Route'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   IvOptimized : String(1) not null;
//   @cds.ambiguous : 'missing on condition?'
//   route : Association to many NAUTIMARINE_TRAFFIC_API_SRV.EsPathCollection {  };
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTIMARINE_TRAFFIC_API_SRV.PortMasterSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Port Name'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Portn : String(25) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Location ID'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Locid : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Country'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Country : String(3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Port Code'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Portc : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Related Anchorage'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Reancho : String(30) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Latitude'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Latitude : String(15) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Longitude'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Longitude : String(15) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Country Name'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Countryn : String(25) not null;
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.addressable : 'false'
// @sap.content.version : '1'
// entity NAUTIMARINE_TRAFFIC_API_SRV.es_port_master {
//   @sap.unicode : 'false'
//   @sap.label : 'Port Code'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Portc : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Country'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Country : String(3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Port Name'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Portn : String(25) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Related Anchorage'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Reancho : String(30) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Latitude'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Latitude : String(15) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Longitude'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Longitude : String(15) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Country Name'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Countryn : String(25) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Location ID'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Locid : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Process ind'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Ind : String(1) not null;
// };

// @cds.external : true
// type NAUTIMARINE_TRAFFIC_API_SRV.marineApiRoute {
//   @sap.label : 'Distance'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   EvDistance : String(10) not null;
// };

// /* checksum : 18624bbeb713553e9eb257f67589d572 */
// @cds.external : true
// @m.IsDefaultEntityContainer : 'true'
// @sap.supported.formats : 'atom json xlsx'
// service NAUTINAUTICALCV_SRV {};

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTINAUTICALCV_SRV.BidTypeSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Lower Value'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key DomvalueL : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Short Descript.'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Ddtext : String(60) not null;
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTINAUTICALCV_SRV.CargoUnitSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Unit of measure'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Uom : String(3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Uom Discription'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Uomdes : String(30) not null;
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTINAUTICALCV_SRV.CarTypeSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Vessel Type'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Carcd : String(4) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Cargo type descripti'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Cardes : String(40) not null;
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTINAUTICALCV_SRV.CurTypeSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Currency'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Navoycur : String(3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Currency Description'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Navoygcurdes : String(30) not null;
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTINAUTICALCV_SRV.VoyTypeSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Voyage Code'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Voycd : String(4) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Voyage Code Descript'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Voydes : String(40) not null;
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTINAUTICALCV_SRV.GtTabSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Port Code'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Portc : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Voyage No'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Voyno : String(20) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'LegID'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vlegn : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Port Name'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Portn : String(25) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Oil TSW'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Locnam : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Distance'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Pdist : Decimal(13, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'UoM-Distance'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   @sap.semantics : 'unit-of-measure'
//   Medst : String(3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Speed'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vspeed : Decimal(17, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Port Days'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Ppdays : Decimal(6, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Sea Days'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vsdays : Decimal(7, 3) not null;
//   @odata.Type : 'Edm.DateTime'
//   @odata.Precision : 7
//   @sap.unicode : 'false'
//   @sap.label : 'ETA'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vetad : Timestamp not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Time'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vetat : Time not null;
//   @odata.Type : 'Edm.DateTime'
//   @odata.Precision : 7
//   @sap.unicode : 'false'
//   @sap.label : 'ETD'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vetdd : Timestamp not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Time'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vetdt : Time not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Weather Delay .Sea'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vwead : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Status'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Pstat : String(5) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Material'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Matnr : String(40) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Description'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Maktx : String(40) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Cargo size'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Cargs : Decimal(12, 0) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Base Unit'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   @sap.semantics : 'unit-of-measure'
//   Cargu : String(3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Total Cost'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Frcost : Decimal(24, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Total Cost'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Othco : Decimal(24, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Total Cost'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Totco : Decimal(24, 3) not null;
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTINAUTICALCV_SRV.ZCalculateSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Net Value'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key GvSpeed : Decimal(16, 3) not null;
//   @cds.ambiguous : 'missing on condition?'
//   ZCalcNav : Association to many NAUTINAUTICALCV_SRV.GtTabSet {  };
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTINAUTICALCV_SRV.GtPlanSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Voyage No'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Voyno : String(20) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'LegID'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vlegn : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Port Code'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Portc : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Port Name'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Portn : String(25) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Oil TSW'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Locnam : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Distance'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Pdist : Decimal(13, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'UoM-Distance'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   @sap.semantics : 'unit-of-measure'
//   Medst : String(3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Speed'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vspeed : Decimal(17, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Port Days'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Ppdays : Decimal(6, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Sea Days'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vsdays : Decimal(7, 3) not null;
//   @odata.Type : 'Edm.DateTime'
//   @odata.Precision : 7
//   @sap.unicode : 'false'
//   @sap.label : 'ETA'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vetad : Timestamp not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Time'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vetat : Time not null;
//   @odata.Type : 'Edm.DateTime'
//   @odata.Precision : 7
//   @sap.unicode : 'false'
//   @sap.label : 'ETD'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vetdd : Timestamp not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Time'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vetdt : Time not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Weather Delay .Sea'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Vwead : String(10) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Status'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Pstat : String(5) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Material'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Matnr : String(40) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Description'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Maktx : String(40) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Cargo size'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Cargs : Decimal(12, 0) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Base Unit'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   @sap.semantics : 'unit-of-measure'
//   Cargu : String(3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Total Cost'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Frcost : Decimal(24, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Total Cost'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Othco : Decimal(24, 3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Total Cost'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Totco : Decimal(24, 3) not null;
// };

// @cds.external : true
// @cds.persistence.skip : true
// @sap.creatable : 'false'
// @sap.updatable : 'false'
// @sap.deletable : 'false'
// @sap.pageable : 'false'
// @sap.content.version : '1'
// entity NAUTINAUTICALCV_SRV.ZCreatePlanSet {
//   @sap.unicode : 'false'
//   @sap.label : 'Voyage No'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   key Voyno : String(20) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Voyage name'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Voynm : String(40) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Voyage Type'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Voyty : String(4) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Vessel Type'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Carty : String(4) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Currency'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Curr : String(3) not null;
//   @sap.unicode : 'false'
//   @sap.label : 'Bid Type'
//   @sap.creatable : 'false'
//   @sap.updatable : 'false'
//   @sap.sortable : 'false'
//   @sap.filterable : 'false'
//   Bidtype : String(2) not null;
//   @cds.ambiguous : 'missing on condition?'
//   ZCreatePlanNav : Association to many NAUTINAUTICALCV_SRV.GtPlanSet on ZCreatePlanNav.Voyno = Voyno;
// };



