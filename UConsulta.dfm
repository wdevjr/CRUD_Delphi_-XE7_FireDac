object FrmConsulta: TFrmConsulta
  Left = 0
  Top = 0
  Caption = 'Consulta'
  ClientHeight = 313
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 73
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object EditProc: TEdit
      Left = 160
      Top = 27
      Width = 449
      Height = 21
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EditProcKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 252
    Width = 850
    Height = 61
    Align = alBottom
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 736
      Top = 16
      Width = 75
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 850
    Height = 179
    Align = alClient
    Color = 13041663
    DataSource = DtsrcConsulta
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DtsrcConsulta: TDataSource
    DataSet = DM.FDQryConsulta
    Left = 728
    Top = 24
  end
end