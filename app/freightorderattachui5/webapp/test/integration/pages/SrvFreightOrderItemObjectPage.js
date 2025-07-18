sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'freightorderattachui5',
            componentId: 'SrvFreightOrderItemObjectPage',
            contextPath: '/SrvFreightOrder/FreightOrderItems'
        },
        CustomPageDefinitions
    );
});