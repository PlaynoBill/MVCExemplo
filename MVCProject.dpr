program MVCProject;

uses
  Vcl.Forms,
  uPrincipal in 'View\uPrincipal.pas' {frmPrincipal},
  UCadCliente in 'View\UCadCliente.pas' {frmCadCliente},
  uClienteModel in 'Model\uClienteModel.pas',
  uClienteController in 'Controller\uClienteController.pas',
  uDMConexao in 'DAO\uDMConexao.pas' {DTMConexao: TDataModule},
  uDMCliente in 'DAO\uDMCliente.pas' {DMCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDTMConexao, DTMConexao);
  Application.Run;
end.
