using { sap.freightorder.db as my  } from './schema';
using { sap.attachments.Attachments } from '@cap-js/sdm';

extend my.DBFreightOrderItem with { attachments: Composition of many Attachments };