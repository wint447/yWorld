/*
const $ = require('jquery');
const ui = require('./ui');
require('../base/setting.js');
*/
import $ from 'jquery';
import ui from './ui';
import '../base/settings.js';


$.summernote = $.extend($.summernote, {
  ui: ui,
});
