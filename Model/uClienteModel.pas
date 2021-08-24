unit uClienteModel;

interface

uses
System.SysUtils;

type
  TCliente = class

  private
    FCOD: Integer;
    Fdocumento: string;
    FID: Integer;
    FNOME: string;
    FTipo: SmallInt;
    Ftelefone: string;
    procedure SetNOME(const Value: string);

  public
    property ID: Integer read FID write FID;
    property CODIGO: Integer read FCOD write FCOD;
    property NOME: string read FNOME write SetNOME;
    property TIPO: SmallInt read FTipo write Ftipo;
    property Documento: string read Fdocumento write Fdocumento;
    property Telefone: string read Ftelefone write Ftelefone;


  end;

implementation

{ TCliente }

procedure TCliente.SetNOME(const Value: string);
begin
   if Value = EmptyStr then
      raise EArgumentException.Create('Nome Precisa ser preenchido!');

    FNOME := Value;
end;

end.
