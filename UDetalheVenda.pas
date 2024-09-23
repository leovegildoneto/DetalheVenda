unit UDetalheVenda;

//'##:::::::'########::'#######::'##::::'##:'########::'######:::'####:'##:::::::'########:::'#######::
//##::::::: ##.....::'##.... ##: ##:::: ##: ##.....::'##... ##::. ##:: ##::::::: ##.... ##:'##.... ##:
//##::::::: ##::::::: ##:::: ##: ##:::: ##: ##::::::: ##:::..:::: ##:: ##::::::: ##:::: ##: ##:::: ##:
//##::::::: ######::: ##:::: ##: ##:::: ##: ######::: ##::'####:: ##:: ##::::::: ##:::: ##: ##:::: ##:
//##::::::: ##...:::: ##:::: ##:. ##:: ##:: ##...:::: ##::: ##::: ##:: ##::::::: ##:::: ##: ##:::: ##:
//##::::::: ##::::::: ##:::: ##::. ## ##::: ##::::::: ##::: ##::: ##:: ##::::::: ##:::: ##: ##:::: ##:
//########: ########:. #######::::. ###:::: ########:. ######:::'####: ########: ########::. #######::
//........::........:::.......::::::...:::::........:::......::::....::........::........::::.......:::

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, DBAccess, Uni, MemDS, UniProvider, InterBaseUniProvider,
  LblEffct;

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
    procedure BtnConsultarClick(Sender: TObject);
    procedure DBGridTransacaoCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    dataInicial: string;
    dataFinal: string;
    trnSequencial: string;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BtnConsultarClick(Sender: TObject);
begin

  //Formatando campo de data para o padrão do Firebird
  dataInicial := formatdatetime('dd.MM.yyyy', DateTimeInicial.Date);
  dataFinal := formatdatetime('dd.MM.yyyy', DateTimeFinal.Date);

  //Criando conexão com o banco de dados do server
  UniConnection1.Database := 'C:\SysPDV\SYSPDV_SRV.FDB';
  UniConnection1.Username := 'sysdba';
  UniConnection1.Password := 'masterkey';
  //Executando a consulta que retorna a capa da venda e preenchendo o datagrid
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
end;

//Procedure que captura o valor da primeira coluna da linha selecionada
procedure TForm2.DBGridTransacaoCellClick(Column: TColumn);
begin

  //Preenche Grid de Itens

  trnSequencial := DBGridTransacao.columns.items[0].field.Text;
  UniConnection1.Database := 'C:\SysPDV\SYSPDV_SRV.FDB';
  UniConnection1.Username := 'sysdba';
  UniConnection1.Password := 'masterkey';
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

  //Preenche Grid de Pagamentos

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

  //Preenche Label Total

  UniQueryTotalSelecionado.SQL.Text := 'select ' + 'sum(t.trnvlr) as total ' +
    'from transacao t ' + 'where t.trnseq =  ''' + trnSequencial + '''';
  UniConnection1.Open();
  UniQueryTotalSelecionado.Open();
  LblVendaSelecionada.Caption := 'R$' + UniQueryTotalSelecionado.FieldByName
    ('total').AsString;

end;

end.
