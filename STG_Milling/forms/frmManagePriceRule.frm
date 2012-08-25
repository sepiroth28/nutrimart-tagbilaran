VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmManagePriceRule 
   Caption         =   "Price Rule"
   ClientHeight    =   8385
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8145
   LinkTopic       =   "Form1"
   ScaleHeight     =   8385
   ScaleWidth      =   8145
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Height          =   8445
      Left            =   30
      ScaleHeight     =   8385
      ScaleWidth      =   8115
      TabIndex        =   0
      Top             =   0
      Width           =   8175
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
         Width           =   3945
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
         Left            =   5310
         TabIndex        =   1
         Top             =   1170
         Width           =   2535
      End
      Begin MSComctlLib.ListView lsvPriceRuleList 
         Height          =   6255
         Left            =   240
         TabIndex        =   3
         Top             =   1890
         Width           =   7605
         _ExtentX        =   13414
         _ExtentY        =   11033
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
         NumItems        =   1
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Width           =   2540
         EndProperty
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
         TabIndex        =   5
         Top             =   330
         Width           =   2115
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0C0C0&
         X1              =   240
         X2              =   7740
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
         TabIndex        =   4
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
    frmPricerule.Show 1
End Sub

Private Sub Form_Load()

End Sub
