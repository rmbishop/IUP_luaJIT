 ffi = require("ffi")
 
IUP_NAME =  "IUP - Portable User Interface"
IUP_COPYRIGHT = "Copyright (C) 1994-2013 Tecgraf, PUC-Rio."
IUP_DESCRIPTION	= "Multi-platform toolkit for building graphical user interfaces."
IUP_VERSION = "3.8"        
IUP_VERSION_NUMBER = 308000
IUP_VERSION_DATE = "2013/05/08"  

IUP_ERROR    = 1
IUP_NOERROR  = 0
IUP_OPENED   = -1
IUP_INVALID  = -1

 
IUP_IGNORE    = -1
IUP_DEFAULT   = -2
IUP_CLOSE     = -3
IUP_CONTINUE  = -4


IUP_CENTER       = 0xFFFF  
IUP_LEFT         = 0xFFFE  
IUP_RIGHT        = 0xFFFD  
IUP_MOUSEPOS     = 0xFFFC  
IUP_CURRENT      = 0xFFFB  
IUP_CENTERPARENT = 0xFFFA  
IUP_TOP     =  IUP_LEFT
IUP_BOTTOM  =  IUP_RIGHT 
 
IUP_MASK_FLOAT   = [[[+/-]?(/d+/.?/d*|/./d+)]]
IUP_MASK_UFLOAT  = [[(/d+/.?/d*|/./d+)]]
IUP_MASK_EFLOAT  = [[[+/-]?(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?]]
IUP_MASK_INT     = [[[+/-]?/d+]]
IUP_MASK_UINT    = [[/d+]]

IUPMASK_FLOAT    = IUP_MASK_FLOAT
IUPMASK_UFLOAT   = IUP_MASK_UFLOAT
IUPMASK_EFLOAT   = IUP_MASK_EFLOAT
IUPMASK_INT	     = IUP_MASK_INT
IUPMASK_UINT     = IUP_MASK_UINT



IUP_GETPARAM_OK     = -1
IUP_GETPARAM_INIT   = -2
IUP_GETPARAM_CANCEL = -3
IUP_GETPARAM_HELP   = -4

 
IUP_BUTTON1  = '1'
IUP_BUTTON2  = '2'
IUP_BUTTON3  = '3'
IUP_BUTTON4  = '4'
IUP_BUTTON5  = '5'

function iup_isshift(_s)    return (_s[0]=='S')  end
function iup_iscontrol(_s)  return (_s[1]=='C')  end
function iup_isbutton1(_s)  return (_s[2]=='1')  end
function iup_isbutton2(_s)  return (_s[3]=='2')  end
function iup_isbutton3(_s)  return (_s[4]=='3')  end
function iup_isdouble(_s)   return (_s[5]=='D')  end
function iup_isalt(_s)      return (_s[6]=='A')  end
function iup_issys(_s)      return (_s[7]=='Y')  end
function iup_isbutton4(_s)  return (_s[8]=='4')  end
function iup_isbutton5(_s)  return (_s[9]=='5')  end


isshift     = iup_isshift
iscontrol   = iup_iscontrol
isbutton1   = iup_isbutton1
isbutton2   = iup_isbutton2
isbutton3   = iup_isbutton3
isdouble    = iup_isdouble
isalt       = iup_isalt
issys       = iup_issys
isbutton4   = iup_isbutton4
isbutton5   = iup_isbutton5
 
 ffi.cdef[[
 



/*Cheating by making this unsigned int --bmk7800*/
typedef unsigned int Ihandle;

typedef int (*Icallback)(Ihandle*);


int       IupOpen          (int *argc, char ***argv);
void      IupClose         (void);
void      IupImageLibOpen  (void);

int       IupMainLoop      (void);
int       IupLoopStep      (void);
int       IupLoopStepWait  (void);
int       IupMainLoopLevel (void);
void      IupFlush         (void);
void      IupExitLoop      (void);

int       IupRecordInput(const char* filename, int mode);
int       IupPlayInput(const char* filename);

void      IupUpdate        (Ihandle* ih);
void      IupUpdateChildren(Ihandle* ih);
void      IupRedraw        (Ihandle* ih, int children);
void      IupRefresh       (Ihandle* ih);
void      IupRefreshChildren(Ihandle* ih);

char*     IupMapFont       (const char *iupfont);
char*     IupUnMapFont     (const char *driverfont);
int       IupHelp          (const char* url);
char*     IupLoad          (const char *filename);
char*     IupLoadBuffer    (const char *buffer);

char*     IupVersion       (void);
char*     IupVersionDate   (void);
int       IupVersionNumber (void);
void      IupSetLanguage   (const char *lng);
char*     IupGetLanguage   (void);

void      IupDestroy      (Ihandle* ih);
void      IupDetach       (Ihandle* child);
Ihandle*  IupAppend       (Ihandle* ih, Ihandle* child);
Ihandle*  IupInsert       (Ihandle* ih, Ihandle* ref_child, Ihandle* child);
Ihandle*  IupGetChild     (Ihandle* ih, int pos);
int       IupGetChildPos  (Ihandle* ih, Ihandle* child);
int       IupGetChildCount(Ihandle* ih);
Ihandle*  IupGetNextChild (Ihandle* ih, Ihandle* child);
Ihandle*  IupGetBrother   (Ihandle* ih);
Ihandle*  IupGetParent    (Ihandle* ih);
Ihandle*  IupGetDialog    (Ihandle* ih);
Ihandle*  IupGetDialogChild(Ihandle* ih, const char* name);
int       IupReparent     (Ihandle* ih, Ihandle* new_parent, Ihandle* ref_child);

int       IupPopup         (Ihandle* ih, int x, int y);
int       IupShow          (Ihandle* ih);
int       IupShowXY        (Ihandle* ih, int x, int y);
int       IupHide          (Ihandle* ih);
int       IupMap           (Ihandle* ih);
void      IupUnmap         (Ihandle *ih);

void      IupSetAttribute  (Ihandle* ih, const char* name, const char* value);
void      IupStoreAttribute(Ihandle* ih, const char* name, const char* value);
Ihandle*  IupSetAttributes (Ihandle* ih, const char *str);
char*     IupGetAttribute  (Ihandle* ih, const char* name);
char*     IupGetAttributes (Ihandle* ih);
int       IupGetInt        (Ihandle* ih, const char* name);
int       IupGetInt2       (Ihandle* ih, const char* name);
int       IupGetIntInt     (Ihandle *ih, const char* name, int *i1, int *i2);
float     IupGetFloat      (Ihandle* ih, const char* name);
void      IupSetfAttribute (Ihandle* ih, const char* name, const char* format, ...);
void      IupResetAttribute(Ihandle *ih, const char* name);
int       IupGetAllAttributes(Ihandle* ih, char** names, int n);
Ihandle*  IupSetAtt(const char* handle_name, Ihandle* ih, const char* name, ...);

void  IupSetAttributeId(Ihandle *ih, const char* name, int id, const char *value);
void  IupStoreAttributeId(Ihandle *ih, const char* name, int id, const char *value);
char* IupGetAttributeId(Ihandle *ih, const char* name, int id);
float IupGetFloatId(Ihandle *ih, const char* name, int id);
int   IupGetIntId(Ihandle *ih, const char* name, int id);
void  IupSetfAttributeId(Ihandle *ih, const char* name, int id, const char* format, ...);

void  IupSetAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* value);
void  IupStoreAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* value);
char* IupGetAttributeId2(Ihandle* ih, const char* name, int lin, int col);
int   IupGetIntId2(Ihandle* ih, const char* name, int lin, int col);
float IupGetFloatId2(Ihandle* ih, const char* name, int lin, int col);
void  IupSetfAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* format, ...);

void      IupSetGlobal     (const char* name, const char* value);
void      IupStoreGlobal   (const char* name, const char* value);
char*     IupGetGlobal     (const char* name);

Ihandle*  IupSetFocus      (Ihandle* ih);
Ihandle*  IupGetFocus      (void);
Ihandle*  IupPreviousField (Ihandle* ih);  
Ihandle*  IupNextField     (Ihandle* ih);

Icallback IupGetCallback(Ihandle* ih, const char *name);
Icallback IupSetCallback(Ihandle* ih, const char *name, Icallback func);
Ihandle*  IupSetCallbacks(Ihandle* ih, const char *name, Icallback func, ...);

Icallback   IupGetFunction   (const char *name);
Icallback   IupSetFunction   (const char *name, Icallback func);
const char* IupGetActionName (void);

Ihandle*  IupGetHandle     (const char *name);
Ihandle*  IupSetHandle     (const char *name, Ihandle* ih);
int       IupGetAllNames   (char** names, int n);
int       IupGetAllDialogs (char** names, int n);
char*     IupGetName       (Ihandle* ih);

void      IupSetAttributeHandle(Ihandle* ih, const char* name, Ihandle* ih_named);
Ihandle*  IupGetAttributeHandle(Ihandle* ih, const char* name);

char*     IupGetClassName(Ihandle* ih);
char*     IupGetClassType(Ihandle* ih);
int       IupGetAllClasses(char** names, int n);
int       IupGetClassAttributes(const char* classname, char** names, int n);
int       IupGetClassCallbacks(const char* classname, char** names, int n);
void      IupSaveClassAttributes(Ihandle* ih);
void      IupCopyClassAttributes(Ihandle* src_ih, Ihandle* dst_ih);
void      IupSetClassDefaultAttribute(const char* classname, const char *name, const char* value);
int       IupClassMatch(Ihandle* ih, const char* classname);

Ihandle*  IupCreate (const char *classname);
Ihandle*  IupCreatev(const char *classname, void* *params);
Ihandle*  IupCreatep(const char *classname, void *first, ...);

/************************************************************************/
/*                        Elements                                      */
/************************************************************************/

Ihandle*  IupFill       (void);
Ihandle*  IupRadio      (Ihandle* child);
Ihandle*  IupVbox       (Ihandle* child, ...);
Ihandle*  IupVboxv      (Ihandle* *children);
Ihandle*  IupZbox       (Ihandle* child, ...);
Ihandle*  IupZboxv      (Ihandle* *children);
Ihandle*  IupHbox       (Ihandle* child,...);
Ihandle*  IupHboxv      (Ihandle* *children);

Ihandle*  IupNormalizer (Ihandle* ih_first, ...);
Ihandle*  IupNormalizerv(Ihandle* *ih_list);

Ihandle*  IupCbox       (Ihandle* child, ...);
Ihandle*  IupCboxv      (Ihandle* *children);
Ihandle*  IupSbox       (Ihandle *child);
Ihandle*  IupSplit      (Ihandle* child1, Ihandle* child2);
Ihandle*  IupScrollBox  (Ihandle* child);
Ihandle*  IupGridBox    (Ihandle* child, ...);
Ihandle*  IupGridBoxv   (Ihandle **children);
Ihandle*  IupExpander   (Ihandle *child);

Ihandle*  IupFrame      (Ihandle* child);

Ihandle*  IupImage      (int width, int height, const unsigned char *pixmap);
Ihandle*  IupImageRGB   (int width, int height, const unsigned char *pixmap);
Ihandle*  IupImageRGBA  (int width, int height, const unsigned char *pixmap);

Ihandle*  IupItem       (const char* title, const char* action);
Ihandle*  IupSubmenu    (const char* title, Ihandle* child);
Ihandle*  IupSeparator  (void);
Ihandle*  IupMenu       (Ihandle* child,...);
Ihandle*  IupMenuv      (Ihandle* *children);

Ihandle*  IupButton     (const char* title, const char* action);
Ihandle*  IupCanvas     (const char* action);
Ihandle*  IupDialog     (Ihandle* child);
Ihandle*  IupUser       (void);
Ihandle*  IupLabel      (const char* title);
Ihandle*  IupList       (const char* action);
Ihandle*  IupText       (const char* action);
Ihandle*  IupMultiLine  (const char* action);
Ihandle*  IupToggle     (const char* title, const char* action);
Ihandle*  IupTimer      (void);
Ihandle*  IupClipboard  (void);
Ihandle*  IupProgressBar(void);
Ihandle*  IupVal        (const char *type);
Ihandle*  IupTabs       (Ihandle* child, ...);
Ihandle*  IupTabsv      (Ihandle* *children);
Ihandle*  IupTree       (void);
Ihandle*  IupLink       (const char* url, const char* title);


/* Deprecated controls, use SPIN attribute of IupText */
Ihandle*  IupSpin       (void);
Ihandle*  IupSpinbox    (Ihandle* child);


/* IupImage utility */
int IupSaveImageAsText(Ihandle* ih, const char* file_name, const char* format, const char* name);

/* IupText and IupScintilla utilities */
void  IupTextConvertLinColToPos(Ihandle* ih, int lin, int col, int *pos);
void  IupTextConvertPosToLinCol(Ihandle* ih, int pos, int *lin, int *col);

/* IupText, IupList, IupTree, IupMatrix and IupScintilla utility */
int   IupConvertXYToPos(Ihandle* ih, int x, int y);

/* IupTree utilities */
int   IupTreeSetUserId(Ihandle* ih, int id, void* userid);
void* IupTreeGetUserId(Ihandle* ih, int id);
int   IupTreeGetId(Ihandle* ih, void *userid);

/* Deprecated IupTree utilities, use Iup*AttributeId functions */
void  IupTreeSetAttribute  (Ihandle* ih, const char* name, int id, const char* value);
void  IupTreeStoreAttribute(Ihandle* ih, const char* name, int id, const char* value);
char* IupTreeGetAttribute  (Ihandle* ih, const char* name, int id);
int   IupTreeGetInt        (Ihandle* ih, const char* name, int id);
float IupTreeGetFloat      (Ihandle* ih, const char* name, int id);
void  IupTreeSetfAttribute (Ihandle* ih, const char* name, int id, const char* format, ...);
void  IupTreeSetAttributeHandle(Ihandle* ih, const char* a, int id, Ihandle* ih_named);


/************************************************************************/
/*                      Pre-definided dialogs                           */
/************************************************************************/

Ihandle* IupFileDlg(void);
Ihandle* IupMessageDlg(void);
Ihandle* IupColorDlg(void);
Ihandle* IupFontDlg(void);

int  IupGetFile(char *arq);
void IupMessage(const char *title, const char *msg);
void IupMessagef(const char *title, const char *format, ...);
int  IupAlarm(const char *title, const char *msg, const char *b1, const char *b2, const char *b3);
int  IupScanf(const char *format, ...);
int  IupListDialog(int type, const char *title, int size, const char** list,
                   int op, int max_col, int max_lin, int* marks);
int  IupGetText(const char* title, char* text);
int  IupGetColor(int x, int y, unsigned char* r, unsigned char* g, unsigned char* b);

typedef int (*Iparamcb)(Ihandle* dialog, int param_index, void* user_data);
int IupGetParam(const char* title, Iparamcb action, void* user_data, const char* format,...);
int IupGetParamv(const char* title, Iparamcb action, void* user_data, const char* format, int param_count, int param_extra, void** param_data);

Ihandle* IupLayoutDialog(Ihandle* dialog);
Ihandle* IupElementPropertiesDialog(Ihandle* elem);



/************************************************************************/
/*               SHOW_CB Callback Values                                */
/************************************************************************/
enum{IUP_SHOW, IUP_RESTORE, IUP_MINIMIZE, IUP_MAXIMIZE, IUP_HIDE};

/************************************************************************/
/*               SCROLL_CB Callback Values                              */
/************************************************************************/
enum{IUP_SBUP,   IUP_SBDN,    IUP_SBPGUP,   IUP_SBPGDN,    IUP_SBPOSV, IUP_SBDRAGV, 
     IUP_SBLEFT, IUP_SBRIGHT, IUP_SBPGLEFT, IUP_SBPGRIGHT, IUP_SBPOSH, IUP_SBDRAGH};

/************************************************************************/
/*               Mouse Button Values and Macros                         */
/************************************************************************/


enum {IUP_RECBINARY, IUP_RECTEXT};


int IupMain (int argc, char** argv); 




 
 ]]
 

 function item_help_cb()
  iup.IupMessage ("Warning", "Only Help and Exit items performs an operation");
  
  return IUP_DEFAULT;
 end
 
 
 function item_exit_cb()
   return IUP_CLOSE
 end
 
 
 iup = ffi.load("iup_combined_dlls.dll")
 
--Example code pulled right from submenu.c in the iup-3.8 Examples.zip, 
--which is available for download at the IUP site.  The only modifications
--are that some slight syntax changes were needed to convert it
--from C to Lua.
 
dlg  = ffi.new("Ihandle[1]")
text  = ffi.new("Ihandle[1]")
menu = ffi.new("Ihandle[1]")
menu_file = ffi.new("Ihandle[1]")
menu_edit = ffi.new("Ihandle[1]")
menu_help  = ffi.new("Ihandle[1]")
menu_create  = ffi.new("Ihandle[1]")
menu_triangle  = ffi.new("Ihandle[1]")
submenu_file = ffi.new("Ihandle[1]")
submenu_edit = ffi.new("Ihandle[1]")
submenu_help = ffi.new("Ihandle[1]")
submenu_create = ffi.new("Ihandle[1]")
submenu_triangle = ffi.new("Ihandle[1]")
item_new = ffi.new("Ihandle[1]")
item_open = ffi.new("Ihandle[1]")
item_close = ffi.new("Ihandle[1]")
item_exit = ffi.new("Ihandle[1]")
item_copy = ffi.new("Ihandle[1]")
item_paste = ffi.new("Ihandle[1]")
item_line = ffi.new("Ihandle[1]")
item_circle = ffi.new("Ihandle[1]")
item_equilateral= ffi.new("Ihandle[1]")
item_isoceles = ffi.new("Ihandle[1]")
item_scalenus = ffi.new("Ihandle[1]")
item_help = ffi.new("Ihandle[1]")

iup.IupOpen(nil, nil);


text = iup.IupText (nil);

iup.IupSetAttributes (text, "VALUE = \"This text is here only to compose\", EXPAND = YES");
 
item_new = iup.IupItem ("New", nil);
item_open = iup.IupItem ("Open", nil);
item_close = iup.IupItem ("Close", nil);
item_exit = iup.IupItem ("Exit", "item_exit_act");

item_copy = iup.IupItem ("Copy", nil);
item_paste = iup.IupItem ("Paste", nil);

item_scalenus = iup.IupItem ("Scalenus", nil);
item_isoceles = iup.IupItem ("Isoceles", nil);
item_equilateral = iup.IupItem ("Equilateral", nil);

menu_triangle = iup.IupMenu (item_equilateral, item_isoceles, item_scalenus, nil);

submenu_triangle = iup.IupSubmenu ("Triangle", menu_triangle);

item_line = iup.IupItem ("Line", nil);
item_circle = iup.IupItem ("Circle", nil);

menu_create = iup.IupMenu (item_line, item_circle, submenu_triangle, nil);

submenu_create = iup.IupSubmenu ("Create", menu_create);

item_help = iup.IupItem ("Help", "item_help_act");

menu_file = iup.IupMenu (item_new, item_open, item_close, iup.IupSeparator(), item_exit, nil);
menu_edit = iup.IupMenu (item_copy, item_paste, iup.IupSeparator(), submenu_create, nil);
menu_help = iup.IupMenu (item_help, nil);

submenu_file = iup.IupSubmenu ("File", menu_file);
submenu_edit = iup.IupSubmenu ("Edit", menu_edit);
submenu_help = iup.IupSubmenu ("Help", menu_help);

menu = iup.IupMenu (submenu_file, submenu_edit, submenu_help, nil);

iup.IupSetCallback (item_help, "ACTION", item_help_cb);
iup.IupSetCallback (item_exit, "ACTION",  item_exit_cb);

iup.IupSetHandle ("menu", menu);
							
dlg = iup.IupDialog (text);

iup.IupSetAttributes (dlg, "TITLE=\"IupSubmenu Example\", SIZE = QUARTERxEIGHTH, MENU = menu");

iup.IupShowXY (dlg, IUP_CENTER, IUP_CENTER);

iup.IupMainLoop ();

iup.IupClose ();  

 