sap.ui.define(['sap/ui/core/mvc/ControllerExtension', 'sap/ui/model/json/JSONModel'], function (ControllerExtension, JSONModel) {
    'use strict';

    return ControllerExtension.extend('freightorderattachui5.ext.controller.ActionController', {
        // this section allows to extend lifecycle hooks or hooks provided by Fiori elements


        suggestRoute: function (oEvent) {
            // const api = this.base.getExtensionAPI();
            const bindingContext = this.base.getExtensionAPI().getBindingContext();
            const oAction = oEvent.getModel().bindContext("freightorder.suggestBestRoute(...)", bindingContext);
            oAction.execute().then(() => {
                const oActionContext = oAction.getBoundContext();
                const oActionObjectList = oActionContext.getObject().value;
                const oLLMResult = new JSONModel({
                    shipInfo: oActionObjectList[0],
                    lLmSuggestion: oActionObjectList[1]

                });

                if (!this.suggestionFrag) {
                    this.suggestionFrag = this.base.getExtensionAPI().loadFragment({
                        id: "suggestionFrag",
                        name: "freightorderattachui5.ext.fragment.SuggestionFrag"
                    });
                }
                this.suggestionFrag.then(function (dialog) {
                    dialog.setModel(oLLMResult);
                    dialog.open();
                }.bind(this)).catch(err => {
                    console.log(err)

                }
                );


                // handle the result of the action
            }).catch(error => {
                console.log(error)
                // handle any errors that occurred during execution
            });
        },
        override: {
            /**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf freightorderattachui5.ext.controller.ActionController
             */


            onInit: function () {
                // you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
                var oModel = this.base.getExtensionAPI().getModel();
            }
        }
    });
});
