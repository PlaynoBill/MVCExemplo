unit UCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uDMCliente;

type
  Toperacao = (opNovo, opAlterar, OpNavegar);
  TfrmCadCliente = class(TForm)
    pnlRodape: TPanel;
    btnFechar: TButton;
    pgcPrincipal: TPageControl;
    tsPesq: TTabSheet;
    tsDados: TTabSheet;
    pnlCabecalho: TPanel;
    dbgrdCliente: TDBGrid;
    lbledtPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    pnlbotoes: TPanel;
    dsPesq: TDataSource;
    lbledtCodigo: TLabeledEdit;
    lbledtNome: TLabeledEdit;
    cbbTipo: TComboBox;
    lbledtDocumento: TLabeledEdit;
    lbledtTelefone: TLabeledEdit;
    lblTipo: TLabel;
    pnlBotoesCadCli: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgrdClienteDblClick(Sender: TObject);



  private
    { Private declarations }
    FOperacao: Toperacao;

    procedure configuracoes;
    procedure Detalhar;
    procedure Pesquisar;
    procedure CarregarCliente;
    procedure inserir;
    procedure listar;
    procedure alterar;
    procedure excluir;
    procedure Gravar;
    procedure HabilitarControles(aOperacao: Toperacao);

  public
    { Public declarations }
    procedure Novo;


  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses uClienteController, uClienteModel;

procedure TfrmCadCliente.alterar;
var
oCliente : TCliente;
oClienteController: TClienteController;
sErro: string;
begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
    try
      with oCliente do
      begin
        ID := StrToIntDef(lbledtCodigo.Text,0);
        Nome := lbledtNome.Text;
        Telefone := lbledtTelefone.Text;
        Documento := lbledtDocumento.Text;

        if cbbTipo.ItemIndex = 0 then
          TIPO := StrToInt('1')

        else if cbbTipo.ItemIndex = 1 then
          TIPO := StrToInt('2')

      end;
      if oClienteController.Alterar(oCliente, sErro) then
      raise
      Exception.Create(sErro)
      else
      ShowMessage('Deu Certo!');

    finally
      FreeAndNil(oCliente);
      FreeAndNil(oClienteController);
    end;

end;

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
   FOperacao := opAlterar;
   HabilitarControles(opAlterar);
end;

procedure TfrmCadCliente.btnCancelarClick(Sender: TObject);
begin
   HabilitarControles(OpNavegar);
end;

procedure TfrmCadCliente.btnDetalharClick(Sender: TObject);
begin
   Detalhar;
end;

procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
begin
   excluir;
end;

procedure TfrmCadCliente.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCliente.btnGravarClick(Sender: TObject);
begin
   Gravar;
   HabilitarControles(OpNavegar);
end;

procedure TfrmCadCliente.btnListarClick(Sender: TObject);
begin
   listar;
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
   Novo;
   HabilitarControles(opNovo);
end;

procedure TfrmCadCliente.btnPesquisarClick(Sender: TObject);
begin
   Pesquisar;
end;

procedure TfrmCadCliente.CarregarCliente;
var
  oCliente: TCliente;
  oClienteController: TClienteController;
begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
  try
    oClienteController.CarregarCliente(oCliente, dsPesq.DataSet.FieldByName('ID_Cliente').AsInteger);
    with oCliente do
    begin
     lbledtCodigo.Text := IntToStr(ID);
     lbledtNome.Text := NOME;
     cbbTipo.Text := IntToStr(tipo);
     lbledtDocumento.Text := documento;
     lbledtTelefone.Text := telefone;

    end;

  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteController);

  end;

end;

procedure TfrmCadCliente.configuracoes;
begin
  tsPesq.TabVisible := false;
  tsDados.TabVisible := False;
  pgcPrincipal.ActivePage := tsPesq;

end;

procedure TfrmCadCliente.dbgrdClienteDblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TfrmCadCliente.Detalhar;
begin
    CarregarCliente;
    HabilitarControles(OpNavegar);
    FOperacao := OpNavegar;
    pgcPrincipal.ActivePage := tsDados;

end;

procedure TfrmCadCliente.excluir;
var oClienteController :TClienteController;
serro: string;
begin
   oClienteController := TClienteController.Create;

   try
    if (DMCliente.cdsPesquisar.Active ) and (DMCliente.cdsPesquisar.RecordCount > 0)  then
    begin
      if MessageDlg('Deseja Realmente Excluir', mtConfirmation,[mbYes, mbNo],0 ) = IDYES then

         if oClienteController.Excluir(DMCliente.cdsPesquisarID_CLIENTE.AsInteger,serro) = False then
          raise Exception.Create(serro);
         oClienteController.pesquisar(lbledtPesquisar.Text);

    end
    else
       raise Exception.Create('N?o h? registro para ser exclu?do');


   finally
    FreeAndNil(oClienteController);
   end;

end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
   DMCliente := TDMCliente.Create(nil);
end;

procedure TfrmCadCliente.FormDestroy(Sender: TObject);
begin
 FreeAndNil(DMCliente);
end;

procedure TfrmCadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
      begin
          Key := #0;
          Perform(WM_NEXTDLGCTL,0,0);

      end;

end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  configuracoes;
end;

procedure TfrmCadCliente.Gravar;
var oClienteController : TClienteController;

begin
  oClienteController := TClienteController.Create;
  try
    case FOperacao of
      opNovo: inserir;
      opAlterar: alterar;
    end;
    oClienteController.pesquisar(lbledtPesquisar.Text);


  finally
  FreeAndNil(oClienteController);

  end;

end;

procedure TfrmCadCliente.HabilitarControles(aOperacao: Toperacao);
begin
  case aOperacao of
    opNovo,opAlterar:
    begin
      lbledtNome.Enabled := True;
      cbbTipo.Enabled := True;
      lbledtDocumento.Enabled := True;
      lbledtTelefone.Enabled :=True;
      btnListar.Enabled :=false;
      btnFechar.Enabled :=False;
      btnAlterar.Enabled := False;
      btnGravar.Enabled := True;
      btnCancelar.Enabled := True;
    end;
      OpNavegar:
    begin

      lbledtNome.Enabled := False;
      cbbTipo.Enabled := False;
      lbledtDocumento.Enabled := False;
      lbledtTelefone.Enabled :=False;
      btnListar.Enabled :=True;
      btnFechar.Enabled :=True;
      btnAlterar.Enabled := True;
      btnGravar.Enabled := False;
      btnCancelar.Enabled := False;

    end;
  end;
end;

procedure TfrmCadCliente.inserir;
var
oCliente: TCliente;
oClienteController : TClienteController;
serro: string;

begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
    try
      with oCliente do
      begin

        NOME := lbledtNome.Text;
        Documento := lbledtDocumento.Text;
        Telefone := lbledtTelefone.Text;


        if cbbTipo.ItemIndex = 0 then
          TIPO := StrToInt('1')

        else if cbbTipo.ItemIndex = 1 then
          TIPO := StrToInt('2')
        //TIPO := StrToInt(cbbTipo.Text);

      end;
      if oClienteController.Inserir(oCliente, serro) then
        raise Exception.Create(serro);

    finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteController);

    end;



end;

procedure TfrmCadCliente.listar;
begin
  pgcPrincipal.ActivePage := tsPesq;
end;

procedure TfrmCadCliente.Novo;
begin
     FOperacao := opNovo;
     pgcPrincipal.ActivePage := tsDados;
end;

procedure TfrmCadCliente.Pesquisar;
var oClienteController: TClienteController;
begin
  oClienteController := TClienteController.Create;
  try
    oClienteController.pesquisar(lbledtPesquisar.Text);

  finally
    FreeAndNil(oClienteController);

  end;

end;

end.
