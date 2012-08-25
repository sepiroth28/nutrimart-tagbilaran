VERSION 5.00
Begin VB.Form frmPricerule 
   Caption         =   "Price Rule"
   ClientHeight    =   6810
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8565
   LinkTopic       =   "Form1"
   ScaleHeight     =   6810
   ScaleWidth      =   8565
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000018&
      ForeColor       =   &H80000008&
      Height          =   6915
      Left            =   0
      ScaleHeight     =   6885
      ScaleWidth      =   8535
      TabIndex        =   14
      Top             =   0
      Width           =   8565
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
         Height          =   735
         Left            =   4830
         TabIndex        =   13
         Top             =   5910
         Width           =   1755
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H80000018&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000080&
         Height          =   4965
         Left            =   150
         TabIndex        =   16
         Top             =   840
         Width           =   8235
         Begin VB.CheckBox chkActive 
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            Caption         =   "Active"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   180
            TabIndex        =   25
            Top             =   1950
            Width           =   2115
         End
         Begin VB.TextBox txtValue 
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
            Height          =   360
            Left            =   3930
            TabIndex        =   4
            Top             =   1410
            Width           =   1785
         End
         Begin VB.ComboBox cboRule_type 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Left            =   180
            TabIndex        =   2
            Top             =   1410
            Width           =   1695
         End
         Begin VB.ComboBox cboChargetype 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            ItemData        =   "frmPricerule.frx":0000
            Left            =   1980
            List            =   "frmPricerule.frx":0002
            TabIndex        =   3
            Top             =   1440
            Width           =   1695
         End
         Begin VB.TextBox txtDescription 
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
            Left            =   3930
            TabIndex        =   1
            Top             =   540
            Width           =   3735
         End
         Begin VB.TextBox txtName 
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
            Left            =   180
            TabIndex        =   0
            Top             =   540
            Width           =   3615
         End
         Begin VB.TextBox txtNo_of_use 
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
            Height          =   360
            Left            =   5880
            TabIndex        =   5
            Top             =   1410
            Width           =   1785
         End
         Begin VB.CommandButton cmdbowseselecteditems 
            Caption         =   "..."
            Height          =   492
            Left            =   3120
            TabIndex        =   8
            Top             =   3000
            Width           =   672
         End
         Begin VB.CheckBox chkAllitems 
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            Caption         =   "Apply to all items"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   1410
            TabIndex        =   6
            Top             =   2610
            Width           =   2115
         End
         Begin VB.CheckBox chkSelecteditems 
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            Caption         =   "Selected Items"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   1410
            TabIndex        =   7
            Top             =   3090
            Width           =   1815
         End
         Begin VB.CommandButton cmdbrowseselectedcustomers 
            Caption         =   "..."
            Height          =   495
            Left            =   3600
            TabIndex        =   11
            Top             =   4200
            Width           =   672
         End
         Begin VB.CheckBox chkAllcustomers 
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            Caption         =   "Apply to all customers"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   1440
            TabIndex        =   9
            Top             =   3780
            Width           =   2325
         End
         Begin VB.CheckBox chkselectedcustomers 
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            Caption         =   "Selected Customers"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   1410
            TabIndex        =   10
            Top             =   4320
            Width           =   2205
         End
         Begin VB.Label txtNumberofUse 
            BackStyle       =   0  'Transparent
            Caption         =   "Number of Use:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Left            =   5910
            TabIndex        =   24
            Top             =   1170
            Width           =   1485
         End
         Begin VB.Label Label6 
            BackStyle       =   0  'Transparent
            Caption         =   "Value/Amount:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Left            =   3960
            TabIndex        =   23
            Top             =   1170
            Width           =   1575
         End
         Begin VB.Label Label5 
            BackStyle       =   0  'Transparent
            Caption         =   "Charge type:"
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
            Left            =   2010
            TabIndex        =   22
            Top             =   1170
            Width           =   1305
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
            Height          =   225
            Left            =   180
            TabIndex        =   21
            Top             =   1170
            Width           =   1005
         End
         Begin VB.Label Label2 
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
            Height          =   315
            Left            =   3960
            TabIndex        =   20
            Top             =   300
            Width           =   1365
         End
         Begin VB.Label lblSO 
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
            Height          =   315
            Left            =   180
            TabIndex        =   19
            Top             =   300
            Width           =   705
         End
         Begin VB.Line Line3 
            BorderColor     =   &H00000080&
            X1              =   150
            X2              =   7680
            Y1              =   2400
            Y2              =   2400
         End
         Begin VB.Label Label9 
            BackStyle       =   0  'Transparent
            Caption         =   "Items:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Left            =   150
            TabIndex        =   18
            Top             =   2580
            Width           =   705
         End
         Begin VB.Line Line4 
            BorderColor     =   &H00000080&
            X1              =   150
            X2              =   7680
            Y1              =   3630
            Y2              =   3630
         End
         Begin VB.Label Label10 
            BackStyle       =   0  'Transparent
            Caption         =   "Customers:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Left            =   150
            TabIndex        =   17
            Top             =   3780
            Width           =   1305
         End
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
         Height          =   735
         Left            =   6630
         TabIndex        =   12
         Top             =   5910
         Width           =   1755
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0C0C0&
         X1              =   180
         X2              =   8370
         Y1              =   540
         Y2              =   540
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Price Rule"
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
         TabIndex        =   15
         Top             =   240
         Width           =   2955
      End
   End
End
Attribute VB_Name = "frmPricerule"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim newruletype As New rule_type
Private Sub cboRule_type_Click()
newruletype.load_rule_type_id (cboRule_type)
'MsgBox (newruletype.ruletype_id)
End Sub

Private Sub cmdSave_Click()
Dim newpricerule As New price_rule
    With newpricerule
         .rule_name = txtName.Text
         .description = txtDescription.Text
         .rule_type_id = newruletype.ruletype_id
         .charge_type = cboChargetype.Text
         .value = txtValue.Text
         .number_of_use = txtNo_of_use.Text
         .active = chkActive.value
         .save_price_rule
    End With
End Sub

Private Sub Form_Load()
Call load_rule_type(cboRule_type)
Call load_charge_type(cboChargetype)
End Sub
