VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmManagePriceRule 
   Caption         =   "Price Rule"
   ClientHeight    =   8385
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   12690
   LinkTopic       =   "Form1"
   ScaleHeight     =   8385
   ScaleWidth      =   12690
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Height          =   8445
      Left            =   30
      ScaleHeight     =   8385
      ScaleWidth      =   12585
      TabIndex        =   0
      Top             =   0
      Width           =   12645
      Begin MSComctlLib.ListView lsvPriceRuleList 
         Height          =   6195
         Left            =   270
         TabIndex        =   5
         Top             =   1920
         Width           =   12165
         _ExtentX        =   21458
         _ExtentY        =   10927
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         NumItems        =   0
      End
      Begin VB.TextBox txtSearchPriceRuleName 
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
         Height          =   435
         Left            =   240
         TabIndex        =   2
         Top             =   1410
         Width           =   4935
      End
      Begin VB.CommandButton cmdAddNewPriceRule 
         Caption         =   "ADD NEW PRICE RULE"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   675
         Left            =   9720
         TabIndex        =   1
         Top             =   1170
         Width           =   2685
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Price Rule"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   14.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   240
         TabIndex        =   4
         Top             =   330
         Width           =   2115
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0C0C0&
         X1              =   240
         X2              =   12300
         Y1              =   750
         Y2              =   750
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Search Price Rule"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   240
         TabIndex        =   3
         Top             =   1110
         Visible         =   0   'False
         Width           =   2115
      End
   End
End
Attribute VB_Name = "frmManagePriceRule"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAddNewPriceRule_Click()
    edit_price_rule = False
    frmPricerule.Show 1
End Sub

Private Sub Form_Load()
Call load_price_rule_list
End Sub


Sub load_price_rule_list()
Dim sql As String
Dim rs As New ADODB.Recordset
Dim list As ListItem

sql = "SELECT * FROM price_rule order by name"
Set rs = db.execute(sql)
lsvPriceRuleList.ListItems.Clear
On Error Resume Next
If rs.RecordCount > 0 Then
    Do Until rs.EOF
        Set list = lsvPriceRuleList.ListItems.Add(, , rs.Fields(0).value)
        list.SubItems(1) = rs.Fields("rule_type_id").value
        list.SubItems(2) = rs.Fields("name").value
        list.SubItems(3) = rs.Fields("description").value
        list.SubItems(4) = rs.Fields("charge_type").value
        list.SubItems(5) = rs.Fields("value").value
        list.SubItems(6) = rs.Fields("created_at").value
        list.SubItems(7) = rs.Fields("use_coupon_code").value
        list.SubItems(8) = rs.Fields("valid_until").value
        list.SubItems(9) = rs.Fields("number_of_use").value
        list.SubItems(10) = rs.Fields("active").value
        list.SubItems(11) = rs.Fields("auto_apply").value
        
    rs.MoveNext
    Loop
End If
End Sub


Private Sub lsvPriceRuleList_DblClick()
        edit_price_rule = True
        ToEditPriceRule.load_price_rule (lsvPriceRuleList.SelectedItem.Text)
        frmPricerule.Show 1
End Sub
