unit UPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ImgList, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtDlgs, jpeg, Clipbrd, Vcl.Themes;

type
  TFrmPrincCadastro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBText1: TDBText;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEditNome: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEditCPF: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    DBEditBairro: TDBEdit;
    Label7: TLabel;
    DBEditRua: TDBEdit;
    Label5: TLabel;
    DBEditNumero: TDBEdit;
    Label6: TLabel;
    DBEditCEP: TDBEdit;
    Label10: TLabel;
    DBMemoComplemento: TDBMemo;
    DBImage1: TDBImage;
    BitBtn1: TBitBtn;
    DBEdit1CodCidade: TDBEdit;
    Label11: TLabel;
    BitBtn2: TBitBtn;
    DBTextCidade: TDBText;
    Label12: TLabel;
    DBTextUF: TDBText;
    Label13: TLabel;
    Label15: TLabel;
    inserir: TBitBtn;
    gravar: TBitBtn;
    editar: TBitBtn;
    excluir: TBitBtn;
    cancelar: TBitBtn;
    trazerj: TBitBtn;
    aplicarthema: TSpeedButton;
    BitBtn9: TBitBtn;
    Dtsrc: TDataSource;
    DBComboBoxCivil: TDBComboBox;
    CapationData: TLabel;
    DBText2: TDBText;
    OpenPictureDialog: TOpenPictureDialog;
    DBEditNascimento: TDBEdit;
    DBEditSexo: TDBComboBox;
    DBText3: TDBText;

    procedure BitBtn9Click(Sender: TObject);
    procedure aplicarthemaClick(Sender: TObject);
    procedure inserirClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DtsrcStateChange(Sender: TObject);
    procedure trazerjClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEditNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditNascimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditSexoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBoxCivilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditNascimentoChange(Sender: TObject);
    procedure DBComboBoxCivilChange(Sender: TObject);
    procedure DBEditCPFChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincCadastro: TFrmPrincCadastro;

implementation

{$R *.dfm}

uses UDM, UThema, UConsulta, UConsultaCidade;

procedure TFrmPrincCadastro.BitBtn1Click(Sender: TObject);
var
  jpg: TJPEGImage;
begin
  if (OpenPictureDialog.Execute) then
  begin
    if ExtractFileExt(OpenPictureDialog.FileName) = '.bmp' then
    begin
      if (Dtsrc.DataSet.State = dsBrowse) OR (Dtsrc.DataSet.Active) then
      begin
        Dtsrc.DataSet.Edit;
        DM.FDQryClienteFOTO.LoadFromFile(OpenPictureDialog.FileName);
      end;
    end
    else
    begin
      jpg := TJPEGImage.Create;
      jpg.LoadFromFile(OpenPictureDialog.FileName);
      clipboard.Assign(jpg);
      DBImage1.PasteFromClipboard;
      jpg.Free;
    end;
  end;

end;

procedure TFrmPrincCadastro.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultaCidades, FrmConsultaCidades);
  try
    if FrmConsultaCidades.ShowModal = mrOk then
    begin
      DM.FDQryCliente.Edit;
      DM.FDQryClienteCOD_CIDADE.AsInteger :=
        DM.FDQryConsultCidadeIDCIDADE.AsInteger;
      DM.FDQryClienteNOMECIDADE.AsString :=
        DM.FDQryConsultCidadeNOMECIDADE.AsString;
      DM.FDQryClienteUF.AsString := DM.FDQryConsultCidadeUF.AsString;
    end;
  finally
    DM.FDQryConsultCidade.close;
    FrmConsultaCidades.Free;

  end;
end;

procedure TFrmPrincCadastro.inserirClick(Sender: TObject);
var
  thema: TStyleManager;
begin
  // if Dtsrc.DataSet.State = dsInsert then
  DM.FDQryCliente.Open;
  Dtsrc.DataSet.Insert;
  Dtsrc.DataSet.Append;
  thema := TStyleManager.Create();
  thema.SetStyle('Windows');

end;

procedure TFrmPrincCadastro.trazerjClick(Sender: TObject);
var
  thema: TStyleManager;
begin
  Application.CreateForm(TFrmConsulta, FrmConsulta);
  try
    if FrmConsulta.ShowModal = mrOk then
    begin
      DM.FDQryCliente.close;
      DM.FDQryCliente.Params[0].AsInteger := DM.FDQryConsultaID.AsInteger;
      DM.FDQryCliente.Open;
    end;
  finally
    DM.FDQryConsulta.close;
    FrmConsulta.Free;
    DBText3.Visible := true;
    thema := TStyleManager.Create();
    thema.SetStyle(DM.FDQryClienteTHEMA.AsString);
  end;
end;

procedure TFrmPrincCadastro.gravarClick(Sender: TObject);
begin
  if (DBEditNome.Text = '') then
  begin
    MessageDlg('Insira o nome do cliente ! ', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditNascimento.Text = '  /  /    ') then
  begin
    MessageDlg('Insira a Data de Nascimento !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditSexo.Text = '') then
  begin
    MessageDlg('Insira o Sexo do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBComboBoxCivil.Text = '') then
  begin
    MessageDlg('Insira o Estado Civil do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditCPF.Text = '         -  ') then
  begin
    MessageDlg('Insira o CPF do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditRua.Text = '') then
  begin
    MessageDlg('Insira a Rua ... !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditNumero.Text = '') then
  begin
    MessageDlg('Insira o Numero do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditCEP.Text = '     -   ') then
  begin
    MessageDlg('Insira o CEP do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditBairro.Text = '') then
  begin
    MessageDlg('Insira o Bairro do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if ((DBEdit1CodCidade.Text) = '') then
  begin
    MessageDlg('Insira a Cidade Correspondente do Cliente !', mtConfirmation,
      [mbOk], 0);
  end
  else if (DM.FDQryClienteTHEMA.AsString = '') then
  begin
    DM.FDQryClienteTHEMA.AsString := 'Windows';
  end
  else
  begin
    Dtsrc.DataSet.Post;
    (Dtsrc.DataSet as TFDQuery).ApplyUpdates(0);
    (Dtsrc.DataSet as TFDQuery).CommitUpdates;
  end;
end;

procedure TFrmPrincCadastro.BitBtn9Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincCadastro.cancelarClick(Sender: TObject);
begin
  Dtsrc.DataSet.Cancel;
end;

procedure TFrmPrincCadastro.DBComboBoxCivilChange(Sender: TObject);
begin
  DBText3.Visible := true;
end;

procedure TFrmPrincCadastro.DBComboBoxCivilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) or (Key = VK_RETURN) then
  begin
    DBText3.Visible := true;
  end;
end;

procedure TFrmPrincCadastro.DBEditCPFChange(Sender: TObject);
begin
  DBText3.Visible := true;
end;

procedure TFrmPrincCadastro.DBEditNascimentoChange(Sender: TObject);
begin

  DBText3.Visible := true;

end;

procedure TFrmPrincCadastro.DBEditNascimentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) or (Key = VK_RETURN) then
  begin
    DBText3.Visible := true;
  end;
end;

procedure TFrmPrincCadastro.DBEditNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) or (Key = VK_RETURN) then
  begin
    DBText3.Visible := true;
  end;
end;

procedure TFrmPrincCadastro.DBEditSexoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) or (Key = VK_RETURN) then
  begin
    DBText3.Visible := true;
  end;
end;

procedure TFrmPrincCadastro.DtsrcStateChange(Sender: TObject);
begin
  with Dtsrc.DataSet do
  begin
    excluir.Enabled := not IsEmpty;
    inserir.Enabled := Dtsrc.State in [dsBrowse, dsInactive];
    gravar.Enabled := Dtsrc.State in [dsInsert];
    editar.Enabled := Dtsrc.State in [dsEdit];
    cancelar.Enabled := Dtsrc.State in [dsInsert, dsEdit];
    excluir.Enabled := Dtsrc.State in [dsBrowse];
    trazerj.Enabled := Dtsrc.State in [dsBrowse];
  end;
end;

procedure TFrmPrincCadastro.editarClick(Sender: TObject);
begin
  if (DBEditNome.Text = '') then
  begin
    MessageDlg('Insira o nome do cliente ! ', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditNascimento.Text = '') then
  begin
    MessageDlg('Insira a Data de Nascimento !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditSexo.Text = '') then
  begin
    MessageDlg('Insira o Sexo do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBComboBoxCivil.Text = '') then
  begin
    MessageDlg('Insira o Estado Civil do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditCPF.Text = '') then
  begin
    MessageDlg('Insira o CPF do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditRua.Text = '') then
  begin
    MessageDlg('Insira a Rua ... !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditNumero.Text = '') then
  begin
    MessageDlg('Insira o Numero do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditCEP.Text = '') then
  begin
    MessageDlg('Insira o CEP do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if (DBEditBairro.Text = '') then
  begin
    MessageDlg('Insira o Bairro do Cliente !', mtConfirmation, [mbOk], 0);
  end
  else if ((DBEdit1CodCidade.Text) = '') then
  begin
    MessageDlg('Insira a Cidade Correspondente do Cliente !', mtConfirmation,
      [mbOk], 0);
  end
  else if (DM.FDQryClienteTHEMA.AsString = '') then
  begin
    DM.FDQryClienteTHEMA.AsString := 'Windows';
  end
  else
  begin
    Dtsrc.DataSet.Post;
    (Dtsrc.DataSet as TFDQuery).ApplyUpdates(0);
    (Dtsrc.DataSet as TFDQuery).CommitUpdates;
  end;
end;

procedure TFrmPrincCadastro.excluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja excluir esse Cliente ?', mtWarning, [mbYes, mbNo], 0))
    = mrYes then
  begin
    Dtsrc.DataSet.Delete;
    (Dtsrc.DataSet as TFDQuery).ApplyUpdates(0);
    (Dtsrc.DataSet as TFDQuery).CommitUpdates;
  end
  else
    Abort;

end;

procedure TFrmPrincCadastro.FormShow(Sender: TObject);
begin
  Dtsrc.DataSet.Open;
end;

procedure TFrmPrincCadastro.aplicarthemaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmThemas, FrmThemas);
  try
    FrmThemas.ShowModal();
  finally
    FrmThemas.Free;
  end;

end;

end.
