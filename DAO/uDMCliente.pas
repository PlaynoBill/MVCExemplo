unit uDMCliente;

interface

uses
  System.SysUtils, System.Classes, uDMConexao, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, uClienteModel;

type
  TDMCliente = class(TDataModule)
    dsePesquisar: TSQLDataSet;
    dseInserir: TSQLDataSet;
    dseAlterar: TSQLDataSet;
    dseExcluir: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarID_CLIENTE: TIntegerField;
    cdsPesquisarCODIGO: TIntegerField;
    wdstrngfldPesquisarRAZAO: TWideStringField;
    wdstrngfldPesquisarTELEFONE: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID: Integer;
    procedure Pesquisar(sNome: string);
    procedure CarregarCliente(oCliente: TCliente; iCodigo: Integer);
    function inserir(Ocliente: TCliente; out sErro: string):Boolean;
    function Alterar(Ocliente: TCliente; out sErro: string):Boolean;
    function Excluir(iCodigo: Integer; out sErro: string):Boolean;


  end;

var
  DMCliente: TDMCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMCliente }

function TDMCliente.Alterar(Ocliente: TCliente; out sErro: string): Boolean;

begin
    with dseAlterar, oCliente do
    begin
       Params[1].AsString := NOME;
       Params[2].AsInteger := TIPO;
       Params[3].AsString := Documento;
       Params[5].AsString := Telefone;
       Params[6].AsInteger := ID;

       try
          ExecSQL();
          Result := True;
       except on E: Exception do
        begin
           sErro :='Ocorreu um erro ao Alterar' + sLineBreak +  E.Message;
           Result := False;

        end;

       end;

    end;

end;

procedure TDMCliente.CarregarCliente(oCliente: TCliente; iCodigo: Integer);
var sqlcliente: TSQLDataSet;

begin
    sqlcliente := TSQLDataSet.Create(nil);

    try
     with sqlcliente do
     begin
      SQLConnection := DTMConexao.dbxConexao;
      CommandText := 'select * from clientes where (id_cliente = ' + IntToStr(iCodigo) + ')';
      Open;
        with oCliente  do
        begin
          ID := FieldByName('ID_cliente').AsInteger;
          NOME := FieldByName('Razao').AsString;
          Documento := FieldByName('CPFOUCNPJ').AsString;
          TIPO := FieldByName('FISICAOUJURIDICA').AsInteger;
          Telefone := FieldByName('TELEFONE').AsString;
        end;

     end;
    finally
      FreeAndNil(sqlcliente);
    end;


end;

function TDMCliente.Excluir(iCodigo: Integer; out sErro: string): Boolean;
begin
    with dseExcluir do
    begin
       Params[0].AsInteger := iCodigo;
       try
       ExecSQL();
       Result := True;

       except on E: Exception do
        begin
          sErro := 'Ocorreu um erro ao Excluir' + sLineBreak + E.Message;
          Result:= False;
        end;

       end;

    end;
end;

function TDMCliente.GerarID: Integer;
var sqlSequencia: TSQLDataSet;

begin
  sqlSequencia := TSQLDataSet.Create(nil);

  try
    with sqlSequencia do
    begin
        SQLConnection := DTMConexao.dbxConexao;
        CommandText := 'select coalesce(max(ID_CLIENTE),0) + 1 as seq from clientes';
        Open;

        Result := FieldByName('seq').AsInteger;
    end;



  finally

  FreeAndNil(sqlSequencia);

  end;


end;

function TDMCliente.inserir(Ocliente: TCliente; out sErro: string): Boolean;
begin
   with dseInserir, Ocliente do
   begin
     ParamByName('ID_Cliente').AsInteger := GerarID;
     ParamByName('RAZAO').AsString := NOME;
     ParamByName('FISICAOUJURIDICA').AsInteger := tipo;
     ParamByName('TELEFONE').AsString := Telefone;
     ParamByName('CPFOUCNPJ').AsString := Documento;
      try
        ExecSQL();
        Result := True;
      except on E: Exception do
        begin
          sErro := 'Ocorreu um Erro ao Inserir Cliente' + sLineBreak + E.Message;
          Result := False;
        end;


      end;

   end;

end;

procedure TDMCliente.Pesquisar(sNome: string);
begin
  if cdsPesquisar.Active then
     cdsPesquisar.Close;
     cdsPesquisar.Params[0].AsString :='%' + sNome + '%';
     cdsPesquisar.Open;
     cdsPesquisar.First;

end;

end.
