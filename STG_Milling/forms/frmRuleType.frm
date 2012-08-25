VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRuleType 
   Caption         =   "Rule type"
   ClientHeight    =   7275
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4785
   LinkTopic       =   "Form1"
   ScaleHeight     =   7275
   ScaleWidth      =   4785
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000018&
      Height          =   7575
      Left            =   0
      ScaleHeight     =   7515
      ScaleWidth      =   4725
      TabIndex        =   0
      Top             =   0
      Width           =   4785
      Begin VB.CommandButton cmdCancel 
         Caption         =   "Cancel"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   600
         TabIndex        =   6
         Top             =   6300
         Width           =   1665
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "Save"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2340
         TabIndex        =   5
         Top             =   6300
         Width           =   1665
      End
      Begin VB.TextBox txtRuleDescription 
         Alignment       =   2  'Center
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
         Left            =   540
         TabIndex        =   4
         Top             =   5550
         Width           =   3555
      End
      Begin VB.TextBox txtRuleName 
         Alignment       =   2  'Center
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
         Left            =   540
         TabIndex        =   2
         Top             =   4710
         Width           =   3555
      End
      Begin MSComctlLib.ListView lsvRuletype 
         Height          =   3465
         Left            =   210
         TabIndex        =   8
         Top             =   840
         Width           =   4335
         _ExtentX        =   7646
         _ExtentY        =   6112
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
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "id"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Name"
            Object.Width           =   4401
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   2
            Text            =   "Description"
            Object.Width           =   3246
         EndProperty
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0C0C0&
         X1              =   360
         X2              =   4440
         Y1              =   690
         Y2              =   690
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Rule type:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000080&
         Height          =   255
         Left            =   390
         TabIndex        =   7
         Top             =   420
         Width           =   1335
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Description:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   570
         TabIndex        =   3
         Top             =   5280
         Width           =   1305
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Name:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   570
         TabIndex        =   1
         Top             =   4440
         Width           =   735
      End
   End
End
Attribute VB_Name = "frmRuleType"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdSave_Click()
Dim new_rule_type As New rule_type
    With new_rule_type
        .rule_type_name = txtRuleName.Text
        .description = txtRuleDescription.Text
        .save_rule_type
    End With
End Sub

Private Sub Form_Load()
Call load_rule_type
End Sub

Sub load_rule_type()
Dim sql As String
Dim rs As New ADODB.Recordset
Dim list As ListItem

sql = "SELECT * FROM rule_type order by name"
Set rs = db.execute(sql)
lsvRuletype.ListItems.Clear
On Error Resume Next
If rs.RecordCount > 0 Then
    Do Until rs.EOF
        Set list = lsvRuletype.ListItems.Add(, , rs.Fields(0).value)
        list.SubItems(1) = rs.Fields("name").value
        list.SubItems(2) = rs.Fields("description").value
    rs.MoveNext
    Loop
End If
End Sub
