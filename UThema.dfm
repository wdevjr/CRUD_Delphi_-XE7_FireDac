object FrmThemas: TFrmThemas
  Left = 0
  Top = 0
  Caption = 'Galeria de Themas'
  ClientHeight = 426
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object aplicar: TSpeedButton
    Left = 238
    Top = 377
    Width = 105
    Height = 41
    Caption = 'Aplicar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = aplicarClick
  end
  object cancela: TSpeedButton
    Left = 127
    Top = 377
    Width = 105
    Height = 41
    Caption = 'Cancela'
    OnClick = cancelaClick
  end
  object SpeedButton1: TSpeedButton
    Left = 514
    Top = 376
    Width = 113
    Height = 41
    Caption = 'Fechar'
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 96
    Top = 8
    Width = 159
    Height = 19
    Caption = 'Themas do Sistema'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 480
    Top = 8
    Width = 49
    Height = 19
    Caption = 'Visual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gravarThema: TSpeedButton
    Left = 16
    Top = 377
    Width = 105
    Height = 41
    Caption = 'Gravar'
    Enabled = False
    OnClick = gravarThemaClick
  end
  object ListBox1: TListBox
    Left = 8
    Top = 33
    Width = 329
    Height = 321
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      'Amakrits'
      'Amethyst Kamri'
      'Aqua Graphite'
      'Aqua Light Slate'
      'Auric'
      'Carbon'
      'Charcoal Dark Slate'
      'Cobalt XEMedia'
      'Cyan Dusk'
      'Cyan Night'
      'Emerald Light Slate'
      'Golden Graphite'
      'Iceberg Classico'
      'Lavender Classico'
      'Light'
      'Luna'
      'Obsidian'
      'Ruby Graphite'
      'Sapphire Kamri'
      'Silver'
      'Slate Classico'
      'Smokey Quartz Kamri'
      'Turquoise Gray'
      'Windows')
    ParentFont = False
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object Panel1: TPanel
    Left = 352
    Top = 33
    Width = 275
    Height = 320
    TabOrder = 1
  end
end
