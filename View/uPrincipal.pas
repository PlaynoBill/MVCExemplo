unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UCadCliente ;

type
  TfrmPrincipal = class(TForm)
    btnCliente: TButton;
    procedure btnClienteClick(Sender: TObject);
  private
    procedure AbrirCliente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AbrirCliente;
begin
   frmCadCliente := TfrmCadCliente.Create(nil);

   try
    frmCadCliente.ShowModal;
   finally
    FreeAndNil(frmCadCliente);
   end;

end;

procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin

     AbrirCliente;

end;

end.
