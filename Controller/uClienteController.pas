unit uClienteController;

interface

uses
uClienteModel, uDMCliente, system.SysUtils;

type
  TClienteController = class
  private

  public
  constructor Create;
  destructor Destroy; override;
  function Inserir(Ocliente: TCliente; var sErro: string ):Boolean;
  function Alterar(oCliente: TCliente; var sErro: string):Boolean;
  function Excluir(iCodigo: Integer; var sErro: string):Boolean;
  procedure CarregarCliente(oCliente: TCliente; iCodigo: Integer);
  procedure pesquisar(sNome:string);


  end;

implementation

{ TClienteController }

function TClienteController.Alterar(oCliente: TCliente; var sErro: string): Boolean;
begin
  Result := DMCliente.Alterar(oCliente,sErro);
end;

procedure TClienteController.CarregarCliente(oCliente: TCliente; iCodigo: Integer);
begin
    DMCliente.CarregarCliente(oCliente, iCodigo);
end;

constructor TClienteController.Create;
begin
  //DMCliente := TDMCliente.Create(nil);
end;

destructor TClienteController.Destroy;
begin
  //FreeAndNil(DMCliente);
  inherited;
end;

function TClienteController.Excluir(iCodigo: Integer; var sErro: string): Boolean;
begin
   Result := DMCliente.Excluir(iCodigo, sErro);
end;


function TClienteController.Inserir(Ocliente: TCliente; var sErro: string): Boolean;
begin
   Result := DMCliente.inserir(Ocliente, sErro);
end;

procedure TClienteController.pesquisar(sNome: string);
begin
  DMCliente.Pesquisar(sNome);
end;

end.
