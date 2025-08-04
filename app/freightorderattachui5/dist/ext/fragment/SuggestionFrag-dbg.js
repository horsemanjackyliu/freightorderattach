sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';

    return {
        onPress: function (oEvent) {
            oEvent.getSource().getParent().close();
            // MessageToast.show("Custom handler invoked.");
        }
    };
});
