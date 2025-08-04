using {sap.freightorder.db as db} from '../db/schema';

service freightorder {
    entity SrvFreightOrder     as projection on db.DBFreightOrder
        actions {
            function suggestBestRoute(in : $self) returns String;
        };

    entity SrvFreightOrderItem as projection on db.DBFreightOrderItem
        actions {
            function suggestBestRoute(in : $self) returns String;
        };


}

// annotate freightorder.SrvFreightOrder with @(requires: 'admin');
annotate freightorder.SrvFreightOrder with @odata.draft.enabled;
