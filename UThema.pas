unit UThema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Themes, Data.DB;

type
  TFrmThemas = class(TForm)
    ListBox1: TListBox;
    aplicar: TSpeedButton;
    cancela: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    gravarThema: TSpeedButton;
    procedure ListBox1Click(Sender: TObject);
    procedure aplicarClick(Sender: TObject);
    procedure cancelaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gravarThemaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmThemas: TFrmThemas;

implementation

{$R *.dfm}

uses UDM, UPrinc;

procedure TFrmThemas.aplicarClick(Sender: TObject);
var
  thema: TStyleManager;
begin
  // ok.Enabled:=true;
  cancela.Enabled := true;
  gravarThema.Enabled := true;
  thema := TStyleManager.Create();
  thema.SetStyle(ListBox1.Items[ListBox1.ItemIndex]);
  if (FrmPrincCadastro.Dtsrc.DataSet.State = dsEdit) or
    (FrmPrincCadastro.Dtsrc.DataSet.State = dsInsert) or
    (FrmPrincCadastro.Dtsrc.DataSet.State = dsBrowse) then
  begin
    DM.FDQryCliente.Edit;
    DM.FDQryClienteTHEMA.AsString := ListBox1.Items[ListBox1.ItemIndex];
  end;
end;

procedure TFrmThemas.cancelaClick(Sender: TObject);
var
  thema: TStyleManager;
begin
  ListBox1.ItemIndex := -1;
  cancela.Enabled := false;
  gravarThema.Enabled := false;
  // ok.Enabled:=false;
  aplicar.Enabled := false;
  // thema:=TStyleManager.Create();
  // thema.SetStyle('Windows');
  // DM.FDQryClienteTHEMA.AsString:='Windows';
  // DM.FDQryCliente.Post;
  // DM.FDQryCliente.ApplyUpdates(0);
  // DM.FDQryCliente.CommitUpdates;
end;

procedure TFrmThemas.FormShow(Sender: TObject);
begin
  // ok.Enabled:=False;
  cancela.Enabled := false;
  aplicar.Enabled := false;

  with (FrmPrincCadastro.Dtsrc.DataSet) do
  begin
    // gravarThema.Enabled:=not IsEmpty;
    gravarThema.Enabled := FrmPrincCadastro.Dtsrc.State in [dsInsert, dsEdit];

  end;
end;

procedure TFrmThemas.ListBox1Click(Sender: TObject);
begin
  aplicar.Enabled := true;
  // cancela.Enabled:=true;
  // gravarThema.Enabled:=true;

  // ok.Enabled:=False;
end;

procedure TFrmThemas.okClick(Sender: TObject);
begin
  cancela.Enabled := false;
  aplicar.Enabled := false;
end;

procedure TFrmThemas.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmThemas.gravarThemaClick(Sender: TObject);
begin
  if (FrmPrincCadastro.Dtsrc.DataSet.State = dsEdit) or
    (FrmPrincCadastro.Dtsrc.DataSet.State = dsInsert) then
  begin
    if (FrmPrincCadastro.DBEditNome.Text = '') then
    begin
      MessageDlg('Insira o nome do cliente ! ', mtConfirmation, [mbOk], 0);
    end
    else if (FrmPrincCadastro.DBEditNascimento.Text = '') then
    begin
      MessageDlg('Insira a Data de Nascimento !', mtConfirmation, [mbOk], 0);
    end
    else if (FrmPrincCadastro.DBEditSexo.Text = '') then
    begin
      MessageDlg('Insira o Sexo do Cliente !', mtConfirmation, [mbOk], 0);
    end
    else if (FrmPrincCadastro.DBComboBoxCivil.Text = '') then
    begin
      MessageDlg('Insira o Estado Civil do Cliente !', mtConfirmation,
        [mbOk], 0);
    end
    else if (FrmPrincCadastro.DBEditCPF.Text = '') then
    begin
      MessageDlg('Insira o CPF do Cliente !', mtConfirmation, [mbOk], 0);
    end
    else if (FrmPrincCadastro.DBEditRua.Text = '') then
    begin
      MessageDlg('Insira a Rua ... !', mtConfirmation, [mbOk], 0);
    end
    else if (FrmPrincCadastro.DBEditNumero.Text = '') then
    begin
      MessageDlg('Insira o Numero do Cliente !', mtConfirmation, [mbOk], 0);
    end
    else if (FrmPrincCadastro.DBEditCEP.Text = '') then
    begin
      MessageDlg('Insira o CEP do Cliente !', mtConfirmation, [mbOk], 0);
    end
    else if (FrmPrincCadastro.DBEditBairro.Text = '') then
    begin
      MessageDlg('Insira o Bairro do Cliente !', mtConfirmation, [mbOk], 0);
    end
    else if ((FrmPrincCadastro.DBEdit1CodCidade.Text) = '') then
    begin
      MessageDlg('Insira a Cidade Correspondente do Cliente !', mtConfirmation,
        [mbOk], 0);
    end
    else
    begin
      DM.FDQryCliente.Post;
      DM.FDQryCliente.ApplyUpdates(0);
      DM.FDQryCliente.CommitUpdates;
    end;
  end;
end;

end.
