object MngForm: TMngForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Manager Form'
  ClientHeight = 156
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 92
    Top = 42
    Width = 65
    Height = 25
    Caption = 'Forms :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FormCount_Lbl: TLabel
    Left = 170
    Top = 42
    Width = 11
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 92
    Top = 115
    Width = 48
    Height = 25
    Caption = 'CPU :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CpuCount_Lbl: TLabel
    Left = 170
    Top = 115
    Width = 11
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Add_Btn: TButton
    Left = 4
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 0
    OnClick = Add_BtnClick
  end
  object Remove_Btn: TButton
    Left = 4
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 1
  end
  object Mode_Bx: TComboBox
    Left = 92
    Top = 13
    Width = 108
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'SINGLE'
    Items.Strings = (
      'SINGLE'
      'THREAD'
      'TASK')
  end
  object Button1: TButton
    Left = 8
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Load CPU'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Free CPU'
    TabOrder = 4
    OnClick = Button2Click
  end
end
