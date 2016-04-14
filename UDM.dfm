object DM: TDM
  OldCreateOrder = False
  Height = 436
  Width = 867
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=E:\Banco\CLIENTES_XE5_I.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 184
  end
  object FDQryCliente: TFDQuery
    OnNewRecord = FDQryClienteNewRecord
    CachedUpdates = True
    OnReconcileError = FDQryClienteReconcileError
    Connection = FDConnection
    SQL.Strings = (
      'select CL.*,IE.NOMECIDADE,IE.UF from CLIENTES CL'
      'inner join CIDADE IE on IE.IDCIDADE = CL.COD_CIDADE'
      'where CL.ID =:ID')
    Left = 184
    Top = 56
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
        Value = Null
      end>
    object FDQryClienteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQryClienteCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Origin = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FDQryClienteNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Origin = 'NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 160
    end
    object FDQryClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 160
    end
    object FDQryClienteNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FDQryClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 140
    end
    object FDQryClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '00000\-999;1;_'
      Size = 9
    end
    object FDQryClienteCOMPLEMENTOS: TStringField
      FieldName = 'COMPLEMENTOS'
      Origin = 'COMPLEMENTOS'
      ProviderFlags = [pfInUpdate]
      Size = 160
    end
    object FDQryClienteSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object FDQryClienteNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object FDQryClienteDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FDQryClienteCIVIL: TStringField
      FieldName = 'CIVIL'
      Origin = 'CIVIL'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object FDQryClienteNOMECIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMECIDADE'
      Origin = 'NOMECIDADE'
      ProviderFlags = []
      Size = 140
    end
    object FDQryClienteUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object FDQryClienteFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
      ProviderFlags = [pfInUpdate]
    end
    object FDQryClienteTHEMA: TStringField
      FieldName = 'THEMA'
      Origin = 'THEMA'
      ProviderFlags = [pfInUpdate]
      Size = 140
    end
    object FDQryClienteCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '000000000\-99;1;_'
      Size = 140
    end
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Windows\System32\FBCLIENT.DLL'
    Left = 64
    Top = 56
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 120
  end
  object FDQryConsulta: TFDQuery
    OnReconcileError = FDQryConsultaReconcileError
    Connection = FDConnection
    SQL.Strings = (
      
        'select CL.ID,CL.DATA,CL.NOMECLIENTE,EI.NOMECIDADE,EI.UF,CL.ENDER' +
        'ECO,CL.BAIRRO,CL.CEP'
      'from CLIENTES CL'
      'inner join CIDADE EI on EI.IDCIDADE = CL.COD_CIDADE'
      'where NOMECLIENTE like :nomeclient'
      'order by CL.NOMECLIENTE desc')
    Left = 304
    Top = 56
    ParamData = <
      item
        Name = 'NOMECLIENT'
        DataType = ftString
        ParamType = ptInput
        Size = 160
        Value = Null
      end>
    object FDQryConsultaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object FDQryConsultaDATA: TDateField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object FDQryConsultaNOMECLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      DisplayWidth = 50
      FieldName = 'NOMECLIENTE'
      Origin = 'NOMECLIENTE'
      Required = True
      Size = 160
    end
    object FDQryConsultaNOMECIDADE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cidade onde Mora'
      DisplayWidth = 50
      FieldName = 'NOMECIDADE'
      Origin = 'NOMECIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 140
    end
    object FDQryConsultaUF: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 3
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object FDQryConsultaENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 100
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 160
    end
    object FDQryConsultaBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 90
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 140
    end
    object FDQryConsultaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 9
    end
  end
  object FDQryConsultCidade: TFDQuery
    OnReconcileError = FDQryConsultCidadeReconcileError
    Connection = FDConnection
    SQL.Strings = (
      'select * from CIDADE'
      'where NOMECIDADE like :nomCid'
      'order by NOMECIDADE desc')
    Left = 304
    Top = 128
    ParamData = <
      item
        Name = 'NOMCID'
        DataType = ftString
        ParamType = ptInput
        Size = 140
        Value = Null
      end>
    object FDQryConsultCidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object FDQryConsultCidadeNOMECIDADE: TStringField
      DisplayLabel = 'Nome da Cidade'
      DisplayWidth = 50
      FieldName = 'NOMECIDADE'
      Origin = 'NOMECIDADE'
      Size = 140
    end
    object FDQryConsultCidadeUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
  end
end
