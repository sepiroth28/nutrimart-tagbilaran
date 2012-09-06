VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQuickReport 
   Caption         =   "QuickReport"
   ClientHeight    =   9555
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   10935
   LinkTopic       =   "Form1"
   ScaleHeight     =   9555
   ScaleWidth      =   10935
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000018&
      ForeColor       =   &H80000008&
      Height          =   9705
      Left            =   30
      ScaleHeight     =   9675
      ScaleWidth      =   10905
      TabIndex        =   0
      Top             =   0
      Width           =   10935
      Begin VB.Frame Frame1 
         BackColor       =   &H80000018&
         Caption         =   "Criteria"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   4275
         Left            =   150
         TabIndex        =   4
         Top             =   720
         Width           =   10605
         Begin VB.CommandButton cmdLoad_reports 
            Caption         =   "Load Reports"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   585
            Left            =   450
            TabIndex        =   12
            Top             =   3450
            Width           =   2115
         End
         Begin VB.ComboBox cboCategory 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Left            =   510
            TabIndex        =   11
            Text            =   "Item"
            Top             =   1020
            Width           =   2715
         End
         Begin VB.CommandButton cmdBrowse 
            Caption         =   "..."
            Height          =   495
            Left            =   9030
            TabIndex        =   10
            Top             =   1020
            Width           =   615
         End
         Begin VB.TextBox txtselection 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   5340
            TabIndex        =   9
            Top             =   1020
            Width           =   3675
         End
         Begin VB.CommandButton cmd_browse_start_date 
            Caption         =   "..."
            Height          =   405
            Left            =   510
            TabIndex        =   8
            Top             =   2310
            Visible         =   0   'False
            Width           =   465
         End
         Begin VB.ComboBox cboDateSelection 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Left            =   540
            TabIndex        =   7
            Text            =   "Today"
            Top             =   1740
            Width           =   2715
         End
         Begin VB.CommandButton cmd_browse_end_date 
            Caption         =   "..."
            Height          =   405
            Left            =   510
            TabIndex        =   6
            Top             =   2880
            Visible         =   0   'False
            Width           =   465
         End
         Begin MSComctlLib.ListView lsvlist 
            Height          =   1275
            Left            =   5340
            TabIndex        =   5
            Top             =   1530
            Visible         =   0   'False
            Width           =   4335
            _ExtentX        =   7646
            _ExtentY        =   2249
            View            =   3
            LabelEdit       =   1
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            HideColumnHeaders=   -1  'True
            FullRowSelect   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            NumItems        =   5
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "customer_id"
               Object.Width           =   0
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "customer_name"
               Object.Width           =   5292
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Object.Width           =   2540
            EndProperty
         End
         Begin VB.Label Label9 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0E0FF&
            BackStyle       =   0  'Transparent
            Caption         =   "*"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   12
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000C0&
            Height          =   195
            Left            =   5100
            TabIndex        =   23
            Top             =   1170
            Width           =   225
         End
         Begin VB.Label Label8 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0E0FF&
            BackStyle       =   0  'Transparent
            Caption         =   "*"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   12
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000C0&
            Height          =   195
            Left            =   240
            TabIndex        =   22
            Top             =   3000
            Visible         =   0   'False
            Width           =   225
         End
         Begin VB.Label Label7 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0E0FF&
            BackStyle       =   0  'Transparent
            Caption         =   "*"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   12
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000C0&
            Height          =   195
            Left            =   210
            TabIndex        =   21
            Top             =   2400
            Visible         =   0   'False
            Width           =   225
         End
         Begin VB.Label Label6 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0E0FF&
            BackStyle       =   0  'Transparent
            Caption         =   "*"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   12
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000C0&
            Height          =   195
            Left            =   210
            TabIndex        =   20
            Top             =   1800
            Width           =   225
         End
         Begin VB.Label Label5 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0E0FF&
            BackStyle       =   0  'Transparent
            Caption         =   "*"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   12
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000C0&
            Height          =   195
            Left            =   210
            TabIndex        =   19
            Top             =   1050
            Width           =   225
         End
         Begin VB.Label lblRequiredMsg 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0E0FF&
            Caption         =   "  Please fill up requireed fields...(*)"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000C0&
            Height          =   315
            Left            =   120
            TabIndex        =   18
            Top             =   300
            Width           =   3645
         End
         Begin VB.Label Label2 
            BackStyle       =   0  'Transparent
            Caption         =   "Select Category:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   345
            Left            =   480
            TabIndex        =   17
            Top             =   750
            Width           =   1665
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Select Item:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   345
            Left            =   5310
            TabIndex        =   16
            Top             =   750
            Width           =   2265
         End
         Begin VB.Label Label4 
            BackStyle       =   0  'Transparent
            Caption         =   "Report Date Selection:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   345
            Left            =   510
            TabIndex        =   15
            Top             =   1470
            Width           =   2325
         End
         Begin VB.Label lblStarting_date 
            BackStyle       =   0  'Transparent
            Caption         =   "Starting Date"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   345
            Left            =   1020
            TabIndex        =   14
            Top             =   2400
            Visible         =   0   'False
            Width           =   3435
         End
         Begin VB.Label lblEnding_date 
            BackStyle       =   0  'Transparent
            Caption         =   "Ending Date"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   345
            Left            =   1020
            TabIndex        =   13
            Top             =   2970
            Visible         =   0   'False
            Width           =   3435
         End
      End
      Begin VB.CommandButton cmdPrint 
         Caption         =   "&Print"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   585
         Left            =   8580
         TabIndex        =   3
         Top             =   8670
         Width           =   2115
      End
      Begin MSComctlLib.ListView lsvDetails 
         Height          =   3405
         Left            =   150
         TabIndex        =   2
         Top             =   5220
         Width           =   10575
         _ExtentX        =   18653
         _ExtentY        =   6006
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "S.O."
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Item Code"
            Object.Width           =   3881
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Item Name"
            Object.Width           =   7232
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Quantity"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Amount"
            Object.Width           =   2646
         EndProperty
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Quick Reports"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000080&
         Height          =   495
         Left            =   180
         TabIndex        =   1
         Top             =   330
         Width           =   2955
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0C0C0&
         X1              =   180
         X2              =   8040
         Y1              =   630
         Y2              =   630
      End
   End
End
Attribute VB_Name = "frmQuickReport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cboCategory_Click()
    If cboCategory.Text = "Item" Then
        Label3.Caption = "Select Item Name"
        Call loadAllItemsToListviewforQuickReport(lsvlist, "item_code")
    Else
        Label3.Caption = "Select Customer Name"
        Call loadAllCustomersToListview(lsvlist)
    End If
    
    txtselection.Text = ""
End Sub

Private Sub cboDateSelection_Click()
 If cboDateSelection.Text = "Today" Then
        Call hideDate_range_control
        activeDate = Format(Date, "m/d/yyyy")
 Else
        Call showDate_range_control
 End If
End Sub

Private Sub cmd_browse_end_date_Click()
    whichDate = STOCK_IN_DATE
    Set activedatelabel = lblEnding_date
    frmCalendar.Show 1
End Sub

Private Sub cmd_browse_start_date_Click()
    whichDate = STOCK_IN_DATE
    Set activedatelabel = lblStarting_date
    frmCalendar.Show 1
End Sub

Private Sub cmdBrowse_Click()
    Call toogleListView(lsvlist)
End Sub

Private Sub cmdLoad_reports_Click()
 If cboCategory.Text = "Customer" And cboDateSelection = "Today" Then
    date_type_selection = True
Else
    date_type_selection = False
 End If
 Call loadSalesOfThisCustomer(lsvlist.SelectedItem.Text, lsvDetails, lblStarting_date, lblEnding_date)
End Sub

Private Sub Form_Load()
activeDate = Format(Now, "yyyy-mm-dd")
cboCategory.AddItem "Item"
cboCategory.AddItem "Customer"

cboDateSelection.AddItem "Today"
cboDateSelection.AddItem "Date Range"

lsvlist.ColumnHeaders(1).width = 0
lsvlist.ColumnHeaders(2).width = 4000
lsvlist.ColumnHeaders(3).width = 0
lsvlist.ColumnHeaders(4).width = 0
lsvlist.ColumnHeaders(5).width = 0

Call loadAllItemsToListviewforQuickReport(lsvlist, "item_code")
End Sub


Private Sub lsvlist_Click()
    txtselection.Text = lsvlist.SelectedItem.SubItems(1)
     Call toogleListView(lsvlist)
    MsgBox (lsvlist.SelectedItem.Text)
End Sub


Sub hideDate_range_control()
    lblStarting_date.Visible = False
    lblEnding_date.Visible = False
    Label7.Visible = False
    Label8.Visible = False
    cmd_browse_end_date.Visible = False
    cmd_browse_start_date.Visible = False
End Sub

Sub showDate_range_control()
    lblStarting_date.Visible = True
    lblEnding_date.Visible = True
     Label7.Visible = True
     Label8.Visible = True
    cmd_browse_end_date.Visible = True
    cmd_browse_start_date.Visible = True
End Sub
