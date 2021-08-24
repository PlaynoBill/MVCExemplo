unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, DbxDevartInterBase;

type
  TDTMConexao = class(TDataModule)
    dbxConexao: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DTMConexao: TDTMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
