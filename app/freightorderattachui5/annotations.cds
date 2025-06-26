using freightorder as service from '../../srv/service';
using from '../../db/attachments';

annotate service.SrvFreightOrder with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderUUID',
                Value : TransportationOrderUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrder',
                Value : TransportationOrder,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderType',
                Value : TransportationOrderType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderCategory',
                Value : TransportationOrderCategory,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationShippingType',
                Value : TransportationShippingType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationMode',
                Value : TransportationMode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationModeCategory',
                Value : TransportationModeCategory,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CarrierUUID',
                Value : CarrierUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Carrier',
                Value : Carrier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'StandardCarrierAlphaCode',
                Value : StandardCarrierAlphaCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdExecutingCarrierUUID',
                Value : TranspOrdExecutingCarrierUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdExecutingCarrier',
                Value : TranspOrdExecutingCarrier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ShipperUUID',
                Value : ShipperUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Shipper',
                Value : Shipper,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ShipperAddressID',
                Value : ShipperAddressID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ConsigneeUUID',
                Value : ConsigneeUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Consignee',
                Value : Consignee,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ConsigneeAddressID',
                Value : ConsigneeAddressID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspPurgOrg',
                Value : TranspPurgOrg,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspPurgOrgExtID',
                Value : TranspPurgOrgExtID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspPurgGroup',
                Value : TranspPurgGroup,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspPurgGroupExtID',
                Value : TranspPurgGroupExtID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PurgOrgCompanyCode',
                Value : PurgOrgCompanyCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CarrierAccountNumber',
                Value : CarrierAccountNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspMeansOfTransport',
                Value : TranspMeansOfTransport,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdPartnerReference',
                Value : TranspOrdPartnerReference,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdResponsiblePerson',
                Value : TranspOrdResponsiblePerson,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdHasMltplExectgPties',
                Value : TranspOrdHasMltplExectgPties,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdInvoicingCarrierLevel',
                Value : TranspOrdInvoicingCarrierLevel,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdLifeCycleStatus',
                Value : TranspOrdLifeCycleStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrderSubcontrgSts',
                Value : TranspOrderSubcontrgSts,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderConfSts',
                Value : TransportationOrderConfSts,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderExecSts',
                Value : TransportationOrderExecSts,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdGoodsMovementStatus',
                Value : TranspOrdGoodsMovementStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdWhseProcessingStatus',
                Value : TranspOrdWhseProcessingStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrderDngrsGdsSts',
                Value : TranspOrderDngrsGdsSts,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdExecutionIsBlocked',
                Value : TranspOrdExecutionIsBlocked,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderCrtnType',
                Value : TransportationOrderCrtnType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CreatedByUser',
                Value : CreatedByUser,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'FreightOrderItems',
            ID : 'FreightOrderItems',
            Target : 'FreightOrderItems/@UI.LineItem#FreightOrderItems',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'TransportationOrderUUID',
            Value : TransportationOrderUUID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'TransportationOrder',
            Value : TransportationOrder,
        },
        {
            $Type : 'UI.DataField',
            Label : 'TransportationOrderType',
            Value : TransportationOrderType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'TransportationOrderCategory',
            Value : TransportationOrderCategory,
        },
        {
            $Type : 'UI.DataField',
            Label : 'TransportationShippingType',
            Value : TransportationShippingType,
        },
    ],
);

annotate service.SrvFreightOrderItem with @(
    UI.LineItem #FreightOrderItems : [
        {
            $Type : 'UI.DataField',
            Value : TranspBaseDocumentItem,
            Label : 'TranspBaseDocumentItem',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspBaseDocumentItemType,
            Label : 'TranspBaseDocumentItemType',
        },
        {
            $Type : 'UI.DataField',
            Value : Shipper,
            Label : 'Shipper',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductID,
            Label : 'ProductID',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItem,
            Label : 'TranspOrdItem',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemDesc,
            Label : 'TranspOrdItemDesc',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemNetWeight,
            Label : 'TranspOrdItemNetWeight',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemGrossWeight,
            Label : 'TranspOrdItemGrossWeight',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemPackageID,
            Label : 'TranspOrdItemPackageID',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemQuantity,
            Label : 'TranspOrdItemQuantity',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemQuantityUnit,
            Label : 'TranspOrdItemQuantityUnit',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'ItemDetails',
            ID : 'ItemDetails',
            Target : '@UI.FieldGroup#ItemDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Attachments',
            ID : 'Attachments',
            Target : 'attachments/@UI.LineItem#Attachments',
        },
    ],
    UI.FieldGroup #ItemDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Consignee,
                Label : 'Consignee',
            },
            {
                $Type : 'UI.DataField',
                Value : ConsigneeAddressID,
                Label : 'ConsigneeAddressID',
            },
            {
                $Type : 'UI.DataField',
                Value : ConsigneeUUID,
                Label : 'ConsigneeUUID',
            },
            {
                $Type : 'UI.DataField',
                Value : DestinationStopUUID,
                Label : 'DestinationStopUUID',
            },
            {
                $Type : 'UI.DataField',
                Value : FreightUnitUUID,
                Label : 'FreightUnitUUID',
            },
            {
                $Type : 'UI.DataField',
                Value : IsMainCargoItem,
                Label : 'IsMainCargoItem',
            },
            {
                $Type : 'UI.DataField',
                Value : PredecessorTransportationOrder,
                Label : 'PredecessorTransportationOrder',
            },
            {
                $Type : 'UI.DataField',
                Value : MaterialFreightGroup,
                Label : 'MaterialFreightGroup',
            },
            {
                $Type : 'UI.DataField',
                Value : ProductID,
                Label : 'ProductID',
            },
            {
                $Type : 'UI.DataField',
                Value : ProductUUID,
                Label : 'ProductUUID',
            },
            {
                $Type : 'UI.DataField',
                Value : Shipper,
                Label : 'Shipper',
            },
            {
                $Type : 'UI.DataField',
                Value : ShipperAddressID,
                Label : 'ShipperAddressID',
            },
            {
                $Type : 'UI.DataField',
                Value : ShipperUUID,
                Label : 'ShipperUUID',
            },
            {
                $Type : 'UI.DataField',
                Value : SourceStopUUID,
                Label : 'SourceStopUUID',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspBaseDocument,
                Label : 'TranspBaseDocument',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspBaseDocumentItemType,
                Label : 'TranspBaseDocumentItemType',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspBaseDocumentItem,
                Label : 'TranspBaseDocumentItem',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspBaseDocumentType,
                Label : 'TranspBaseDocumentType',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipCapacityHeight,
                Label : 'TranspEquipCapacityHeight',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipCapacityLength,
                Label : 'TranspEquipCapacityLength',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipCapacityUnit,
                Label : 'TranspEquipCapacityUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipCapacityVolume,
                Label : 'TranspEquipCapacityVolume',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipCapacityVolumeUnit,
                Label : 'TranspEquipCapacityVolumeUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipCapacityWeight,
                Label : 'TranspEquipCapacityWeight',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipCapacityWeightUnit,
                Label : 'TranspEquipCapacityWeightUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipCapacityWidth,
                Label : 'TranspEquipCapacityWidth',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipmentIsShipperOwned,
                Label : 'TranspEquipmentIsShipperOwned',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipmentPlateNumber,
                Label : 'TranspEquipmentPlateNumber',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspEquipRegistrationCountry,
                Label : 'TranspEquipRegistrationCountry',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItem,
                Label : 'TranspOrdItem',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemCategory,
                Label : 'TranspOrdItemCategory',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemDesc,
                Label : 'TranspOrdItemDesc',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemGrossVolume,
                Label : 'TranspOrdItemGrossVolume',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemGrossVolumeUnit,
                Label : 'TranspOrdItemGrossVolumeUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemGrossWeight,
                Label : 'TranspOrdItemGrossWeight',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemGrossWeightUnit,
                Label : 'TranspOrdItemGrossWeightUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemNetWeight,
                Label : 'TranspOrdItemNetWeight',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemNetWeightUnit,
                Label : 'TranspOrdItemNetWeightUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemPackageID,
                Label : 'TranspOrdItemPackageID',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemParentItemUUID,
                Label : 'TranspOrdItemParentItemUUID',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemQuantity,
                Label : 'TranspOrdItemQuantity',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemQuantityUnit,
                Label : 'TranspOrdItemQuantityUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemSorting,
                Label : 'TranspOrdItemSorting',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemTemperatureUnit,
                Label : 'TranspOrdItemTemperatureUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemType,
                Label : 'TranspOrdItemType',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItmMaxTemp,
                Label : 'TranspOrdItmMaxTemp',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItmMinTemp,
                Label : 'TranspOrdItmMinTemp',
            },
            {
                $Type : 'UI.DataField',
                Value : TransportationEquipmentGroup,
                Label : 'TransportationEquipmentGroup',
            },
            {
                $Type : 'UI.DataField',
                Value : TransportationEquipmentType,
                Label : 'TransportationEquipmentType',
            },
            {
                $Type : 'UI.DataField',
                Value : TransportationGroup,
                Label : 'TransportationGroup',
            },
            {
                $Type : 'UI.DataField',
                Value : TransportationOrderItemUUID,
                Label : 'TransportationOrderItemUUID',
            },
            {
                $Type : 'UI.DataField',
                Value : TransportationOrderUUID,
                Label : 'TransportationOrderUUID',
            },
        ],
    },
    UI.DeleteHidden : true,
);

annotate service.SrvFreightOrderItem.attachments with @(
    UI.LineItem #Attachments : [
        {
            $Type : 'UI.DataField',
            Value : filename,
        },
        {
            $Type : 'UI.DataField',
            Value : note,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ]
);

annotate service.SrvFreightOrder with {
    TransportationOrderUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TransportationOrder @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TransportationOrderType @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TransportationOrderCategory @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TransportationShippingType @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TransportationMode @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TransportationModeCategory @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    CarrierUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    Carrier @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    StandardCarrierAlphaCode @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdExecutingCarrierUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdExecutingCarrier @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    ShipperUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    Shipper @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    ShipperAddressID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    ConsigneeUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    Consignee @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    ConsigneeAddressID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspPurgOrg @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspPurgOrgExtID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspPurgGroup @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspPurgGroupExtID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    PurgOrgCompanyCode @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    CarrierAccountNumber @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspMeansOfTransport @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdPartnerReference @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdResponsiblePerson @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdHasMltplExectgPties @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdInvoicingCarrierLevel @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdLifeCycleStatus @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrderSubcontrgSts @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TransportationOrderConfSts @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TransportationOrderExecSts @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdGoodsMovementStatus @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdWhseProcessingStatus @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrderDngrsGdsSts @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TranspOrdExecutionIsBlocked @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    TransportationOrderCrtnType @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrder with {
    CreatedByUser @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspBaseDocumentItem @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspBaseDocumentItemType @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    ProductID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItem @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemDesc @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemNetWeight @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemGrossWeight @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemPackageID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemQuantity @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemQuantityUnit @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    Consignee @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    ConsigneeAddressID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    ConsigneeUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    DestinationStopUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    FreightUnitUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    IsMainCargoItem @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    PredecessorTransportationOrder @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    MaterialFreightGroup @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    ProductUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    Shipper @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    ShipperAddressID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    ShipperUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    SourceStopUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspBaseDocument @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspBaseDocumentType @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipCapacityHeight @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipCapacityLength @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipCapacityUnit @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipCapacityVolume @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipCapacityVolumeUnit @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipCapacityWeight @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipCapacityWeightUnit @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipCapacityWidth @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipmentIsShipperOwned @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipmentPlateNumber @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspEquipRegistrationCountry @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemCategory @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemGrossVolume @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemGrossVolumeUnit @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemGrossWeightUnit @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemNetWeightUnit @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemParentItemUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemSorting @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemTemperatureUnit @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItemType @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItmMaxTemp @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TranspOrdItmMinTemp @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TransportationEquipmentGroup @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TransportationEquipmentType @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TransportationGroup @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TransportationOrderItemUUID @Common.FieldControl : #ReadOnly
};

annotate service.SrvFreightOrderItem with {
    TransportationOrderUUID @Common.FieldControl : #ReadOnly
};

