unit UDetalheVenda;

// ##:::::::'########::'#######::'##::::'##:'########::'######:::'####:'##:::::::'########:::'#######::
// ##::::::: ##.....::'##.... ##: ##:::: ##: ##.....::'##... ##::. ##:: ##::::::: ##.... ##:'##.... ##:
// ##::::::: ##::::::: ##:::: ##: ##:::: ##: ##::::::: ##:::..:::: ##:: ##::::::: ##:::: ##: ##:::: ##:
// ##::::::: ######::: ##:::: ##: ##:::: ##: ######::: ##::'####:: ##:: ##::::::: ##:::: ##: ##:::: ##:
// ##::::::: ##...:::: ##:::: ##:. ##:: ##:: ##...:::: ##::: ##::: ##:: ##::::::: ##:::: ##: ##:::: ##:
// ##::::::: ##::::::: ##:::: ##::. ## ##::: ##::::::: ##::: ##::: ##:: ##::::::: ##:::: ##: ##:::: ##:
// ########: ########:. #######::::. ###:::: ########:. ######:::'####: ########: ########::. #######::
// ........::........:::.......::::::...:::::........:::......::::....::........::........::::.......:::

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, DBAccess, Uni, MemDS, UniProvider, InterBaseUniProvider,
  LblEffct, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter, JvExControls,
  JvButton, JvTransparentButton, JvXPCore, JvXPButtons, ShellAPI,
  System.IniFiles;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    DateTimeInicial: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DateTimeFinal: TDateTimePicker;
    DBGridTransacao: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    DBGridItens: TDBGrid;
    Label5: TLabel;
    DBGridRecebimentos: TDBGrid;
    BtnConsultar: TButton;
    InterBaseUniProvider1: TInterBaseUniProvider;
    UniConnection1: TUniConnection;
    UniQueryTransacao: TUniQuery;
    DataSourceTransacao: TDataSource;
    DataSourceItens: TDataSource;
    DataSourcePagamentos: TDataSource;
    UniQueryItens: TUniQuery;
    UniQueryRecebimentos: TUniQuery;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    LblVendaSelecionada: TLabelEffect;
    LblPeriodoSelecionado: TLabelEffect;
    UniQueryTotalSelecionado: TUniQuery;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    EditServidor: TEdit;
    Label7: TLabel;
    EditPorta: TEdit;
    FileOpenDialog1: TFileOpenDialog;
    Label8: TLabel;
    EditLocalBanco: TEdit;
    BtnLocalizar: TButton;
    Label9: TLabel;
    EditUsuarioBanco: TEdit;
    Label10: TLabel;
    EditSenhaBanco: TEdit;
    JvFooter1: TJvFooter;
    Label11: TLabel;
    JvXPButtonConsultar: TJvXPButton;
    JvXPButton1: TJvXPButton;
    JvXPButton2: TJvXPButton;
    DBGrid1: TDBGrid;
    Label12: TLabel;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    EditCodLoja: TEdit;
    EditCNPJ: TEdit;
    EditLinkVF: TEdit;
    BtnConfigWebClient: TJvXPButton;
    BtnRestartWebClient: TJvXPButton;
    UniQueryDadosLoja: TUniQuery;
    BtnAcessarVF: TButton;
    procedure BtnConsultarClick(Sender: TObject);
    procedure DBGridTransacaoCellClick(Column: TColumn);
    procedure FileOpenDialog1FileOkClick(Sender: TObject;
      var CanClose: Boolean);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAcessarVFClick(Sender: TObject);
    procedure BtnConfigWebClientClick(Sender: TObject);
  private
    { Private declarations }
  public
    dataInicial: string;
    dataFinal: string;
    trnSequencial: string;
    vData: TDate;
  end;

var
  Form2: TForm2;
  IniFile: TIniFile;
  I: Integer;
  Linhas: TStringList;
  Lista: TStringList;
  Lista2: TStringList;

implementation

{$R *.dfm}

procedure ManipularArquivoProperties(const NomeArquivo: string;
  const CodLoja: string; const CnpjLoja: string; const UrlVf: string);
var
  Linhas: TStringList;
  I: Integer;
  Chave: string;
  Valor: string;
begin
  // Cria um objeto TStringList para armazenar as linhas do arquivo
  Linhas := TStringList.Create;
  try
    // Carrega o arquivo .properties
    Linhas.LoadFromFile(NomeArquivo);

    // Itera pelas linhas do arquivo
    for I := 0 to Linhas.Count - 1 do
    begin
      // Verifica se a linha contém um par chave=valor
      if Pos('=', Linhas[I]) > 0 then
      begin
        // Extrai a chave e o valor
        Chave := Trim(Copy(Linhas[I], 1, Pos('=', Linhas[I]) - 1));
        Valor := Trim(Copy(Linhas[I], Pos('=', Linhas[I]) + 1));

        // Realiza as operações desejadas com a chave e o valor
        if Chave = 'syspdvwebclient.codigoLoja' then
          Valor := CodLoja; // Novo valor para codigoLoja
        if Chave = 'syspdvwebclient.webServerHost' then
          Valor := UrlVf; // Novo valor para webServerHost
        if Chave = 'syspdvwebclient.cnpjLoja' then
          Valor := CnpjLoja;

        // Atualiza a linha no TStringList
        Linhas[I] := Chave + '=' + Valor;
      end;
    end;

    // Salva o arquivo .properties
    Linhas.SaveToFile(NomeArquivo);
  finally
    // Libera o TStringList
    Linhas.Free;
  end;
end;

procedure TForm2.BtnAcessarVFClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(EditLinkVF.Text), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm2.BtnConfigWebClientClick(Sender: TObject);
var
  TextoOriginal, Delimitador: string;
  Partes: TArray<string>;
  I: Integer;
begin

  // Dividindo a URL do VF para remover o https:// e o :443
  Lista := TStringList.Create;
  try
    Lista.Delimiter := '/';
    Lista.DelimitedText := EditLinkVF.Text;
    for I := 0 to Lista.Count - 1 do
      //ShowMessage(Lista[2]);
  finally
  end;
  ManipularArquivoProperties
    ('C:\Program Files (x86)\SysPDVWebClient\configuracoes.properties',
    EditCodLoja.Text, EditCNPJ.Text, Lista[2]);

  Lista.Free;
end;

procedure TForm2.BtnConsultarClick(Sender: TObject);
begin

  // Formatando campo de data para o padrão do Firebird
  dataInicial := formatdatetime('dd.MM.yyyy', DateTimeInicial.Date);
  dataFinal := formatdatetime('dd.MM.yyyy', DateTimeFinal.Date);

  // Criando conexão com o banco de dados do server
  UniConnection1.Server := EditServidor.Text;
  UniConnection1.Database := EditLocalBanco.Text;
  UniConnection1.Username := EditUsuarioBanco.Text;
  UniConnection1.Password := EditSenhaBanco.Text;
  // Executando a consulta que retorna a capa da venda e preenchendo o datagrid
  UniQueryTransacao.SQL.Text := 'select ' + 't.trnseq as SEQUENCIAL, ' +
    't.cxanum as caixa, ' + 't.trndat as data, ' +
    't.funcod || '' - '' || fun.fundes as funcionario, ' + 't.trnvlr as valor, '
    + 't.trnlogweb as logweb, ' + 'T.trnnfcenum AS NUM_NOTA, ' +
    't.trnnfceser as serie, ' + 't.trnnfcechvnfe as chave, ' +
    't.trnnfcenumprot as protocolo ' + 'from transacao t ' +
    'join funcionario fun ' +
    'on t.funcod = fun.funcod where trntip = ''1'' and trndat between ''' +
    dataInicial + ''' and ''' + dataFinal + ''' order by trndat';
  UniConnection1.Open();
  UniQueryTransacao.Open();
  DataSourceTransacao.DataSet := UniQueryTransacao;
  DBGridTransacao.DataSource := DataSourceTransacao;

  UniQueryDadosLoja.SQL.Text := 'select ' + 'prop.*, ' + '(select ' +
    'conf.ipsrvweb ' + 'from configpdv conf) url ' + 'from ' +
    '(select prp.loj_codigo as cod, prp.prpcgc as cnpj ' +
    'from proprio prp) prop';
  UniConnection1.Open();
  UniQueryDadosLoja.Open();
  EditCodLoja.Text := UniQueryDadosLoja.FieldByName('COD').AsString;
  EditCNPJ.Text := UniQueryDadosLoja.FieldByName('CNPJ').AsString;
  EditLinkVF.Text := UniQueryDadosLoja.FieldByName('URL').AsString;

end;

// Procedure que captura o valor da primeira coluna da linha selecionada
procedure TForm2.BtnLocalizarClick(Sender: TObject);
begin
  FileOpenDialog1.Execute;
end;

procedure TForm2.DBGridTransacaoCellClick(Column: TColumn);
begin


  // Preenche Grid de Itens

  trnSequencial := DBGridTransacao.columns.items[0].field.Text;
  UniConnection1.Server := EditServidor.Text;
  UniConnection1.Database := EditLocalBanco.Text;
  UniConnection1.Username := EditUsuarioBanco.Text;
  UniConnection1.Password := EditSenhaBanco.Text;
  UniQueryItens.SQL.Text := 'select ' + 'ite.procod as codigo, ' +
    'pro.prodes as descricao, ' + 'ite.itvqtdvda as quantidade, ' +
    'ite.itvvlruni as unitario, ' + 'ite.itvvlracr as acrescimo, ' +
    'ite.itvvlrdcn as desconto, ' + 'ite.itvvlrtot as liquido ' +
    'from itevda ite ' + 'join produto pro on ' +
    'ite.procod = pro.procod where ite.trnseq = ''' + trnSequencial + '''';
  UniConnection1.Open();
  UniQueryItens.Open();
  DataSourceItens.DataSet := UniQueryItens;
  DBGridItens.DataSource := DataSourceItens;

  // Preenche Grid de Pagamentos

  UniQueryRecebimentos.SQL.Text := 'select ' + 'pgt.fzdseq as seq, ' +
    'pgt.fzdcod as finalizadora, ' + 'fin.fzddes as descricao, ' +
    'pgt.fzdvlr as valor, ' + 'pgt.fzdnsustf as NSU_SITEF, ' +
    'pgt.fzdautcar as AUTORIZACAO, ' + 'pgt.fzdbincar as BIN_CARTAO ' +
    'from finalizacao pgt ' + 'join finalizadora fin ' +
    'on pgt.fzdcod = fin.fzdcod where pgt.trnseq =  ''' + trnSequencial + '''';
  UniConnection1.Open();
  UniQueryRecebimentos.Open();
  DataSourcePagamentos.DataSet := UniQueryRecebimentos;
  DBGridRecebimentos.DataSource := DataSourcePagamentos;

  // Preenche Label Total

  UniQueryTotalSelecionado.SQL.Text := 'select ' + 'sum(t.trnvlr) as total ' +
    'from transacao t ' + 'where t.trnseq =  ''' + trnSequencial + '''';
  UniConnection1.Open();
  UniQueryTotalSelecionado.Open();
  LblVendaSelecionada.Caption := 'R$' + UniQueryTotalSelecionado.FieldByName
    ('total').AsString;

end;

procedure TForm2.FileOpenDialog1FileOkClick(Sender: TObject;
  var CanClose: Boolean);
begin
  EditLocalBanco.Text := FileOpenDialog1.FileName;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  DateTimeInicial.Date := Now;
  DateTimeFinal.Date := Now;

end;

end.
