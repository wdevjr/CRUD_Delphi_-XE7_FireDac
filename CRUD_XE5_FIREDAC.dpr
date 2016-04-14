program CRUD_XE5_FIREDAC;

uses
  Vcl.Forms,
  UPrinc in 'UPrinc.pas' {FrmPrincCadastro} ,
  UThema in 'UThema.pas' {FrmThemas} ,
  Vcl.Themes,
  Vcl.Styles,
  UDM in 'UDM.pas' {DM: TDataModule} ,
  UConsulta in 'UConsulta.pas' {FrmConsulta} ,
  UConsultaCidade in 'UConsultaCidade.pas' {FrmConsultaCidades};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincCadastro, FrmPrincCadastro);
  Application.CreateForm(TDM, DM);
  Application.Run;

end.
