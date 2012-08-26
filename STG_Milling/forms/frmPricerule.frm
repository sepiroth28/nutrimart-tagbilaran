VERSION 5.00
Begin VB.Form frmPricerule 
   Caption         =   "Price Rule"
   ClientHeight    =   5565
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8220
   LinkTopic       =   "Form1"
   ScaleHeight     =   5565
   ScaleWidth      =   8220
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000018&
      ForeColor       =   &H80000008&
      Height          =   6915
      Left            =   0
      ScaleHeight     =   6885
      ScaleWidth      =   8535
      TabIndex        =   10
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
         Left            =   4470
         TabIndex        =   9
         Top             =   4680
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
         Height          =   3795
         Left            =   150
         TabIndex        =   12
         Top             =   840
         Width           =   7905
         Begin VB.CommandButton cmdGenerateCode 
            Appearance      =   0  'Flat
            Caption         =   "generate code"
            Height          =   405
            Left            =   6360
            TabIndex        =   25
            Top             =   2070
            Width           =   1365
         End
         Begin VB.TextBox txtCouponCode 
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
            Left            =   3900
            TabIndex        =   23
            Top             =   2100
            Width           =   2415
         End
         Begin VB.CheckBox chkAutoApply 
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            Caption         =   "Auto Apply rule"
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
            Left            =   1980
            TabIndex        =   22
            Top             =   1980
            Width           =   1845
         End
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
            TabIndex        =   21
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
            Left            =   150
            TabIndex        =   6
            Top             =   2880
            Width           =   672
         End
         Begin VB.CommandButton cmdbrowseselectedcustomers 
            Caption         =   "..."
            Height          =   495
            Left            =   3900
            TabIndex        =   7
            Top             =   2850
            Width           =   672
         End
         Begin VB.Label Label4 
            BackStyle       =   0  'Transparent
            Caption         =   "Coupon code"
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
            Left            =   3930
            TabIndex        =   24
            Top             =   1860
            Width           =   1575
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
            TabIndex        =   20
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
            TabIndex        =   19
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
            TabIndex        =   18
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
            TabIndex        =   17
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
            TabIndex        =   16
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
            TabIndex        =   15
            Top             =   300
            Width           =   705
         End
         Begin VB.Line Line3 
            BorderColor     =   &H00000080&
            X1              =   150
            X2              =   7680
            Y1              =   2520
            Y2              =   2520
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
            TabIndex        =   14
            Top             =   2580
            Width           =   705
         End
         Begin VB.Line Line4 
            BorderColor     =   &H00000080&
            X1              =   150
            X2              =   7680
            Y1              =   3510
            Y2              =   3510
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
            Left            =   3900
            TabIndex        =   13
            Top             =   2580
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
         Left            =   6300
         TabIndex        =   8
         Top             =   4680
         Width           =   1755
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0C0C0&
         X1              =   180
         X2              =   8040
         Y1              =   540
         Y2              =   570
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
         TabIndex        =   11
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
Public newpricerule As New price_rule

Private Sub cboRule_type_Click()
newruletype.load_rule_type_id (cboRule_type)
'MsgBox (newruletype.ruletype_id)
End Sub


Private Sub cmdbowseselecteditems_Click()
active_affected_pricerule_list = PRICERULE_ACTIVE_ITEM
frmPricerule_affected.Show 1
End Sub

Private Sub cmdbrowseselectedcustomers_Click()
active_affected_pricerule_list = PRICERULE_ACTIVE_CUSTOMER
frmPricerule_affected.Show 1
End Sub

Private Sub cmdSave_Click()

If edit_price_rule = True Then
    ToEditPriceRule.update_price_rule
Else
    With newpricerule
         .rule_name = txtName.Text
         .description = txtDescription.Text
         .rule_type_id = newruletype.ruletype_id
         .charge_type = cboChargetype.Text
         .value = txtValue.Text
         .use_coupon_code = txtCouponCode.Text
         .number_of_use = txtNo_of_use.Text
         .active = chkActive.value
         .auto_apply = chkAutoApply.value
         .save_price_rule
         MsgBox "Successfully saved price rule...", vbOKOnly, "price rule saved"
    End With
End If
End Sub

Private Sub Form_Load()
If edit_price_rule = True Then
    txtName.Text = ToEditPriceRule.rule_name
    txtDescription.Text = ToEditPriceRule.description
    cboRule_type.Text = ToEditPriceRule.rule_type_name
    cboChargetype.Text = ToEditPriceRule.charge_type
    txtValue.Text = ToEditPriceRule.value
    txtNo_of_use.Text = ToEditPriceRule.number_of_use
    chkActive.value = ToEditPriceRule.active
    chkAutoApply.value = ToEditPriceRule.auto_apply
Else
    Call load_rule_type(cboRule_type)
    Call load_charge_type(cboChargetype)
End If
End Sub

