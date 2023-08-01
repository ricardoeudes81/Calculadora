unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, unClasseCalculadora,
  unClasseImpostos;

type
  TStatusComandos = (tsTravar, tsDestravar);

  TfrmPrincipal = class(TForm)
    pnlCalculadora: TPanel;
    edtVisor: TEdit;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    btn6: TBitBtn;
    btn7: TBitBtn;
    btn8: TBitBtn;
    btn9: TBitBtn;
    btn0: TBitBtn;
    btnSoma: TBitBtn;
    btnSubtracao: TBitBtn;
    btnMultiplicacao: TBitBtn;
    btnDivisao: TBitBtn;
    btnResultado: TBitBtn;
    btnClear: TBitBtn;
    btnClearEntry: TBitBtn;
    grpImpostos: TGroupBox;
    btnImpostoA: TBitBtn;
    edtImpostoA: TEdit;
    btnImpostoB: TBitBtn;
    edtImpostoB: TEdit;
    btnImpostoC: TBitBtn;
    edtImpostoC: TEdit;
    btnLimparImpostos: TBitBtn;
    btnSinalDecimal: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn0Click(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnClearEntryClick(Sender: TObject);
    procedure btnSomaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSubtracaoClick(Sender: TObject);
    procedure btnMultiplicacaoClick(Sender: TObject);
    procedure btnDivisaoClick(Sender: TObject);
    procedure btnResultadoClick(Sender: TObject);
    procedure btnLimparImpostosClick(Sender: TObject);
    procedure btnImpostoAClick(Sender: TObject);
    procedure btnImpostoBClick(Sender: TObject);
    procedure btnImpostoCClick(Sender: TObject);
    procedure btnSinalDecimalClick(Sender: TObject);
    procedure CalculadoraKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FErro: Boolean;
    OperacaoSoma: TCalculadora;
    OperacaoSubtracao: TCalculadora;
    OperacaoMultiplicacao: TCalculadora;
    OperacaoDivisao: TCalculadora;
    procedure preencherVisor(cDigito: String);
    procedure AplicarValorTecla(var Key: Char);
    procedure ReinicializarCalculadora();
    procedure DestruirObjetos();
    procedure TravarDestravarComandos(statusComandos: TStatusComandos);
    procedure CriarOperacao(tpOpercao: TTipoOperacao);
    procedure PrepararOperacao(tpOpercao: TTipoOperacao);
    procedure ApresentarResultado();

    procedure LimparCamposImpostos();
    procedure CalcularImpostoA();
    procedure CalcularImpostoB();
    procedure CalcularImpostoC();

    property Erro: Boolean read FErro;

    { Private declarations }
  public

    { Public declarations }
  end;

const
  FORMATO_VALOR: string = '###,###,###,###,###,##0.00';

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.PrepararOperacao(tpOpercao: TTipoOperacao);
begin
  if (edtVisor.Text = EmptyStr) then
    Exit;

  if TCalculadora.agurdandoResultado then
  begin
    btnResultado.Click;
    TCalculadora.agurdandoResultado := False;
  end;

  CriarOperacao(tpOpercao);

  TCalculadora.operacaoAtiva := tpOpercao;
  TCalculadora.zerar := True;
end;

procedure TfrmPrincipal.CriarOperacao(tpOpercao: TTipoOperacao);
begin
  case tpOpercao of
    tpoNada:;
    tpoSoma:
      begin
        if not Assigned(OperacaoSoma) then
          OperacaoSoma := TOperacaoSoma.Create(StrToFloat(Trim(edtVisor.Text)));
      end;
    tpoSubtracao:
      begin
        if not Assigned(OperacaoSubtracao) then
          OperacaoSubtracao := TOperacaoSubtracao.Create(StrToFloat(Trim(edtVisor.Text)));
      end;
    tpoMultiplicacao:
      begin
        if not Assigned(OperacaoMultiplicacao) then
          OperacaoMultiplicacao := TOperacaoMultiplicacao.Create(StrToFloat(Trim(edtVisor.Text)));
      end;
    tpoDivisao:
      begin
        if not Assigned(OperacaoDivisao) then
          OperacaoDivisao := TOperacaoDivisao.Create(StrToFloat(Trim(edtVisor.Text)));
      end;
  end;
end;


procedure TfrmPrincipal.btnSomaClick(Sender: TObject);
begin
  PrepararOperacao(tpoSoma);
end;


procedure TfrmPrincipal.btnSubtracaoClick(Sender: TObject);
begin
  PrepararOperacao(tpoSubtracao);
end;


procedure TfrmPrincipal.btnMultiplicacaoClick(Sender: TObject);
begin
  PrepararOperacao(tpoMultiplicacao);
end;


procedure TfrmPrincipal.btnDivisaoClick(Sender: TObject);
begin
  PrepararOperacao(tpoDivisao);
end;


procedure TfrmPrincipal.btnResultadoClick(Sender: TObject);
begin
  ApresentarResultado();
end;


procedure TfrmPrincipal.ApresentarResultado();
begin
  if (edtVisor.Text = EmptyStr) then
    Exit;

  if Erro then
  begin
    ReinicializarCalculadora();
    Exit;
  end;

  if TCalculadora.agurdandoResultado then
    TCalculadora.nNumeroAtual := StrToFloat(Trim(edtVisor.Text));

  case TCalculadora.operacaoAtiva of
    tpoSoma:
      begin
        edtVisor.Text := OperacaoSoma.Calculo().ToString;
      end;
    tpoSubtracao:
      begin
        edtVisor.Text := OperacaoSubtracao.Calculo().ToString;
      end;
    tpoMultiplicacao:
      begin
        edtVisor.Text := OperacaoMultiplicacao.Calculo().ToString;
      end;
    tpoDivisao:
      begin
        try
          edtVisor.Text := OperacaoDivisao.Calculo().ToString;
        except
          on e: Exception do
          begin
            ReinicializarCalculadora();
            edtVisor.Text := e.Message;
            TravarDestravarComandos(tsTravar);
            Abort;
          end;
        end;
      end;
  end;
  TCalculadora.zerar := True;
  TCalculadora.agurdandoResultado := False;
end;


procedure TfrmPrincipal.btn0Click(Sender: TObject);
begin
  preencherVisor('0');
end;

procedure TfrmPrincipal.btn1Click(Sender: TObject);
begin
  preencherVisor('1');
end;

procedure TfrmPrincipal.btn2Click(Sender: TObject);
begin
  preencherVisor('2');
end;

procedure TfrmPrincipal.btn3Click(Sender: TObject);
begin
  preencherVisor('3');
end;

procedure TfrmPrincipal.btn4Click(Sender: TObject);
begin
  preencherVisor('4');
end;

procedure TfrmPrincipal.btn5Click(Sender: TObject);
begin
  preencherVisor('5');
end;

procedure TfrmPrincipal.btn6Click(Sender: TObject);
begin
  preencherVisor('6');
end;

procedure TfrmPrincipal.btn7Click(Sender: TObject);
begin
  preencherVisor('7');
end;

procedure TfrmPrincipal.btn8Click(Sender: TObject);
begin
  preencherVisor('8');
end;

procedure TfrmPrincipal.btn9Click(Sender: TObject);
begin
  preencherVisor('9');
end;

procedure TfrmPrincipal.btnClearClick(Sender: TObject);
begin
  ReinicializarCalculadora();
end;

procedure TfrmPrincipal.btnClearEntryClick(Sender: TObject);
begin
  if (edtVisor.Text) <> EmptyStr then
    edtVisor.Text := Copy(edtVisor.Text, 1, Length(edtVisor.Text) - 1);
end;

procedure TfrmPrincipal.btnSinalDecimalClick(Sender: TObject);
begin
  var strVisor:String := edtVisor.Text;
  if (strVisor.CountChar(',') = 0) then
  begin
    if strVisor.IsEmpty then
      preencherVisor('0,')
    else
      preencherVisor(',');
  end;
end;

procedure TfrmPrincipal.CalculadoraKeyPress(Sender: TObject; var Key: Char);
begin
  var strVisor: string := edtVisor.Text;

  if not (CharInSet(Key, [#8, #13, '0'..'9', ',', '+', '-', '*', '/'])) or ((CharInSet(key, [','])) and (strVisor.CountChar(',') = 1) ) then
    Key := #0;

  if (CharInSet(Key, ['+'])) then
  begin
    if btnSoma.CanFocus then
      btnSoma.Click;
    Key := #0;
  end;

  if (CharInSet(Key, ['-'])) then
  begin
    if btnSubtracao.CanFocus then
      btnSubtracao.Click;
    Key := #0;
  end;

  if (CharInSet(Key, ['*'])) then
  begin
    if btnMultiplicacao.CanFocus then
      btnMultiplicacao.Click;
    Key := #0;
  end;

  if (CharInSet(Key, ['/'])) then
  begin
    if btnDivisao.CanFocus then
      btnDivisao.Click;
    Key := #0;
  end;

  if (CharInSet(Key, [#8])) then
  begin
    if btnClearEntry.CanFocus then
      btnClearEntry.Click;
    Key := #0;
  end;

  if (CharInSet(Key, [#13])) then
  begin
    if btnResultado.CanFocus then
      btnResultado.Click;
    Key := #0;
  end;

  if (CharInSet(Key, ['0'..'9', ','])) then
  begin
    AplicarValorTecla(Key);
    Key := #0;
  end;

  if edtVisor.CanFocus then
    edtVisor.SetFocus;
  edtVisor.SelStart := Length(edtVisor.Text);
end;

procedure TfrmPrincipal.DestruirObjetos;
begin
  if Assigned(OperacaoSoma) then
    FreeAndNil(OperacaoSoma);
  if Assigned(OperacaoSubtracao) then
    FreeAndNil(OperacaoSubtracao);
  if Assigned(OperacaoMultiplicacao) then
    FreeAndNil(OperacaoMultiplicacao);
  if Assigned(OperacaoDivisao) then
    FreeAndNil(OperacaoDivisao);
end;

procedure TfrmPrincipal.AplicarValorTecla(var Key: Char);
begin
  if Key = ',' then
    btnSinalDecimal.Click
  else
    preencherVisor(Key);
  Key := #0;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DestruirObjetos();
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    edtVisor.Text := '0';
    TravarDestravarComandos(tsDestravar);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ReinicializarCalculadora();
end;

procedure TfrmPrincipal.preencherVisor(cDigito: String);
begin
  if TCalculadora.zerar then
  begin
     edtVisor.Text := EmptyStr;
     TCalculadora.zerar := False;
     if cDigito = ',' then
       edtVisor.Text := '0';
  end;
  edtVisor.Text := edtVisor.Text + cDigito;
  edtVisor.SelStart := Length(edtVisor.Text);
  TCalculadora.agurdandoResultado := True;
  TravarDestravarComandos(tsDestravar);
end;

procedure TfrmPrincipal.ReinicializarCalculadora;
begin
  edtVisor.Text := '0';
  TCalculadora.operacaoAtiva := tpoNada;
  TCalculadora.nNumeroAnterior := 0;
  TCalculadora.nNumeroAtual := 0;
  TCalculadora.nResultado := 0;
  TCalculadora.zerar := True;
  TCalculadora.agurdandoResultado := False;

  TravarDestravarComandos(tsDestravar);

  DestruirObjetos();
end;

procedure TfrmPrincipal.TravarDestravarComandos(statusComandos: TStatusComandos);
var
  status: Boolean;
begin
  status := Boolean(statusComandos);

  btnSoma.Enabled := status;
  btnSubtracao.Enabled := status;
  btnMultiplicacao.Enabled := status;
  btnDivisao.Enabled := status;
  btnSinalDecimal.Enabled := status;
  btnClearEntry.Enabled := status;

  FErro := not status;
end;


procedure TfrmPrincipal.btnLimparImpostosClick(Sender: TObject);
begin
  LimparCamposImpostos();
end;

procedure TfrmPrincipal.LimparCamposImpostos;
begin
  edtImpostoA.Clear;
  edtImpostoB.Clear;
  edtImpostoC.Clear;
end;

procedure TfrmPrincipal.btnImpostoAClick(Sender: TObject);
begin
  if TCalculadora.agurdandoResultado then
  begin
    btnResultado.Click;
    TCalculadora.agurdandoResultado := False;
  end;

  CalcularImpostoA();
end;

procedure TfrmPrincipal.btnImpostoBClick(Sender: TObject);
begin
  if TCalculadora.agurdandoResultado then
  begin
    btnResultado.Click;
    TCalculadora.agurdandoResultado := False;
  end;

  CalcularImpostoB();
end;

procedure TfrmPrincipal.btnImpostoCClick(Sender: TObject);
begin
  if TCalculadora.agurdandoResultado then
  begin
    btnResultado.Click;
    TCalculadora.agurdandoResultado := False;
  end;

  CalcularImpostoC();
end;

procedure TfrmPrincipal.CalcularImpostoA;
var
  Imposto: TImposto;
begin
  Imposto := TImpostoA.Create;
  try
    edtImpostoA.Text := FormatFloat(FORMATO_VALOR, Imposto.CalculaImposto(StrToFloatDef(edtVisor.Text, 0)));
  finally
    Imposto.Free;
  end;
end;

procedure TfrmPrincipal.CalcularImpostoB;
var
  Imposto: TImposto;
begin
  Imposto := TImpostoB.Create;
  try
    edtImpostoB.Text := FormatFloat(FORMATO_VALOR, Imposto.CalculaImposto(StrToFloatDef(edtVisor.Text, 0)));
  finally
    Imposto.Free;
  end;
end;

procedure TfrmPrincipal.CalcularImpostoC;
var
  Imposto: TImposto;
begin
  Imposto := TImpostoC.Create;
  try
    edtImpostoC.Text := FormatFloat(FORMATO_VALOR, Imposto.CalculaImposto(StrToFloatDef(edtVisor.Text, 0)));
  finally
    Imposto.Free;
  end;
end;

end.
