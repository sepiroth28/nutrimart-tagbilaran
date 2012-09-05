VERSION 5.00
Begin VB.Form frmStoreSettings 
   Caption         =   "Store location"
   ClientHeight    =   2715
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   5055
   LinkTopic       =   "Form1"
   ScaleHeight     =   2715
   ScaleWidth      =   5055
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000018&
      ForeColor       =   &H80000008&
      Height          =   2805
      Left            =   0
      ScaleHeight     =   2775
      ScaleWidth      =   5085
      TabIndex        =   0
      Top             =   -30
      Width           =   5115
      Begin VB.TextBox txtStorename 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   150
         TabIndex        =   5
         Top             =   660
         Visible         =   0   'False
         Width           =   3585
      End
      Begin VB.CommandButton cmdSave 
         BackColor       =   &H00FFC0C0&
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
         Height          =   375
         Left            =   3750
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   660
         Visible         =   0   'False
         Width           =   1185
      End
      Begin VB.CommandButton cmdActivate 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Activate"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3780
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   660
         Width           =   1185
      End
      Begin VB.ComboBox cboStore 
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
         Left            =   150
         TabIndex        =   1
         Top             =   690
         Width           =   3645
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Store Name:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   150
         TabIndex        =   6
         Top             =   360
         Visible         =   0   'False
         Width           =   2505
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Select Store Location"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   150
         TabIndex        =   3
         Top             =   420
         Width           =   2505
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuAddnew 
         Caption         =   "Add new"
      End
      Begin VB.Menu mnuRefresh 
         Caption         =   "Refresh"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "Delete"
      End
   End
End
Attribute VB_Name = "frmStoreSettings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub cmdActivate_Click()
Dim sql As String
If cmdActivate.Caption = "Delete" Then
    sql = "delete from store_settings where store_name='" & cboStore.Text & "'"
    db.execute (sql)
    MsgBox ("Selected Store Deleted")
    Call ref
Else
    sql = "update store_settings set activated=0"
    db.execute (sql)
    sql = "update store_settings set activated=1 where store_name='" & cboStore.Text & "'"
    db.execute (sql)
End If
End Sub

Private Sub cmdSave_Click()
Dim sql As String
sql = "INSERT INTO store_settings(store_name,activated) values('" & txtStorename.Text & "'," & 0 & ")"
db.execute (sql)
MsgBox ("New Store location Added")
Call ref
End Sub

Private Sub Form_Load()
Call reload_data
End Sub
Sub addnew()
With Me
    .cboStore.Visible = False
    .cmdActivate.Visible = False
    .Label1.Visible = False
    .Label2.Visible = True
    .txtStorename.Visible = True
    .cmdSave.Visible = True
End With
End Sub

Private Sub mnuAddnew_Click()
Call addnew
End Sub

Sub ref()
With Me
    .cboStore.Visible = True
    .cmdActivate.Caption = "Activate"
    .cmdActivate.Visible = True
    .Label1.Caption = "Select Store Location"
    .Label1.Visible = True
    .Label2.Visible = False
    .txtStorename.Visible = False
    .cmdSave.Visible = False
End With
    Call reload_data
End Sub

Sub delete_store()
With Me
    .cboStore.Visible = True
    .cmdActivate.Caption = "Delete"
    .cmdActivate.Visible = True
    .Label1.Caption = "Select Store to Delete"
    .Label1.Visible = True
    .Label2.Visible = False
    .txtStorename.Visible = False
    .cmdSave.Visible = False
End With
End Sub

Private Sub mnuDelete_Click()
    Call delete_store
End Sub

Private Sub mnuRefresh_Click()
    Call ref
End Sub

Sub reload_data()
Dim sql As String
Dim rs As New ADODB.Recordset
sql = "select * from store_settings"
Set rs = db.execute(sql)
cboStore.Clear
Do Until rs.EOF
cboStore.AddItem rs.Fields("store_name").value
rs.MoveNext
Loop
End Sub
