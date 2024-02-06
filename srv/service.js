const cds = require('@sap/cds');

module.exports = async (srv) => 
{        
    // Using CDS API      
    const NAUTINAUTICALCV_SRV = await cds.connect.to("NAUTINAUTICALCV_SRV"); 
      srv.on('READ', 'BidTypeSet', req => NAUTINAUTICALCV_SRV.run(req.query)); 
      srv.on('READ', 'CarTypeSet', req => NAUTINAUTICALCV_SRV.run(req.query)); 
      srv.on('READ', 'CargoUnitSet', req => NAUTINAUTICALCV_SRV.run(req.query)); 
      srv.on('READ', 'CurTypeSet', req => NAUTINAUTICALCV_SRV.run(req.query)); 
      srv.on('READ', 'GtPlanSet', req => NAUTINAUTICALCV_SRV.run(req.query)); 
      srv.on('READ', 'GtTabSet', req => NAUTINAUTICALCV_SRV.run(req.query)); 
      srv.on('READ', 'VoyTypeSet', req => NAUTINAUTICALCV_SRV.run(req.query)); 
      srv.on('READ', 'ZCalculateSet', req => NAUTINAUTICALCV_SRV.run(req.query)); 
      srv.on('READ', 'ZCreatePlanSet', req => NAUTINAUTICALCV_SRV.run(req.query)); 

      
      const NAUTIMARINE_TRAFFIC_API_SRV = await cds.connect.to("NAUTIMARINE_TRAFFIC_API_SRV"); 
      srv.on('READ', 'EsPathCollection', req => NAUTIMARINE_TRAFFIC_API_SRV.run(req.query)); 
      srv.on('READ', 'PortMasterSet', req => NAUTIMARINE_TRAFFIC_API_SRV.run(req.query)); 
      srv.on('READ', 'es_port_master', req => NAUTIMARINE_TRAFFIC_API_SRV.run(req.query)); 
      srv.on('READ', 'es_route_map', req => NAUTIMARINE_TRAFFIC_API_SRV.run(req.query)); 
}