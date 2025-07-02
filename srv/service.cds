using { sap.freightorder.db as db } from '../db/schema';

service freightorder {
    entity SrvFreightOrder  as projection on db.DBFreightOrder ;
    entity SrvFreightOrderItem as projection on db.DBFreightOrderItem;
}



//annotate freightorder.SrvFreightOrder with @(requires: 'admin');

annotate freightorder.SrvFreightOrder with  @odata.draft.enabled;
