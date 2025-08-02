# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

| File or Folder | Purpose                              |
| -------------- | ------------------------------------ |
| `app/`         | content for UI frontends goes here   |
| `db/`          | your domain models and data go here  |
| `srv/`         | your service models and code go here |
| `package.json` | project metadata and configuration   |
| `readme.md`    | this getting started guide           |

## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).

## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

- 1. cds init freightorderattach
- 2. create `schema.cds` under folder `db` with the following code .

```cds
 namespace sap.freightorder.db;

entity DBFreightOrder {
  key TransportationOrderUUID : String(36) ;
  TransportationOrder : String(20) ;
  TransportationOrderType : String(4) ;
  TransportationOrderCategory : String(2) ;
  TransportationShippingType : String(3) ;
  TransportationMode : String(2) ;
  TransportationModeCategory : String(1) ;
  CarrierUUID : String(36);
  Carrier : String(10) ;
  StandardCarrierAlphaCode : String(4) ;
  TranspOrdExecutingCarrierUUID : String(36);
  TranspOrdExecutingCarrier : String(10) ;
  ShipperUUID : String(36);
  Shipper : String(10) ;
  ShipperAddressID : String(40) ;
  ConsigneeUUID : String(36);
  Consignee : String(10) ;
  ConsigneeAddressID : String(40) ;
  TranspPurgOrg : String(8) ;
  TranspPurgOrgExtID : String(20) ;
  TranspPurgGroup : String(8) ;
  TranspPurgGroupExtID : String(20) ;
  PurgOrgCompanyCode : String(4) ;
  CarrierAccountNumber : String(14) ;
  TranspMeansOfTransport : String(10) ;
  TranspOrdPartnerReference : String(35) ;
  TranspOrdResponsiblePerson : String(12) ;
  TranspOrdHasMltplExectgPties : Boolean ;
  TranspOrdInvoicingCarrierLevel : String(2) ;
  TranspOrdLifeCycleStatus : String(2) ;
  TranspOrderSubcontrgSts : String(2) ;
  TransportationOrderConfSts : String(2) ;
  TransportationOrderExecSts : String(2) ;
  TranspOrdGoodsMovementStatus : String(1) ;
  TranspOrdWhseProcessingStatus : String(1) ;
  TranspOrderDngrsGdsSts : String(1) ;
  TranspOrdExecutionIsBlocked : Boolean ;
  TransportationOrderCrtnType : String(2) ;
  CreatedByUser : String(12) ;
  FreightOrderItems: Composition of many  DBFreightOrderItem on FreightOrderItems.TransportationOrderUUID = $self.TransportationOrderUUID;

}


entity DBFreightOrderItem  {


  key TransportationOrderItemUUID : String(36) ;
  TransportationOrderUUID : String(36) ;
  TranspOrdItem : String(10) ;
  TranspOrdItemType : String(4) ;
  TranspOrdItemCategory : String(3) ;
  TranspOrdItemParentItemUUID : String(36) ;
  TranspOrdItemDesc : String(40) ;
  IsMainCargoItem : Boolean ;
  TranspOrdItemSorting : String(6) ;

  SourceStopUUID : String(36);
  DestinationStopUUID : String(36);
  ShipperUUID : String(36);
  Shipper : String(10) ;
  ShipperAddressID : String(40) ;
  ConsigneeUUID : String(36);
  Consignee : String(10) ;
  ConsigneeAddressID : String(40) ;


  FreightUnitUUID : String(36);
  PredecessorTransportationOrder : String(36);
  TranspBaseDocument : String(35) ;
  TranspBaseDocumentType : String(5) ;
  TranspBaseDocumentItem : String(10) ;
  TranspBaseDocumentItemType : String(5) ;
  TransportationEquipmentGroup : String(3) ;
  TransportationEquipmentType : String(10) ;
  TranspEquipmentIsShipperOwned : Boolean ;
  TranspEquipmentPlateNumber : String(20) ;
  TranspEquipRegistrationCountry : String(3) ;
  TranspEquipCapacityLength : Decimal(13, 3) ;
  TranspEquipCapacityWidth : Decimal(13, 3) ;
  TranspEquipCapacityHeight : Decimal(13, 3) ;
  TranspEquipCapacityUnit : String(3) ;
  TranspEquipCapacityWeight : Decimal(31, 14) ;
  TranspEquipCapacityWeightUnit : String(3) ;
  TranspEquipCapacityVolume : Decimal(31, 14) ;
  TranspEquipCapacityVolumeUnit : String(3) ;
  TranspOrdItemPackageID : String(35) ;
  ProductUUID : String(36);
  ProductID : String(18) ;
  MaterialFreightGroup : String(8) ;
  TransportationGroup : String(4) ;
  TranspOrdItmMinTemp : Decimal(7, 2) ;
  TranspOrdItmMaxTemp : Decimal(7, 2) ;
  TranspOrdItemTemperatureUnit : String(3) ;
  TranspOrdItemQuantity : Decimal(31, 14) ;
  TranspOrdItemQuantityUnit : String(3) ;
  TranspOrdItemGrossWeight : Decimal(31, 14) ;
  TranspOrdItemGrossWeightUnit : String(3) ;
  TranspOrdItemGrossVolume : Decimal(31, 14) ;
  TranspOrdItemGrossVolumeUnit : String(3) ;
  TranspOrdItemNetWeight : Decimal(31, 14) ;
  TranspOrdItemNetWeightUnit : String(3) ;
}
```

- 3. run command in path `freightorderattach`

```
npm add @cap-js/sdm
```

- 4. create file `attachments.cds` under folder `db` .

```
using { sap.freightorder.db as my  } from './schema';
using { Attachments } from '@cap-js/sdm';

extend my.DBFreightOrderItem with { attachments: Composition of many Attachments };
```

- 5. Create folder `external` under folder `srv`
- 6. Download freight order API EDMX file from [Freight Order (A2X)](https://api.sap.com/api/CE_FREIGHTORDER_0001/overview) .
- 7. Move the EDMX file under project folder `external`.
- 8. Run the following command to import the path `freightorderattach`

```
cds import srv/external/CE_FREIGHTORDER_0001.edmx as cds
```

- 9. Add messaging by using the following command

```
cds add enterprise-messaging --for  production
cds add enterprise-messaging-shared --for hybrid
```

- 10. Adjust file package.json for the following part.

```json
      "[production]": {
        "messaging": {
          "kind": "enterprise-messaging",
          "publishPrefix": "$namespace/",
          "subscribePrefix": "$namespace/",
          "queue": {
            "name": "$namespace/fo1"
          }
        }
      },
      "[hybrid]": {
        "messaging": {
          "kind": "enterprise-messaging-shared",
          "publishPrefix": "$namespace/",
          "subscribePrefix": "$namespace/"
        }
      }
```

- 11. run the following command to add message library.

```
npm add @sap/xb-msg-amqp-v100
```

- 12. Adjust the file `event-mesh.json' name space as the following:

```
 "namespace": "cap/freightorder/attach"
```

- 13. create file `service.js` under the folder `srv`

```js
const cds = require("@sap/cds");
const LOG = cds.log("service");
module.exports = cds.service.impl(async function () {
  const messaging = await cds.connect.to("messaging");
  const Fo = await cds.connect.to("CE_FREIGHTORDER_0001");
  // const db = cds.connect.to('db');

  messaging.on("ce/sap/s4/beh/FreightOrder/Created/v1", async (msg) => {
    console.log("logic triggered");
    console.log(msg);

    const {
      TransportationOrderUUID,
      TransportationOrder,
      TransportationOrderType,
      TransportationMode,
      TransportationShippingType,
      Carrier,
      TranspPurgOrgExtID,
    } = msg.data;

    console.log(TransportationOrderUUID);

    const { FreightOrder, FreightOrderItem } = Fo.entities;

    const { SrvFreightOrder, SrvFreightOrderItem } = this.entities;

    const freightOrder = await Fo.run(
      SELECT.from(FreightOrder)
        .columns(
          "TransportationOrderUUID",
          "TransportationOrder",
          "TransportationOrderType",
          "TransportationOrderCategory",
          "TransportationShippingType",
          "TransportationMode",
          "TransportationModeCategory",
          "CarrierUUID",
          "Carrier",
          "StandardCarrierAlphaCode",
          "TranspOrdExecutingCarrierUUID",
          "TranspOrdExecutingCarrier",
          "ShipperUUID",
          "Shipper",
          "ShipperAddressID",
          "ConsigneeUUID",
          "Consignee",
          "ConsigneeAddressID",
          "TranspPurgOrg",
          "TranspPurgOrgExtID",
          "TranspPurgGroup",
          "TranspPurgGroupExtID",
          "PurgOrgCompanyCode",
          "CarrierAccountNumber",
          "TranspMeansOfTransport",
          "TranspOrdPartnerReference",
          "TranspOrdResponsiblePerson",
          "TranspOrdHasMltplExectgPties",
          "TranspOrdInvoicingCarrierLevel",
          "TranspOrdLifeCycleStatus",
          "TranspOrderSubcontrgSts",
          "TransportationOrderConfSts",
          "TransportationOrderExecSts",
          "TranspOrdGoodsMovementStatus",
          "TranspOrdWhseProcessingStatus",
          "TranspOrderDngrsGdsSts",
          "TranspOrdExecutionIsBlocked",
          "TransportationOrderCrtnType",
          "CreatedByUser"
        )
        .where({ TransportationOrderUUID: TransportationOrderUUID })
    ).catch((err) => {
      console.log(err);
    });
    const freightOrderItems = await Fo.run(
      SELECT.from(FreightOrderItem).where({
        TransportationOrderUUID: TransportationOrderUUID,
      })
    ).catch((err) => {
      console.log(err);
    });
    const items = Array.isArray(freightOrderItems)
      ? freightOrderItems
      : [freightOrderItems];
    const headers = Array.isArray(freightOrder) ? freightOrder : [freightOrder];

    // console.log("freight order items");
    // console.log(headers);
    // console.log(items);

    await INSERT.into(SrvFreightOrder).entries(headers);
    await INSERT.into(SrvFreightOrderItem).entries(items);
  });
});
```

- 14. Create event mesh instance in BTP Subaccount.

Instance Name: `freightorderattach-messaging`

![alt text](image.png)

copy the content of file `event-mesh.json` paste it into next screen.
![alt text](image-1.png)
![alt text](image-2.png)

-15. Create service key for instance `freightorderattach-messaging`

Service Key Name: `freightorderattach-messaging-key`
![alt text](image-3.png)

- 16. Run the following command in BAS terminal.

```
cds bind -2 freightorderattach-messaging:freightorderattach-messaging-key
```

- 17. Configure communication arrangement in SAP S/4HANA Cloud with communication scenario `SAP_COM_0092` .
      ![alt text](image-4.png)

Test

```
cap/freightorder/attach/ce/sap/s4/beh/FreightOrder/Created/v1

application/json
```

```json
{
  "type": "sap.s4.beh.FreightOrder.Created.v1",
  "specversion": "1.0",
  "source": "/default/sap.s4.beh/740623809",
  "id": "07bebe98-fbca-1edf-bfe9-9231767df4f1",
  "time": "2025-03-12T14:16:20Z",
  "datacontenttype": "application/json",
  "data": {
    "TransportationOrderUUID": "07bebe98-fbca-1edf-bfe9-91f3ddb074f1",
    "TransportationOrder": "6600000955",
    "TransportationOrderType": "SFO2",
    "TransportationMode": "01",
    "TransportationShippingType": "18",
    "Carrier": "13386001",
    "TranspPurgOrgExtID": ""
  }
}
```

cds bind -2 freightorderattach-sdm:key
cds bind -2 freightorderattach-messaging:key
cds bind -2 freightorderattach-destination:freightorderattach-destinations-freightorderattach-destination-credentials

cds bind -2 aicorehj:apikey

cf create-service xsuaa application freightorderattach-uaa -c xs-security.json

cf create-service-key freightorderattach-uaa freightorderattach-uaa-key

cds bind -2 freightorderattach-uaa:freightorderattach-uaa-key

cap/freightorder/attach/ce/sap/s4/beh/FreightOrder/Created/v1

```JSON
{
"type":"sap.s4.beh.FreightOrder.Created.v1",
"specversion":"1.0",
"source":"/default/sap.s4.beh/740207565",
"id":"fa163ea1-6a76-1fe0-9694-2dc3cb43d19f",
"time":"2025-07-04T06:38:01Z",
"datacontenttype":"application/json",
"data":
{
"TransportationOrderUUID":"fa163ea1-6a76-1fe0-9694-2855aa39719f",
"TransportationOrder":"6600000706",
"TransportationOrderType":"SFO2",
"TransportationMode":"01",
"TransportationShippingType":"18",
"Carrier":"17386001",
"TranspPurgOrgExtID":"1710"
}
}

```
