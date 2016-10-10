%% This is an -*- erlang -*- file.
%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2010-2022. All Rights Reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%
%% %CopyrightEnd%

{application, wx,
 [{description, "Yet another graphics system"},
  {vsn, "2.2"},
  {modules,
   [
    %% Generated modules
  wxImage, wxGraphicsContext, wxPreviewFrame, wxFontPickerCtrl, wxEvtHandler, wxFileDialog, wxFlexGridSizer, wxPrintDialogData, wxAuiNotebook, wxMouseCaptureChangedEvent, wxDCOverlay, wxClipboardTextEvent, wxMoveEvent, wxDisplay, wxChoicebook, wxSystemOptions, wxNotificationMessage, wxGridCellFloatRenderer, wxWindowDC, wxColourDialog, wxStatusBar, wxGenericDirCtrl, wxInitDialogEvent, wxEvent, wxXmlResource, wxShowEvent, wxTaskBarIconEvent, wxGraphicsObject, wxPrintout, wxSysColourChangedEvent, wxGridCellRenderer, wxListCtrl, wxLocale, wxGraphicsMatrix, wxSizerItem, wxBitmap, wxRegion, wxGridCellBoolRenderer, wxPasswordEntryDialog, wxFrame, wxNavigationKeyEvent, wxGraphicsRenderer, wxMouseCaptureLostEvent, wxTextEntryDialog, wxIdleEvent, wxStyledTextCtrl, wxListItem, wxSpinCtrl, wxGraphicsPath, wxMDIClientWindow, wxMDIChildFrame, wxStdDialogButtonSizer, wxFontPickerEvent, wxPrintPreview, wxPrintData, wxDirPickerCtrl, wxKeyEvent, wxBookCtrlBase, wxFontDialog, wxRadioBox, wxCalendarDateAttr, wxGridCellEditor, wxTreebook, wxLogNull, wxGridCellChoiceEditor, wxChoice, wxControl, wxToggleButton, wxStaticText, wxCalendarCtrl, wxIconizeEvent, wxJoystickEvent, wxGridBagSizer, wxListbook, wxGridSizer, wxScrollEvent, wxGLContext, wxWindowCreateEvent, wxGridCellFloatEditor, wxPrintDialog, wxStaticBox, wxBufferedDC, wxTextCtrl, wxClientDC, wxStaticBitmap, wxDateEvent, wxCalendarEvent, wxGauge, wxSizerFlags, wxGridCellTextEditor, wxBitmapDataObject, wxFindReplaceDialog, wxGridCellStringRenderer, wxTextDataObject, wxStaticLine, wxMiniFrame, wxDisplayChangedEvent, wxListEvent, wxCursor, wxDialog, wxBrush, wxTopLevelWindow, wxPaintDC, wxScreenDC, wxFileDataObject, wxPopupWindow, wxColourPickerCtrl, wxFilePickerCtrl, wxPostScriptDC, wxGrid, wxAuiSimpleTabArt, wxSashEvent, wxScrolledWindow, wxMask, wxFontData, wxSplitterEvent, wxScrollBar, wxBookCtrlEvent, wxMenu, wxCheckBox, wxHtmlWindow, wxListItemAttr, wxMirrorDC, wxGraphicsGradientStops, wxAuiManager, wxFileDirPickerEvent, wxBoxSizer, wxClipboard, wxMouseEvent, wxDirDialog, wxStyledTextEvent, wxSashWindow, wxAuiPaneInfo, wxPaintEvent, wxSplitterWindow, wxProgressDialog, wxGridCellNumberEditor, wxListBox, wxActivateEvent, wxColourPickerEvent, wxMenuItem, wxChildFocusEvent, wxMessageDialog, wxMenuBar, wxMaximizeEvent, wxToolBar, wxGraphicsPen, wxGridCellNumberRenderer, wxPaletteChangedEvent, wxArtProvider, wxHtmlEasyPrinting, wxBufferedPaintDC, wxTreeCtrl, wxFindReplaceData, wxListView, wxAuiManagerEvent, wxHtmlLinkEvent, wxGridCellAttr, wxContextMenuEvent, wxLayoutAlgorithm, wxCheckListBox, wxGridCellBoolEditor, wxMultiChoiceDialog, wxOverlay, wxWebView, wxAuiDockArt, wxDropFilesEvent, wxComboBox, wxCommandEvent, wxDataObject, wxDatePickerCtrl, wxFocusEvent, wxImageList, wxNotifyEvent, wxToolTip, wxPalette, wxSlider, wxQueryNewPaletteEvent, wxPanel, wxSizer, wxPageSetupDialogData, wxGBSizerItem, wxPen, wxPickerBase, wxAuiNotebookEvent, wxGLCanvas, wxWebViewEvent, wxStaticBoxSizer, wxUpdateUIEvent, wxColourData, wxIcon, wxBitmapButton, wxMemoryDC, wxToolbook, wxPopupTransientWindow, wxGCDC, wxAcceleratorEntry, wxRadioButton, wxGraphicsFont, wxCloseEvent, wxNotebook, wxDC, wxCaret, wxAcceleratorTable, wxMenuEvent, wxMDIParentFrame, wxPreviewControlBar, wxHelpEvent, wxFont, wxEraseEvent, wxControlWithItems, wxSystemSettings, wxWindow, wxTreeEvent, wxSplashScreen, wxSpinEvent, wxSingleChoiceDialog, wxButton, wxPrinter, wxTaskBarIcon, wxAuiTabArt, wxIconBundle, wxSpinButton, wxPageSetupDialog, wxSashLayoutWindow, wxGridEvent, wx_misc, wxPreviewCanvas, wxTextAttr, wxScrollWinEvent, wxSizeEvent, wxGraphicsBrush, wxWindowDestroyEvent, wxSetCursorEvent, glu, gl,
    %% Handcrafted modules
    wx,
    wx_object,
    wxe_master,
    wxe_server,
    wxe_util
   ]},
  {registered, []},
  {applications, [stdlib, kernel]},
  {env, []},
  {runtime_dependencies, ["stdlib-3.15","kernel-8.0","erts-12.0"]}
 ]}.
