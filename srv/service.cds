// using {db} from '../db/schema';
using NAUTIMARINE_TRAFFIC_API_SRV from './external/NAUTIMARINE_TRAFFIC_API_SRV.cds';
using NAUTINAUTICALCV_SRV from './external/NAUTINAUTICALCV_SRV';

using {NAUTI_MAS} from '../app/voyage_master_data';

service NAUTICALCV_SRV {

    entity VOYTYP as projection on NAUTI_MAS.VOYTYP;
    entity BidTYP as projection on NAUTI_MAS.BIDMASTER;
    entity CARTYP as projection on NAUTI_MAS.CARTYP;
    entity CURR as projection on NAUTI_MAS.CURR;
    entity MAS as projection on NAUTI_MAS.BIDMASTER;
    entity NAVOYGUOM as projection on NAUTI_MAS.NAVOYGUOM;
    entity NAVOYGC as projection on NAUTI_MAS.NAVOYGC;
    entity EVENT_MAS as projection on NAUTI_MAS.EVENT_MAS;
    entity REF_DOC_S as projection on NAUTI_MAS.REF_DOC_S;
   
    entity BidTypeSet as projection on NAUTINAUTICALCV_SRV.BidTypeSet
       
    entity CarTypeSet as projection on NAUTINAUTICALCV_SRV.CarTypeSet
   
    
    entity CargoUnitSet as projection on NAUTINAUTICALCV_SRV.CargoUnitSet
   
    
    entity CurTypeSet as projection on NAUTINAUTICALCV_SRV.CurTypeSet
    
    
    entity GtPlanSet as projection on NAUTINAUTICALCV_SRV.GtPlanSet
   
    
    entity GtTabSet as projection on NAUTINAUTICALCV_SRV.GtTabSet
   
    
    entity VoyTypeSet as projection on NAUTINAUTICALCV_SRV.VoyTypeSet
    
    
    entity ZCalculateSet as projection on NAUTINAUTICALCV_SRV.ZCalculateSet
    
       
    entity EsPathCollection as projection on NAUTIMARINE_TRAFFIC_API_SRV.EsPathCollection;
    
    entity PortMasterSet as projection on NAUTIMARINE_TRAFFIC_API_SRV.PortMasterSet
   
    
    entity es_port_master as projection on NAUTIMARINE_TRAFFIC_API_SRV.es_port_master
   
    
    entity es_route_map as projection on NAUTIMARINE_TRAFFIC_API_SRV.es_route_map
  
    

}