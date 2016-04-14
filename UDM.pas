unit UDM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ImgList, Data.DB,
  System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.FBDef;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDQryCliente: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQryClienteID: TIntegerField;
    FDQryClienteCOD_CIDADE: TIntegerField;
    FDQryClienteNOMECLIENTE: TStringField;
    FDQryClienteENDERECO: TStringField;
    FDQryClienteNUMERO: TIntegerField;
    FDQryClienteBAIRRO: TStringField;
    FDQryClienteCEP: TStringField;
    FDQryClienteCOMPLEMENTOS: TStringField;
    FDQryClienteSEXO: TStringField;
    FDQryClienteNASCIMENTO: TDateField;
    FDQryClienteDATA: TDateField;
    FDQryClienteCIVIL: TStringField;
    FDQryClienteNOMECIDADE: TStringField;
    FDQryClienteUF: TStringField;
    FDQryClienteFOTO: TBlobField;
    FDQryClienteTHEMA: TStringField;
    FDQryClienteCPF: TStringField;
    FDQryConsulta: TFDQuery;
    FDQryConsultaID: TIntegerField;
    FDQryConsultaDATA: TDateField;
    FDQryConsultaNOMECLIENTE: TStringField;
    FDQryConsultaNOMECIDADE: TStringField;
    FDQryConsultaUF: TStringField;
    FDQryConsultaENDERECO: TStringField;
    FDQryConsultaBAIRRO: TStringField;
    FDQryConsultaCEP: TStringField;
    FDQryConsultCidade: TFDQuery;
    FDQryConsultCidadeIDCIDADE: TIntegerField;
    FDQryConsultCidadeNOMECIDADE: TStringField;
    FDQryConsultCidadeUF: TStringField;
    procedure FDQryClienteNewRecord(DataSet: TDataSet);
    procedure FDQryClienteReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure FDQryConsultaReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure FDQryConsultCidadeReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
  private

  public
    procedure Incrementa(Nome_Tabela: String; Chave_Primaria: TField);
  end;

var
  DM: TDM;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

uses UPrinc;

procedure TDM.FDQryClienteNewRecord(DataSet: TDataSet);
begin
  if (FDQryCliente.State = dsInsert) then
    Incrementa('CLIENTES', FDQryClienteID);
  FDQryClienteDATA.Value := Date;
end;

procedure TDM.FDQryClienteReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.FDQryConsultaReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.FDQryConsultCidadeReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  MessageDlg('Erro SQL, a mensagem nativa do banco é : ' + E.Message,
    MtInformation, [mbOk], 0);
end;

procedure TDM.Incrementa(Nome_Tabela: String; Chave_Primaria: TField);
var
  Qry: TFDQuery;
begin
  if Chave_Primaria.DataSet.State <> dsInsert then
    exit; // termina a execução caso não esteja em modo de inserção
  Qry := TFDQuery.Create(nil); // cria uma instância do objeto
  try
    Qry.Connection := FDConnection; // componente de conexão
    Qry.SQL.Add('SELECT MAX(' + Chave_Primaria.FieldName + ') FROM ' +
      Nome_Tabela);
    Qry.Open;
    if Qry.Fields[0].IsNull then // se a tabela está vazia retornará nulo
      Chave_Primaria.AsInteger := 402585
      // então este será o primeiro registro
    else
      Chave_Primaria.AsInteger := Qry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(Qry); // tira o objeto da memória
  end;
end;

end.
