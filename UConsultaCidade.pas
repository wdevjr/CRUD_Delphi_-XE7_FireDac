unit UConsultaCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmConsultaCidades = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DtsrcCidade: TDataSource;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaCidades: TFrmConsultaCidades;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmConsultaCidades.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  DM.FDQryConsultCidade.Close;
  DM.FDQryConsultCidade.Params[0].AsString := '%' + Edit1.Text + '%';
  DM.FDQryConsultCidade.Open;
end;

end.
