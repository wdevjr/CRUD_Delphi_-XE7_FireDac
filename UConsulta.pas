unit UConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Data.DB;

type
  TFrmConsulta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EditProc: TEdit;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    DtsrcConsulta: TDataSource;
    procedure EditProcKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta: TFrmConsulta;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmConsulta.EditProcKeyPress(Sender: TObject; var Key: Char);
begin
  DM.FDQryConsulta.Close;
  DM.FDQryConsulta.Params[0].AsString := '%' + EditProc.Text + '%';
  DM.FDQryConsulta.Open;
end;

end.
